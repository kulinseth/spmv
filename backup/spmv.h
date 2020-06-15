#ifndef SPMV_H_
#define SPMV_H_

#include<stdio.h>
#include<math.h>
#include<time.h>
#include <cstdint>
#define Value float
#define Index int
#define FORMAT "%f"
#define MYEPSILON FLT_EPSILON

typedef struct spmv_struct {
  Index *ptr, *ind;
  Index start_row, end_row;
  Index n, N;
  Value *data, *x, *y;
} spmv_struct;

typedef void(*spmv_fn)(spmv_struct *sp);

enum spmv_algorithm_t : int {
   SPMV_ALGORITHM_COO = 1,
   SPMV_ALGORITHM_CSR = 2,
   SPMV_ALGORITHM_DIA = 3,
   SPMV_ALGORITHM_ELL = 4,
};

typedef struct spmv_pthread_struct {
  int tid;
  int inside_max, len;
  spmv_fn fn;
  spmv_struct *sp;
} spmv_pthread_struct;

typedef struct spmv_coo_struct {
  int tid;
  int nz, N;
  int len;
  int inside_max;
  int *row, *col;
  Value *data, *x, *y;
}spmv_coo_struct;


typedef struct spmv_csr_struct{
  int tid;
  int nz, N;
  int len;
  int inside_max;
  int *rowptr, *col;
  Value *val, *x, *y;
}spmv_csr_struct;


typedef struct spmv_dia_struct{
  int tid;
  int start_row, end_row;
  int nd, stride, N;
  int len;
  int inside_max;
  int *offset;
  Value *data, *x, *y;
}spmv_dia_struct;

typedef struct spmv_ell_struct{
  int tid;
  int start_row, end_row;
  int nc, N;
  int inside_max;
  int *indices;
  Value *data, *x, *y;
}spmv_ell_struct;

//template<typename Index, typename Value>
void spmv_coo(spmv_struct *sp);
void spmv_csr(spmv_struct *sp);
void spmv_dia(spmv_struct *sp);
void spmv_ell(spmv_struct *sp);

void sort_coo(int start, int end, int *array1, int *array2, Value *array3);
void quickSort(int arr[], int arr2[], Value arr3[], int low, int high);
void init_arr(int N, Value* a);
void zero_arr(int N, Value* a);
void cmp(Value *y, Value *y1, int N);
void print_arr(int N, char * name, double* array);
void sort(int start, int end, int *array1, Value *array2);
int fletcher_sum(Value *a, int size);
int fletcher_sum_1d_array_int(int *a, int size);
void coo_csr(int nz, int N, int *row, int *col, Value *coo_val, int *row_ptr, int *colind, Value *csr_val);
void csr_dia(int *row_ptr, int *colind, Value *val, int **offset, Value **data, int N, int* nd, int *stride, int nnz);
void csr_ell(int *row_ptr, int *colind, Value *val, int **indices, Value **data, int N, int* nc, int nnz);
void csr_custom(int *row_ptr, int *colind, Value *val, int **offset, Value **data, int N, int* nd, int **ptr);

#endif  // SPMV_H_

