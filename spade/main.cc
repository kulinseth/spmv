#include "utils.h"
#include "mmio.h"

template <typename IndexType, typename ValueType>
class SpadeSpmv
{
public:
    SpadeSpmv(IndexType m, IndexType n) { _m = m; _n = n; }
    int inputCSR(IndexType  nnz, IndexType *csr_row_pointer, IndexType *csr_column_index, ValueType *csr_value);
    int setX(ValueType *x);
    static int spmv_baseline(int m, const ValueType  alpha,
                             ValueType *x, ValueType  *y, IndexType* csr_row_pointer,
                             IndexType* csr_column_index, ValueType* csr_val);
    static int spmv_avx256(int m, const ValueType  alpha,
                             ValueType *x, ValueType  *y, IndexType* csr_row_pointer,
                             IndexType* csr_column_index, ValueType* csr_val);
private:
    int _format;
    IndexType _m;
    IndexType _n;
    IndexType _nnz;

    IndexType *_csr_row_pointer;
    IndexType *_csr_column_index;
    ValueType *_csr_value;

    int         _bit_y_offset;
    int         _num_packet;
    IndexType _p;

    IndexType   _num_offsets;
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

template <class IndexType, class ValueType>
int SpadeSpmv<IndexType, ValueType>::spmv_avx256(int M, const ValueType  alpha,
                                                  ValueType *x, ValueType  *y, IndexType* csr_row_pointer,
                                                  IndexType* csr_column_index, ValueType* csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;

    ValueType temp;
    ValueType *yp;
    IndexType i;
    int incy = 4;
    // Still need to loop through all the rows, which are cache aligned
    for(i = 0, yp = y; i < M ; i++, yp += 1*incy) {
      __m256d _y0 = _mm256_setzero_pd();
      for(IndexType j = csr_row_pointer[i]; j < csr_row_pointer[i+1]; j++, csr_value += 1) {
        IndexType j0 = csr_column_index[j];
        __m256d _x0 = _mm256_loadu_pd(x + j0);
        _y0 = _mm256_add_pd(_y0, _mm256_mul_pd(_x0, _mm256_loadu_pd(csr_value)));
      }

      ValueType a_vector[4] = {alpha, alpha, alpha, alpha};
      __m256d alpha_simd = _mm256_load_pd(&a_vector[0]);
      _y0 = _mm256_mul_pd(_y0, alpha_simd);

      ValueType R[4] __attribute((aligned(32)));
      _mm256_storeu_pd((&R[0]), y0);
      yp[0] += R[0];
    }
    return err;
}

template <class IndexType, class ValueType>
int SpadeSpmv<IndexType, ValueType>::spmv_baseline(int m, const ValueType  alpha,
                                                  ValueType *x, ValueType  *y, IndexType* csr_row_pointer,
                                                  IndexType* csr_column_index, ValueType* csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;

    IndexType i, j;
    ValueType temp;
    for(i = 0; i < m ; i++) {
      temp = 0;
      for(j = csr_row_pointer[i]; j < csr_row_pointer[i+1]; j++){
        temp += csr_value[j] * x[csr_column_index[j]] * alpha;
      }
      y[i] = temp;
    }
    return err;
}

template<typename IndexType, typename ValueType>
using Spmv = int (*)(int m, const ValueType  alpha,
                    ValueType *x, ValueType  *y, IndexType* csr_row_pointer,
                    IndexType* csr_column_index, ValueType* csr_val);

int compute_spmv(int m, int n, int nnzA,
                  int *csrRowPtrA, int *csrColIdxA, VALUE_TYPE *csrValA,
                  VALUE_TYPE *x, VALUE_TYPE *y, VALUE_TYPE *y_ref, VALUE_TYPE alpha,
                  Spmv<int, double> spmv)
{

  int err = 0;
    memset(y, 0, sizeof(VALUE_TYPE) * m);

    double gb = getB<int, VALUE_TYPE>(m, nnzA);
    double gflop = getFLOP<int>(nnzA);


    VALUE_TYPE *y_bench = (VALUE_TYPE *)malloc(m * sizeof(VALUE_TYPE));

    err = spmv(m, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);

    if (NUM_RUN)
    {
        for (int i = 0; i < 50; i++)
            err = spmv(m, alpha, x, y_bench, csrRowPtrA, csrColIdxA, csrValA);

        anonymouslib_timer CSR5Spmv_timer;
        CSR5Spmv_timer.start();
        for (int i = 0; i < NUM_RUN; i++) {
         err = spmv(m, alpha, x, y_bench, csrRowPtrA, csrColIdxA, csrValA);
        }

        double CSR5Spmv_time = CSR5Spmv_timer.stop() / (double)NUM_RUN;

        cout << "CSR Baseline SpMV time = " << CSR5Spmv_time
             << " ms. Bandwidth = " << gb/(1.0e+6 * CSR5Spmv_time)
             << " GB/s. GFlops = " << gflop/(1.0e+6 * CSR5Spmv_time)  << " GFlops." << endl;
    }

     int error_count = 0;
     for (int i = 0; i < m; i++)
         if (abs(y_ref[i] - y[i]) > 0.01 * abs(y_ref[i]))
         {
             error_count++;
   //            cout << "ROW [ " << i << " ], NNZ SPAN: "
   //                 << csrRowPtrA[i] << " - "
   //                 << csrRowPtrA[i+1]
   //                 << "\t ref = " << y_ref[i]
   //                 << ", \t csr5 = " << y[i]
   //                 << ", \t error = " << y_ref[i] - y[i]
   //                 << endl;
   //            break;
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
  int *csrRowPtrA;
  int *csrColIdxA;
  VALUE_TYPE *csrValA;

  //ex: ./spmv webbase-1M.mtx
  int argi = 1;

  char  *filename;
  if(argc > 1) {
    filename = argv[argi];
    argi++;
  } else {
    std::cout << "Usage : ./spmv <webbase-1M.mtx" << std::endl;
  }
  cout << "--------------" << filename << "--------------" << endl;

  // read matrix from mtx file
  int ret_code;
  MM_typecode matcode;
  FILE *f;

  int nnzA_mtx_report;
  int isInteger = 0, isReal = 0, isPattern = 0, isSymmetric = 0;

  // load matrix
  if ((f = fopen(filename, "r")) == NULL)
      return -1;

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
  }

  cout << " ( " << m << ", " << n << " ) nnz = " << nnzA << endl;

  VALUE_TYPE *x = (VALUE_TYPE *)_mm_malloc(n * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
  for (int i = 0; i < n; i++)
      x[i] = rand() % 10;

  VALUE_TYPE *y = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
  VALUE_TYPE *y_ref = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);

  double gb = getB<int, VALUE_TYPE>(m, nnzA);
  double gflop = getFLOP<int>(nnzA);

  VALUE_TYPE alpha = 1.0;

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

  int err = 0;
  SpadeSpmv<int, VALUE_TYPE> A(m, n);
  err = A.inputCSR(nnzA, csrRowPtrA, csrColIdxA, csrValA);
  err = A.setX(x); // you only need to do it once!
  cout << "setX err = " << err << endl;
  // launch compute
  compute_spmv(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha,
                &SpadeSpmv<int, VALUE_TYPE>::spmv_baseline);
  compute_spmv(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha,
                &SpadeSpmv<int, VALUE_TYPE>::spmv_avx256);

  // compare reference and anonymouslib results

  _mm_free(csrRowPtrA);
  _mm_free(csrColIdxA);
  _mm_free(csrValA);
  _mm_free(x);
  _mm_free(y);
  _mm_free(y_ref);

  return 0;

}
