#ifdef MKL_EXISTS

#include <mkl.h>

void spmv_mkl(double* __restrict v, double* __restrict w) {
  double alpha = 1.0;
  double beta = 1.0;
  int *ptrb = matrix->rows;
  int *ptre = matrix->rows + 1;
  char trans[] = "N";
  char matdescra[] = "G__C";
  int mkl_n = matrix->n;
  int mkl_m = matrix->m;
  
  mkl_dcsrmv(trans, &mkl_n, &mkl_m, &alpha, matdescra,
             matrix->vals, matrix->cols, ptrb, ptre, v, &beta, w);
}

#else

void MKL::spmv(double* __restrict v, double* __restrict w) {
  cerr << "MKL is not supported on this platform.\n";
  exit(1);
}

void MKL::init(Matrix *csrMatrix, unsigned int numThreads) {
  cerr << "MKL is not supported on this platform.\n";
  exit(1);
}

#endif
