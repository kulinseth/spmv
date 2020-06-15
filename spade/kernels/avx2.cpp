#include "../utils.h"

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
int spmv_avx2(int m, int n,  ValueType  alpha,
                ValueType * x, ValueType  *y,  IndexType*  csr_row_pointer,
                IndexType*  csr_column_index,  ValueType*  csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;
#if __AVX2__
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
#endif
    return err;
}

int compute_avx2(int m, int n, int nnzA,
                   int *  csrRowPtrA,  int *  csrColIdxA,
                   VALUE_TYPE *  csrValA,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha)
{

  int err = 0;
  memset(y, 0, sizeof(VALUE_TYPE) * m);

  double gb = getB<int, VALUE_TYPE>(m, nnzA);
  double gflop = getFLOP<int>(nnzA);

  VALUE_TYPE *y_bench = (VALUE_TYPE *)malloc(m * sizeof(VALUE_TYPE));

  err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
          err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
       err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
      }

      double CSR5Spmv_time = CSR5Spmv_timer.stop() / (double)NUM_RUN;

      double gb_bw = gb/(1.0e+6 * CSR5Spmv_time);
      double gb_flops = gflop/(1.0e+6 * CSR5Spmv_time);
      std::cout << "CSR SpMV time = " << CSR5Spmv_time
           << " ms. Bandwidth = " << gb_bw
           << " GB/s. GFlops = " << gb_flops  << " GFlops." << std::endl;
      outf << CSR5Spmv_time << "," << gb_bw << "," << gb_flops << ",";
  }

  int error_count = 0;
  for (int i = 0; i < m; i++) {
      if (abs(y_ref[i] - y[i]) > 0.01 * abs(y_ref[i])) {
          error_count++;
#if DEBUG
            std::cout << "ROW [ " << i << " ], NNZ SPAN: "
                 << csrRowPtrA[i] << " - "
                 << csrRowPtrA[i+1]
                 << " ref = " << y_ref[i]
                 << ", calc = " << y[i]
                 << std::endl;
#endif
      }
  }

  if (error_count == 0)
      std::cout << "Check... PASS!" << std::endl;
  else
      std::cout << "Check... NO PASS! #Error = " << error_count << " out of " << m << " entries." << std::endl;

  std::cout << "------------------------------------------------------" << std::endl;
  free(y_bench);
  return err;
}

