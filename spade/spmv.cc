#include "spmv.h"

//template<typename Index, typename Value>
//void spmv_coo(Index *rowind, Index *colind, Value *val, Index start_row, Index end_row,
              //Index nz, Index N, Index stride, Value *x, Value *y)
void spmv_coo(spmv_struct *sp)
{
  // ptr is row_index
  // col is col_index
  for(Index i = 0; i < sp->n ; i++)
    sp->y[sp->ptr[i]] += sp->data[i] * sp->x[sp->ind[i]];
}


//template<typename Index, typename Value>
//void spmv_csr(Index *row_ptr, Index *colind, Value *val, Index start_row, Index end_row,
              //Index n, Index N, Index stride, Value *x, Value *y)
void spmv_csr(spmv_struct *sp)
{
  for(Index i = 0; i < sp->N ; i++)
  {
    Value temp = sp->y[i];
    for(Index j = sp->ptr[i]; j < sp->ptr[i+1]; j++){
      temp += sp->data[j] * sp->x[sp->ind[j]] ;
    }
    sp->y[i] = temp;
  }
}

//template<typename Index, typename Value>
//void spmv_dia(Index *offset, Index *ptr, Value *data, Index start_row, Index end_row,
              //Index nd, Index N, Index stride, Value *x, Value *y)
void spmv_dia(spmv_struct *sp)
{
  for(Index row = sp->start_row; row < sp->end_row; row++){
    Index nd = sp->n;
    for(Index i = 0; i < nd; i++){
      Index col = sp->ptr[i] + row;
      if(col >=0 && col < sp->N){
        sp->y[row] += (sp->data[row*nd+i] * sp->x[col]);
      }
    }
  }
}

//template<typename Index, typename Value>
//void spmv_ell(Index *offset, Index *indices, Value *data, Index start_row, Index end_row,
              //Index nc, Index N, Index stride, Value *x, Value *y)
void spmv_ell (spmv_struct *sp)
{
  for(Index row = sp->start_row; row < sp->end_row; row++){
    for(Index i = 0; i < sp->n; i++){
      Index col = sp->ind[(size_t)row*sp->n+i];
      if(col < 0) break;
      sp->y[row] += (sp->data[(size_t)row*sp->n+i] * sp->x[col]);
    }
  }
}
