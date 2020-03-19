#include "spmv.h"

//template<typename Index, typename Value>
void spmv_coo(Index *rowind, Index *colind, Value *val, int nz, Index N, Value *x, Value *y)
{
  int i;
  for(i = 0; i < nz ; i++)
    y[rowind[i]] += val[i] * x[colind[i]];
}


//template<typename Index, typename Value>
void spmv_csr(Index *row_ptr, Index *colind, Value *val, Index N, Value *x, Value *y)
{
  Index i, j;
  Value temp;
  for(i = 0; i < N ; i++)
  {
    temp = y[i];
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      temp += val[j] * x[colind[j]] ;
    }
    y[i] = temp;
  }
}

//template<typename Index, typename Value>
void spmv_dia(Index *offset, Value *data, Index start_row, Index end_row, Index nd, Index N, Index stride, Value *x, Value *y)
{
  Index i, row;
  Index col;
  for(row = start_row; row < end_row; row++){
    for(i = 0; i < nd; i++){
      col = offset[i] + row;
      if(col >=0 && col < N){
        y[row] += (data[(size_t)row*nd+i] * x[col]);
      }
    }
  }
}

//template<typename Index, typename Value>
//void spmv_custom(Index *offset, Value *data, Index N, Index nd, Index *ptr, Value *x, Value *y)
//{
  //Index i, k, n, istart, iend, index;

  //index = 0;
  //for(i = 0; i < nd; i++){
    //k = offset[i];
    //istart = (0 < -k) ? -k : 0;
    //iend = (N-1 < N-1-k) ? N-1 : N-1-k;
    //for(n = istart; n <= iend; n++){
      //y[n] += (data[index++] * x[n+k]);
    //}
  //}
//}

//template<typename Index, typename Value>
void spmv_diaii(Index *offset, Value *data, Index start_row, Index end_row, Index nd, Index N, Index stride, Value *x, Value *y)
{
  Index i, k, n, istart, iend, index;

  for(i = 0; i < nd; i++){
    k = offset[i];
    index = 0;
    istart = (0 < -k) ? index = N-stride, -k : 0;
    istart = (istart > start_row) ? istart : start_row;
    iend = (N-1 < N-1-k) ? N-1 : N-1-k;
    iend = (iend < end_row) ? iend : end_row;
    for(n = istart; n <= iend; n++){
      y[n] += (data[(size_t)i*stride+n-index] * x[n+k]);
    }
  }
}

//template<typename Index, typename Value>
void spmv_ell(Index *indices, Value *data, Index start_row, Index end_row, Index nc, Index N, Value *x, Value *y)
{
  Index i, row;
  Index col;
  for(row = start_row; row < end_row; row++){
    for(i = 0; i < nc; i++){
      col = indices[(size_t)row*nc+i];
      if(col < 0)
        break;
      y[row] += (data[(size_t)row*nc+i] * x[col]);
    }
  }
}

//template<typename Index, typename Value>
void spmv_ellii(Index *indices, Value *data, Index start_row, Index end_row, Index nc, Index N, Value *x, Value *y)
{
  Index i, row;
  Index col;
  for(i = 0; i < nc; i++){
    for(row = start_row; row < end_row; row++){
      col = indices[(size_t)i*N+row];
      if(col >= 0)
        y[row] += data[(size_t)i*N+row] * x[indices[(size_t)i*N+row]];
    }
  }
}

