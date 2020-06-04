#include "utils.h"
#include "mmio.h"
#include <fstream>
#if MKL
#include <mkl.h>
#include <mkl_spblas.h>
#endif
#include <string>
using namespace std;

std::ofstream outf;

template <typename IndexType, typename ValueType>
class SpadeSpmv
{
public:
    SpadeSpmv(IndexType m, IndexType n) { _m = m; _n = n; }
    int inputCSR(IndexType  nnz, IndexType *csr_row_pointer, IndexType *csr_column_index, ValueType *csr_value);
    int setX(ValueType *x);
    static int spmv_baseline(int m, int n, ValueType  alpha,
                              ValueType * x, ValueType  *y,
                              IndexType*  csr_row_pointer,
                              IndexType*  csr_column_index,  ValueType*  csr_val);
    static int spmv_avx256(int m, int n,  ValueType  alpha,
                              ValueType *  x, ValueType  *y,
                              IndexType*  csr_row_pointer,
                              IndexType*  csr_column_index,  ValueType*  csr_val);
private:
    int _format;
    IndexType _m;
    IndexType _n;
    IndexType _nnz;

    IndexType *_csr_row_pointer;
    IndexType *_csr_column_index;
    ValueType *_csr_value;
    ValueType   *_x;
};

template <class IndexType, class ValueType>
int SpadeSpmv<IndexType, ValueType>::inputCSR(IndexType  nnz,
                                              IndexType *csr_row_pointer,
                                              IndexType *csr_column_index,
                                              ValueType *csr_value)
{
    _format = ANONYMOUSLIB_FORMAT_CSR;
    _nnz = nnz;

    _csr_row_pointer  = csr_row_pointer;
    _csr_column_index = csr_column_index;
    _csr_value        = csr_value;

    return ANONYMOUSLIB_SUCCESS;
}

template <class IndexType, class ValueType>
int SpadeSpmv<IndexType, ValueType>::setX(ValueType *x)
{
    int err = ANONYMOUSLIB_SUCCESS;
    _x = x;
    return err;
}

#if MKL
template <class IndexType, class ValueType>
void spmv_mkl(int m, int n,  ValueType  alpha,
             ValueType *  x, ValueType * y, sparse_matrix_t A, matrix_descr desr)
{
    mkl_sparse_d_mv(SPARSE_OPERATION_NON_TRANSPOSE, alpha, A, desr, x, 0.0f, y);
}

int compute_mkl(int m, int n, int nnzA,
                   int *  csr_row_pointer,  int *  csr_column_index,
                   VALUE_TYPE *  csr_value,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha)
{

  memset(y, 0, sizeof(VALUE_TYPE) * m);

  double gb = getB<int, VALUE_TYPE>(m, nnzA);
  double gflop = getFLOP<int>(nnzA);

  VALUE_TYPE *y_bench = (VALUE_TYPE *)malloc(m * sizeof(VALUE_TYPE));
  sparse_matrix_t A;
  sparse_status_t err;
  err = mkl_sparse_d_create_csr(&A, SPARSE_INDEX_BASE_ZERO, m, n, csr_row_pointer, csr_row_pointer+1, csr_column_index, csr_value);
  if (err != SPARSE_STATUS_SUCCESS) {
     return 1;
  }

  matrix_descr desr;
  desr.type = SPARSE_MATRIX_TYPE_GENERAL;
  err = mkl_sparse_set_mv_hint(A, SPARSE_OPERATION_NON_TRANSPOSE, desr, 10*NUM_RUN);
  err = mkl_sparse_set_memory_hint(A, SPARSE_MEMORY_AGGRESSIVE);
  err = mkl_sparse_optimize(A);

  spmv_mkl<int, VALUE_TYPE>(m, n, alpha, x, y, A, desr);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
         spmv_mkl<int, VALUE_TYPE>(m, n, alpha, x, y, A, desr);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
         spmv_mkl<int, VALUE_TYPE>(m, n, alpha, x, y, A, desr);
      }

      double CSR5Spmv_time = CSR5Spmv_timer.stop() / (double)NUM_RUN;

      double gb_bw = gb/(1.0e+6 * CSR5Spmv_time);
      double gb_flops = gflop/(1.0e+6 * CSR5Spmv_time);
      cout << "CSR SpMV time = " << CSR5Spmv_time
           << " ms. Bandwidth = " << gb_bw
           << " GB/s. GFlops = " << gb_flops  << " GFlops." << endl;
      outf << CSR5Spmv_time << "," << gb_bw << "," << gb_flops << ",";
  }

  int error_count = 0;
  for (int i = 0; i < m; i++) {
      if (abs(y_ref[i] - y[i]) > 0.01 * abs(y_ref[i])) {
          error_count++;
#if DEBUG
            cout << "ROW [ " << i << " ], NNZ SPAN: "
                 << csrRowPtrA[i] << " - "
                 << csrRowPtrA[i+1]
                 << " ref = " << y_ref[i]
                 << ", calc = " << y[i]
                 << endl;
#endif
      }
  }

  if (error_count == 0)
      cout << "Check... PASS!" << endl;
  else
      cout << "Check... NO PASS! #Error = " << error_count << " out of " << m << " entries." << endl;

  cout << "------------------------------------------------------" << endl;
  free(y_bench);
  return err;
}
#endif

void print_val(__m256d val) {
  double tmp[4];
  _mm256_storeu_pd(&tmp[0], val);
  printf("%lf, %lf, %lf, %lf\n", tmp[0], tmp[1], tmp[2], tmp[3]);
}

static inline double m256_reduce_sum1(__m256d a) {
  double res;
  a = _mm256_add_pd(a, _mm256_permute2f128_pd(a, a, 0x1));
  _mm_store_sd(&res, _mm_hadd_pd( _mm256_castpd256_pd128(a), _mm256_castpd256_pd128(a)));
  return res;
}

template <typename IndexType, typename ValueType>
void print_csr_vals(const IndexType *const row_ptr, const IndexType *const col_ind,  ValueType * const vals) {

}

template <typename IndexType, typename ValueType>
int SpadeSpmv<IndexType, ValueType>::spmv_avx256(int m, int n,  ValueType  alpha,
                                                   ValueType * x, ValueType  *y,  IndexType*  csr_row_pointer,
                                                   IndexType*  csr_column_index,  ValueType*  csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;
#if DEBUG
    print_csr_vals<IndexType, ValueType>(csr_row_pointer, csr_column_index, csr_value);
    std::cout << "m " << m << std::endl;
    std::cout << "Row ptr : ";
#endif
    ValueType temp;
    // Still need to loop through all the rows, which are cache aligned
    for(IndexType i = 0; i < m ; i++) {
      temp = 0.0;
      __m256d _y0 = _mm256_setzero_pd();
      IndexType j = csr_row_pointer[i];
      IndexType row_ptr_upper = csr_row_pointer[i+1] ;
#if DEBUG
      std::cout << "Row ptr[ " << i << "] " << "(" << j <<  ", " << row_ptr_upper << ") ";
#endif
      while(j < (row_ptr_upper-3)) {
        //IndexType j0 = csr_column_index[j], j1 = csr_column_index[j+1], j2 = csr_column_index[j+2], j3 = csr_column_index[j+3];
        //__m256d _x0 = _mm256_set_pd(x[j3], x[j2], x[j1], x[j0]);

        // This is the gather implementation which is slightly faster.
        __m128i vIdx = _mm_set_epi32(csr_column_index[j+3], csr_column_index[j+2], csr_column_index[j+1],
                                      csr_column_index[j]);
        __m256d _x0 = _mm256_i32gather_pd(x, vIdx, 8);
        __m256d _vals = _mm256_load_pd(&csr_value[j]);
        _y0 = _mm256_fmadd_pd(_x0, _vals, _y0);
#if DEBUG
        std::cout << "Col Idx (" << csr_column_index[j] << ", " << csr_column_index[j+1]  << ", " << csr_column_index[j+2] << ", " << csr_column_index[j+3] <<") ";
        print_val(_vals);
        print_val(_y0);
#endif
        j += 4;
      }
      while (j < row_ptr_upper) {
        temp += x[csr_column_index[j]]*csr_value[j];
        j++;
      }

      y[i] = m256_reduce_sum1(_y0)+temp;
    }

    return err;
}

template <class IndexType, class ValueType>
int SpadeSpmv<IndexType, ValueType>::spmv_baseline(int m, int n,  ValueType  alpha,
                                                   ValueType *  x, ValueType  *y,  IndexType*  csr_row_pointer,
                                                   IndexType*  csr_column_index,  ValueType*  csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;

    IndexType i, j;
    ValueType temp;
    for(i = 0; i < m ; i++) {
      temp = 0;
#if DEBUG
      cout << " Row " << csr_row_pointer[i] << ", " << csr_row_pointer[i+1] << endl;
      cout << "Vals, index " << endl;
#endif
      for(j = csr_row_pointer[i]; j < csr_row_pointer[i+1]; j++){
#if DEBUG
        cout << csr_value[j] << ", " << x[csr_column_index[j]] << ", " << csr_column_index[j] << endl;
#endif
        temp += csr_value[j] * x[csr_column_index[j]];
      }
      y[i] = temp;
    }
    return err;
}

template<typename IndexType, typename ValueType>
using Spmv = int (*)(int m, int n,  ValueType  alpha,
                     ValueType *  x, ValueType  *y,  IndexType*  csr_row_pointer,
                     IndexType*  csr_column_index,  ValueType*  csr_val);


int compute_spmv(int m, int n, int nnzA,
                   int *  csrRowPtrA,  int *  csrColIdxA,
                   VALUE_TYPE *  csrValA,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha,
                  Spmv<int, double> spmv)
{

  int err = 0;
  memset(y, 0, sizeof(VALUE_TYPE) * m);

  double gb = getB<int, VALUE_TYPE>(m, nnzA);
  double gflop = getFLOP<int>(nnzA);

  VALUE_TYPE *y_bench = (VALUE_TYPE *)malloc(m * sizeof(VALUE_TYPE));

  err = spmv(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
          err = spmv(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
       err = spmv(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
      }

      double CSR5Spmv_time = CSR5Spmv_timer.stop() / (double)NUM_RUN;

      double gb_bw = gb/(1.0e+6 * CSR5Spmv_time);
      double gb_flops = gflop/(1.0e+6 * CSR5Spmv_time);
      cout << "CSR SpMV time = " << CSR5Spmv_time
           << " ms. Bandwidth = " << gb_bw
           << " GB/s. GFlops = " << gb_flops  << " GFlops." << endl;
      outf << CSR5Spmv_time << "," << gb_bw << "," << gb_flops << ",";
  }

  int error_count = 0;
  for (int i = 0; i < m; i++) {
      if (abs(y_ref[i] - y[i]) > 0.01 * abs(y_ref[i])) {
          error_count++;
#if DEBUG
            cout << "ROW [ " << i << " ], NNZ SPAN: "
                 << csrRowPtrA[i] << " - "
                 << csrRowPtrA[i+1]
                 << " ref = " << y_ref[i]
                 << ", calc = " << y[i]
                 << endl;
#endif
      }
  }

  if (error_count == 0)
      cout << "Check... PASS!" << endl;
  else
      cout << "Check... NO PASS! #Error = " << error_count << " out of " << m << " entries." << endl;

  cout << "------------------------------------------------------" << endl;
  free(y_bench);
  return err;
}

int main(int argc, char* argv[])
{
  // report precision of floating-point
  std::cout << "------------------------------------------------------" << endl;
  if (sizeof(VALUE_TYPE) == 4) {
    std::cout << "32-bit Single Precision";
  }
  else if (sizeof(VALUE_TYPE) == 8) {
    std::cout << "64-bit Double Precision";
  }
  else {
    std::cout << "Wrong precision. Program exit!" << endl;
    return 0;
  }
  cout << "------------------------------------------------------" << endl;

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
    std::cout << "Usage : ./spmv <webbase-1M.mtx" << std::endl;
    std::cout << "Running a test mtx matrix " << std::endl;

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
      cout << "y_ref ";
#endif
      for (int i = 0; i < m; i++)
      {
          VALUE_TYPE sum = 0;
          for (int j = csrRowPtr[i]; j < csrRowPtr[i+1]; j++)
              sum += x[csrColIdx[j]] * csrVal[j] * alpha;
          y_ref[i] = sum;
#if DEBUG
          cout << sum << ", ";
#endif
      }

      SpadeSpmv<int, VALUE_TYPE> A(m, n);
      err = A.inputCSR(nnzA, csrRowPtr, csrColIdx, csrVal);
      err = A.setX(x); // you only need to do it once!
      compute_spmv(m, n, nnzA, csrRowPtr, csrColIdx, csrVal, x, y, y_ref, alpha,
                    &SpadeSpmv<int, VALUE_TYPE>::spmv_avx256);
    }
    return 0;
  }
  cout << "--------------" << filename << "--------------" << endl;
  outf << "Name,Baseline ms,Baseline BW, Baseline GFlops,SPADE ms, SPADE BW, SPADE GFLOPs,";
#if MKL
  outf << "MKL ms, MKL BW, MKL GFLOPs";
#endif
  outf << endl;
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
         cout << "Can't open " << s << endl;
         continue;
     }
     std::string last_element(s.substr(s.rfind("/") + 1));
     outf << last_element << ",";

     if (mm_read_banner(f, &matcode) != 0)
     {
         cout << "Could not process Matrix Market banner." << endl;
         return -2;
     }

     if ( mm_is_complex( matcode ) )
     {
         cout <<"Sorry, data type 'COMPLEX' is not supported. " << endl;
         return -3;
     }

     if ( mm_is_pattern( matcode ) )  { isPattern = 1; /*cout << "type = Pattern" << endl;*/ }
     if ( mm_is_real ( matcode) )     { isReal = 1; /*cout << "type = real" << endl;*/ }
     if ( mm_is_integer ( matcode ) ) { isInteger = 1; /*cout << "type = integer" << endl;*/ }

     /* find out size of sparse matrix .... */
     ret_code = mm_read_mtx_crd_size(f, &m, &n, &nnzA_mtx_report);
     if (ret_code != 0)
         return -4;

     if ( mm_is_symmetric( matcode ) || mm_is_hermitian( matcode ) )
     {
         isSymmetric = 1;
         cout << "symmetric = true" << endl;
     }
     else
     {
         cout << "symmetric = false" << endl;
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

     cout << " ( " << m << ", " << n << " ) nnz = " << nnzA << endl;

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
     cout << "cpu sequential time = " << ref_time
          << " ms. Bandwidth = " << gb/(1.0e+6 * ref_time)
          << " GB/s. GFlops = " << gflop/(1.0e+6 * ref_time)  << " GFlops." << endl << endl;

     SpadeSpmv<int, VALUE_TYPE> A(m, n);
     err = A.inputCSR(nnzA, csrRowPtrA, csrColIdxA, csrValA);
     err = A.setX(x); // you only need to do it once!
     cout << "Baseline " << endl;
     compute_spmv(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha,
                   &SpadeSpmv<int, VALUE_TYPE>::spmv_baseline);
     cout << "Spade AVX baseline " << endl;
     compute_spmv(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha,
                   &SpadeSpmv<int, VALUE_TYPE>::spmv_avx256);
#if MKL
     cout << "MKL " << endl;
     compute_mkl(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
#endif
      outf << endl;
     _mm_free(csrRowPtrA);
     _mm_free(csrColIdxA);
     _mm_free(csrValA);
     _mm_free(x);
     _mm_free(y);
     _mm_free(y_ref);
  }

  return 0;

}
