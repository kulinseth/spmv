#include "utils.h"

// avoids generating denormals in the case of underflow


int spmv_avx2(int m, int n,  VALUE_TYPE  alpha,
                VALUE_TYPE * x, VALUE_TYPE  *y,
                int* csr_row_pointer,
                int*  csr_column_index,
                VALUE_TYPE*  csr_value)
{
    _MM_SET_FLUSH_ZERO_MODE(_MM_FLUSH_ZERO_ON);
    //_mm_setcsr(_mm_getcsr() | 0x8040);
    int err = ANONYMOUSLIB_SUCCESS;
#if __AVX2__
#if DEBUG
    print_csr_vals<int, VALUE_TYPE>(csr_row_pointer, csr_column_index, csr_value);
    std::cout << "m " << m << std::endl;
    std::cout << "Row ptr : ";
#endif
    VALUE_TYPE temp;
    // Still need to loop through all the rows, which are cache aligned
    for(int i = 0; i < m ; i++) {
      temp = 0.0;
      __m256d _y0 = _mm256_setzero_pd();
      __m128d _y1 = _mm_setzero_pd();
      int j = csr_row_pointer[i];
      int row_ptr_upper = csr_row_pointer[i+1];
#if DEBUG
      std::cout << "Row ptr[ " << i << "] " << "(" << j <<  ", " << row_ptr_upper << ") ";
#endif
      //#pragma unroll(4)
      int j0, j1, j2, j3;
      for(;j < (row_ptr_upper-3); j+=4) {
        //j1 = csr_column_index[j+1];
        //j2 = csr_column_index[j+2];
        //j3 = csr_column_index[j+3];

        //__m256d _x0 = _mm256_set_pd(x[j3], x[j2], x[j1], x[j0]);

        // This is the gather implementation which is slightly faster.
        __m128i vIdx = _mm_load_epi32(&csr_column_index[j]);
        __m256d _x0 = _mm256_i32gather_pd(x, vIdx, 8);
        //j0 = csr_column_index[j];
        //__m256d _x0 = _mm256_loadu_pd(x+j0);
        __m256d _vals = _mm256_loadu_pd(&csr_value[j]);
        _y0 = _mm256_fmadd_pd(_x0, _vals, _y0);
#if DEBUG
        std::cout << "Col Idx (" << csr_column_index[j] << ", " << csr_column_index[j+1]  << ", " << csr_column_index[j+2] << ", " << csr_column_index[j+3] <<") ";
        print_val(_vals);
        print_val(_y0);
#endif
      }
      if (j < (row_ptr_upper-1)) {
         j0 = csr_column_index[j];
         j1 = csr_column_index[j+1];
         __m128d _x0 = _mm_set_pd(x[j1], x[j0]);
         __m128d _vals = _mm_loadu_pd(&csr_value[j]);
         _y1 = _mm_fmadd_pd(_x0, _vals, _y1);
         j+=2;
         temp += m128_reduce_sum(_y1);
      }
      if (j < row_ptr_upper) {
        temp += x[csr_column_index[j]]*csr_value[j];
      }

      y[i] = m256_reduce_sum1(_y0)+temp;
    }
#endif
    return err;
}

int spmv_avx512(int m, int n,  VALUE_TYPE  alpha,
                VALUE_TYPE * x, VALUE_TYPE  *y,  int*  csr_row_pointer,
                int*  csr_column_index,  VALUE_TYPE*  csr_value)
{
    int err = ANONYMOUSLIB_SUCCESS;
#if __AVX512__
#if DEBUG
    print_csr_vals<int, VALUE_TYPE>(csr_row_pointer, csr_column_index, csr_value);
    std::cout << "m " << m << std::endl;
    std::cout << "Row ptr : ";
#endif
    VALUE_TYPE temp;
    // Still need to loop through all the rows, which are cache aligned
    for(int i = 0; i < m ; i++) {
      temp = 0.0;
      __m256d _y0 = _mm256_setzero_pd();
      int j = csr_row_pointer[i];
      int row_ptr_upper = csr_row_pointer[i+1];
#if DEBUG
      std::cout << "Row ptr[ " << i << "] " << "(" << j <<  ", " << row_ptr_upper << ") ";
#endif
      while(j < (row_ptr_upper-3)) {
        //int j0 = csr_column_index[j], j1 = csr_column_index[j+1], j2 = csr_column_index[j+2], j3 = csr_column_index[j+3];
        //__m256d _x0 = _mm256_set_pd(x[j3], x[j2], x[j1], x[j0]);

        // This is the gather implementation which is slightly faster.
        __m128i vIdx = _mm_set_epi32(csr_column_index[j+3],
                                     csr_column_index[j+2],
                                     csr_column_index[j+1],
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

