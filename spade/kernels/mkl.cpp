#include "../utils.h"
#include <mkl.h>
#include <mkl_spblas.h>

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

