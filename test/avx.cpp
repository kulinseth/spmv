#include <immintrin.h>
#include <iostream>
#include <cmath>

void ref_add(double* res, const double *a, const double *b, int N) {
  std::cout << "{";
  for (int i = 0; i < N; i++) {
    res[i] = a[i] + b[i];
    std::cout << "(" << a[i] << ", " << b[i] << ")" << "," << res[i] << " ";
  }
  std::cout << "}" << std::endl;
  return;
}

void print_val(__m256d val) {
  double tmp[4];
  _mm256_storeu_pd(&tmp[0], val);
  printf("a is %lf, %lf, %lf, %lf\n", tmp[0], tmp[1], tmp[2], tmp[3]);
}

void simd_add(double *res, const double *a, const double *b, int N) {
  int i = 0;
  for(; i+4 < N ; i+=4) {
    __m256d aval = _mm256_loadu_pd(a+i);
    __m256d bval = _mm256_loadu_pd(b+i);
    __m256d res_val = _mm256_add_pd(aval, bval);
    _mm256_storeu_pd(&res[i], res_val);
  }
  for (; i < N; ++i) {
    res[i] = a[i] + b[i];
  }
  return;
}

void ref_fma(double* res, const double *a, const double *b, int N) {
  std::cout << "{";
  for (int i = 0; i < N; i++) {
    res[i] += a[i] * b[i];
    std::cout << "(" << a[i] << ", " << b[i] << ")" << "," << res[i] << " ";
  }
  std::cout << "}" << std::endl;
  return;
}
void simd_fma(double *res, const double *a, const double *b, int N) {

}

void generate(double *v, int N) {
  for (int i = 0; i < N ; i++) {
    v[i] = static_cast<double>(rand()/static_cast<double>(RAND_MAX));
    //v[i] = static_cast<double>(i);
  }
}

void check(const double *a, const double *b, int N) {

  for (int i = 0; i < N; i++) {
    if (fabs(a[i]- b[i]) > 1e-6) {
      std::cout << "It failed i " << i << "ref " << a[i] << " result " << b[i] << std::endl;
      return;
    }
  }
  std::cout << "It works" << std::endl;
}


int main() {
  int N = 10;
  double *a = (double *)malloc(N*sizeof(double));
  double *b = (double *)malloc(N*sizeof(double));
  double *ref_result = (double *)malloc(N*sizeof(double));
  double *avx2_result = (double *)malloc(N*sizeof(double));
  generate(a, N);
  generate(b, N);

  ref_add(ref_result, a, b, N);
  simd_add(avx2_result, a, b, N);

  check(ref_result, avx2_result, N);
  return 0;
}
