#include "spmv_csr.h"
#include "config.h"


void spmv_csr(int *row_ptr, int *colind, MYTYPE *val, int N, MYTYPE *x, MYTYPE *y)
{
  int i, j;
  MYTYPE temp0, temp1, temp2, temp3;
  for(i = 0; i < N ; i++)
  {
    temp0 = y[i];
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      temp0 += val[j] * x[colind[j]];
    }
    y[i] = temp0;
  }
  /*int I, bval += 2*2;*/
  /*for( I = 0, val = y; I < M; I++, val += 2*incy ) {*/
      /*int K;*/
      /*__m128d _y0;*/
      /*__m128d _y1;*/
      /*_y0 = _mm_setzero_pd();*/
      /*_y1 = _mm_setzero_pd();*/

      /*for( K = row_ptr[I]; K < row_ptr[I+1]; K++, bind++, bval += 2*2 ) {*/
          /*int j0 = bind[0]; [> block's leftmost col index <]*/
          /*const oski_value_t* xp = x + j0;*/

          /*__m128d _x01;*/

          /*__builtin_prefetch(bval + 64, 0, 0);;*/

          /*_x01 = _mm_loadu_pd(xp + 0);*/

          /*_y0 = _mm_add_pd(_y0, _mm_mul_pd(_x01, _mm_loadu_pd(bval + 0)));*/

          /*_y1 = _mm_add_pd(_y1, _mm_mul_pd(_x01, _mm_loadu_pd(bval + 2)));*/

      /*}*/

      /*__m128d alpha_simd;*/
      /*alpha_simd = _mm_load1_pd(&alpha);*/

      /*_y0 = _mm_dp_pd(_y0, alpha_simd, 0x31);*/
      /*_y1 = _mm_dp_pd(_y1, alpha_simd, 0x31);*/

      /*double R[2] __attribute((aligned(16)));*/
      /*_mm_store_pd(R,_y0);*/
      /*val[0*incy] += R[0];*/
      /*_mm_store_pd(R,_y1);*/
      /*val[1*incy] += R[0];*/
  /*}*/
}

void spmv_csr4(int *row_ptr, int *colind, MYTYPE *val, int N, MYTYPE *x, MYTYPE *y)
{

}


