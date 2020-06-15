#include "../utils.h"

template <class IndexType, class ValueType>
void spmv_baseline(int m, int n,  ValueType  alpha,
                  ValueType *  x, ValueType  *y,  IndexType*  csr_row_pointer,
                  IndexType*  csr_column_index,  ValueType*  csr_value)
{
    IndexType i, j;
    ValueType temp;
    for(i = 0; i < m ; i++) {
      temp = 0;
#if DEBUG
      std::cout << " Row " << csr_row_pointer[i] << ", " << csr_row_pointer[i+1] << std::endl;
      std::cout << "Vals, index " << std::endl;
#endif
      for(j = csr_row_pointer[i]; j < csr_row_pointer[i+1]; j++){
#if DEBUG
        std::cout << csr_value[j] << ", " << x[csr_column_index[j]] << ", " << csr_column_index[j] << std::endl;
#endif
        temp += csr_value[j] * x[csr_column_index[j]];
      }
      y[i] = temp;
    }
}

int compute_baseline(int m, int n, int nnzA,
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

  spmv_baseline(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
          spmv_baseline(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
        spmv_baseline(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
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

