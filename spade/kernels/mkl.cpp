#include "utils.h"
#include <mkl.h>
#include <mkl_spblas.h>

void spmv_mkl(int m, int n,  VALUE_TYPE  alpha,
             VALUE_TYPE *  x, VALUE_TYPE * y, sparse_matrix_t A, matrix_descr desr)
{
    mkl_sparse_d_mv(SPARSE_OPERATION_NON_TRANSPOSE, alpha, A, desr, x, 0.0f, y);
}
