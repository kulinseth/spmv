#include "utils.h"
#include "mmio.h"
std::ofstream outf;

static inline
void run_small_test_matrix() {

  /*
   * >>> indptr = np.array([0, 2, 3, 6])
   * >>> indices = np.array([0, 2, 2, 0, 1, 2])
   * >>> data = np.array([1, 2, 3, 4, 5, 6])
   * >>> csr_matrix((data, indices, indptr), shape=(3, 3)).toarray()
   * array([[1, 0, 2],
   *        [0, 0, 3],
   *        [4, 5, 6]])
   * indptr = array([0, 2, 3, 6, 7], dtype=int32)
   * indices = array([0, 2, 2, 0, 1, 2, 3], dtype=int32)
   * val = array([1, 2, 3, 4, 5, 6, 7])
   * array([[1, 0, 2, 0],
   *        [0, 0, 3, 0],
   *        [4, 5, 6, 0],
   *        [0, 0, 0, 7]])
   */
  std::ifstream f("../data/test.csv");
  int m, n, nnzA;
  VALUE_TYPE alpha = 1.0;
  if (f) {
    f >> m >> n >> nnzA;
    int *csrRowPtr = (int *)_mm_malloc((m+1) * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
    VALUE_TYPE *x = (VALUE_TYPE *)_mm_malloc((m+1) * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < m+1; i++) {
      f >> csrRowPtr[i];
      x[i] = 1.0;
    }
    int *csrColIdx = (int *)_mm_malloc(nnzA * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < nnzA; i++) {
      f >> csrColIdx[i];
    }
    VALUE_TYPE *csrVal = (VALUE_TYPE *)_mm_malloc(nnzA * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < nnzA; i++) {
      f >> csrVal[i];
    }

    VALUE_TYPE *y = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    VALUE_TYPE *y_ref = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
#if DEBUG
    std::cout << "y_ref ";
#endif
    for (int i = 0; i < m; i++)
    {
        VALUE_TYPE sum = 0;
        for (int j = csrRowPtr[i]; j < csrRowPtr[i+1]; j++)
            sum += x[csrColIdx[j]] * csrVal[j] * alpha;
        y_ref[i] = sum;
#if DEBUG
        std::cout << sum << ", ";
#endif
    }

    compute_avx2(m, n, nnzA, csrRowPtr, csrColIdx, csrVal, x, y, y_ref, alpha);
  }

}


int main(int argc, char* argv[])
{
  // report precision of floating-point
  std::cout << "------------------------------------------------------" << std::endl;
  if (sizeof(VALUE_TYPE) == 4) {
    std::cout << "32-bit Single Precision";
  }
  else if (sizeof(VALUE_TYPE) == 8) {
    std::cout << "64-bit Double Precision";
  }
  else {
    std::cout << "Wrong precision. Program exit!" << std::endl;
    return 0;
  }
  std::cout << "------------------------------------------------------" << std::endl;

  int m, n, nnzA;

  //ex: ./spmv webbase-1M.mtx
  int argi = 1;
  VALUE_TYPE alpha = 1.0;
  int err = 0;

  char  *filename;
  if(argc > 1) {
    filename = argv[argi++];
    outf.open(argv[argi++]);
    if (!outf.is_open()) return -1;
  } else {
    std::cout << "Usage : ./spmv <test.exp> tmp.csv" << std::endl;
    std::cout << "Running a test mtx matrix " << std::endl;

    return 0;
  }
  std::cout << "--------------" << filename << "--------------" << std::endl;
  outf << "Name,Baseline ms,Baseline BW, Baseline GFlops";
#if __AVX2__
  outf << ",SPADE ms, SPADE BW, SPADE GFLOPs";
#endif
#if MKL
  outf << ",MKL ms, MKL BW, MKL GFLOPs";
#endif
  outf << std::endl;
  std::ifstream in_file(filename);
  std::string s;
  while ( in_file >> s) {
     int *csrRowPtrA;
     int *csrColIdxA;
     VALUE_TYPE *csrValA;
     // read matrix from mtx file
     int ret_code;
     MM_typecode matcode;
     FILE *f;

     int nnzA_mtx_report;
     int isInteger = 0, isReal = 0, isPattern = 0, isSymmetric = 0;

     // load matrix
     if ((f = fopen(s.c_str(), "r")) == NULL) {
         std::cout << "Can't open " << s << std::endl;
         continue;
     }
     std::string last_element(s.substr(s.rfind("/") + 1));
     outf << last_element << ",";

     if (mm_read_banner(f, &matcode) != 0)
     {
         std::cout << "Could not process Matrix Market banner." << std::endl;
         return -2;
     }

     if ( mm_is_complex( matcode ) )
     {
         std::cout <<"Sorry, data type 'COMPLEX' is not supported. " << std::endl;
         return -3;
     }

     if ( mm_is_pattern( matcode ) )  { isPattern = 1; /*cout << "type = Pattern" << std::endl;*/ }
     if ( mm_is_real ( matcode) )     { isReal = 1; /*cout << "type = real" << std::endl;*/ }
     if ( mm_is_integer ( matcode ) ) { isInteger = 1; /*cout << "type = integer" << std::endl;*/ }

     /* find out size of sparse matrix .... */
     ret_code = mm_read_mtx_crd_size(f, &m, &n, &nnzA_mtx_report);
     if (ret_code != 0)
         return -4;

     if ( mm_is_symmetric( matcode ) || mm_is_hermitian( matcode ) )
     {
         isSymmetric = 1;
         std::cout << "symmetric = true" << std::endl;
     }
     else
     {
         std::cout << "symmetric = false" << std::endl;
     }

     int *csrRowPtrA_counter = (int *)calloc((m+1) ,sizeof(int));
     //memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

     int *csrRowIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
     int *csrColIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
     VALUE_TYPE *csrValA_tmp    = (VALUE_TYPE *)malloc(nnzA_mtx_report * sizeof(VALUE_TYPE));

     /* NOTE: when reading in doubles, ANSI C requires the use of the "l"  */
     /*   specifier as in "%lg", "%lf", "%le", otherwise errors will occur */
     /*  (ANSI C X3.159-1989, Sec. 4.9.6.2, p. 136 lines 13-15)            */

     for (int i = 0; i < nnzA_mtx_report; i++)
     {
         int idxi, idxj;
         double fval;
         int ival;

         if (isReal)
             fscanf(f, "%d %d %lg\n", &idxi, &idxj, &fval);
         else if (isInteger)
         {
             fscanf(f, "%d %d %d\n", &idxi, &idxj, &ival);
             fval = ival;
         }
         else if (isPattern)
         {
             fscanf(f, "%d %d\n", &idxi, &idxj);
             fval = 1.0;
         }

         // adjust from 1-based to 0-based
         idxi--;
         idxj--;

         csrRowPtrA_counter[idxi]++;
         csrRowIdxA_tmp[i] = idxi;
         csrColIdxA_tmp[i] = idxj;
         csrValA_tmp[i] = fval;
     }

     if (f != stdin)
         fclose(f);

     if (isSymmetric)
     {
         for (int i = 0; i < nnzA_mtx_report; i++)
         {
             if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i])
                 csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
         }
     }

     // exclusive scan for csrRowPtrA_counter
     int old_val, new_val;

     old_val = csrRowPtrA_counter[0];
     csrRowPtrA_counter[0] = 0;
     for (int i = 1; i <= m; i++)
     {
         new_val = csrRowPtrA_counter[i];
         csrRowPtrA_counter[i] = old_val + csrRowPtrA_counter[i-1];
         old_val = new_val;
     }

     nnzA = csrRowPtrA_counter[m];
     csrRowPtrA = (int *)_mm_malloc((m+1) * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
     memcpy(csrRowPtrA, csrRowPtrA_counter, (m+1) * sizeof(int));
     memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

     csrColIdxA = (int *)_mm_malloc(nnzA * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
     csrValA    = (VALUE_TYPE *)_mm_malloc(nnzA * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);

     if (isSymmetric) {
         for (int i = 0; i < nnzA_mtx_report; i++) {
             if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i]) {
                 int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
                 csrColIdxA[offset] = csrColIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;

                 offset = csrRowPtrA[csrColIdxA_tmp[i]] + csrRowPtrA_counter[csrColIdxA_tmp[i]];
                 csrColIdxA[offset] = csrRowIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
             }
             else {
                 int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
                 csrColIdxA[offset] = csrColIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
             }
         }
     }
     else {
         for (int i = 0; i < nnzA_mtx_report; i++) {
             int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
             csrColIdxA[offset] = csrColIdxA_tmp[i];
             csrValA[offset] = csrValA_tmp[i];
             csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
         }
     }

     // free tmp space
     free(csrColIdxA_tmp);
     free(csrValA_tmp);
     free(csrRowIdxA_tmp);
     free(csrRowPtrA_counter);

     srand(time(NULL));

     // set csrValA to 1, easy for checking floating-point results
     for (int i = 0; i < nnzA; i++)
     {
         csrValA[i] = rand() % 10;
         //csrValA[i] = 1.0;
     }

     std::cout << " ( " << m << ", " << n << " ) nnz = " << nnzA << std::endl;

     VALUE_TYPE *x = (VALUE_TYPE *)_mm_malloc(n * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
     for (int i = 0; i < n; i++)
         x[i] = rand() % 10;

     VALUE_TYPE *y = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
     VALUE_TYPE *y_ref = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);

     double gb = getB<int, VALUE_TYPE>(m, nnzA);
     double gflop = getFLOP<int>(nnzA);


     // compute reference results on a cpu core
     anonymouslib_timer ref_timer;
     ref_timer.start();

     int ref_iter = 1;
     for (int iter = 0; iter < ref_iter; iter++)
     {
         for (int i = 0; i < m; i++)
         {
             VALUE_TYPE sum = 0;
             for (int j = csrRowPtrA[i]; j < csrRowPtrA[i+1]; j++)
                 sum += x[csrColIdxA[j]] * csrValA[j] * alpha;
             y_ref[i] = sum;
         }
     }

     double ref_time = ref_timer.stop() / (double)ref_iter;
     std::cout << "cpu sequential time = " << ref_time
          << " ms. Bandwidth = " << gb/(1.0e+6 * ref_time)
          << " GB/s. GFlops = " << gflop/(1.0e+6 * ref_time)  << " GFlops." << std::endl << std::endl;

     std::cout << "Baseline " << std::endl;
     compute_baseline(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
     std::cout << "Spade AVX baseline " << std::endl;
#if __AVX2__
     compute_avx2(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
#endif
#if MKL
     std::cout << "MKL " << std::endl;
     compute_mkl(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
#endif
      outf << std::endl;
     _mm_free(csrRowPtrA);
     _mm_free(csrColIdxA);
     _mm_free(csrValA);
     _mm_free(x);
     _mm_free(y);
     _mm_free(y_ref);
  }

  return 0;

}
