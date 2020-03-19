#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include<time.h>
#include<errno.h>
#include "mmio.h"
#include "spmv.h"

long long sum_i(int *arr, int n)
{
  int i;
  long long sum = 0;
  for(i = 0; i < n; i++)
    sum += arr[i]; 
  return sum;
}

float mean_i(int *arr, int n)
{
  long long sum = sum_i(arr, n);
  return sum/(float)n;
}

double sum_f(float *arr, int n)
{
  int i;
  double sum = 0.0;
  for(i = 0; i < n; i++)
    sum += arr[i]; 
  return sum;
}

float geo_mean(float *arr, int n){
  float sum = 0;
  int i;

  for(i = 0; i < n; i++)
    sum += log(arr[i]);

  sum /= n;

  return exp(sum);
}

float mean_f(float *arr, int n)
{
  double sum = sum_f(arr, n);
  return sum/n;
}

float sd_i(int *arr, int n, float mean_i)
{
  float var = 0.0;
  int i;
  for(i = 0; i < n; i++){
    var += (mean_i - arr[i]) * (mean_i - arr[i]);
  }
  var = var/n;
  return sqrt(var);
}

float vr_i(int *arr, int n, float mean_i)
{ 
  float var = 0.0;
  int i;
  for(i = 0; i < n; i++){
    var += (mean_i - arr[i]) * (mean_i - arr[i]);
  }
  var = var/n;
  return var;
}

float vr_f(float *arr, int n, float mean_i)
{
  float var = 0.0;
  int i;
  for(i = 0; i < n; i++){
    var += (mean_i - arr[i]) * (mean_i - arr[i]);
  }
  var = var/n;
  return var;
}

float sd_f(float *arr, int n, float mean_i)
{
  float var = 0.0;
  int i;
  for(i = 0; i < n; i++){
    var += (mean_i - arr[i]) * (mean_i - arr[i]);
  }
  var = var/n;
  return sqrt(var);
}

void my_swap(int* a, int* b)
{
  float t = *a;
  *a = *b;
  *b = t;
}

int partition (int arr[], int low, int high) 
{ 
    int pivot = arr[high];    // pivot 
    int i = (low - 1);  // Index of smaller element 
  
    for (int j = low; j <= high- 1; j++) 
    { 
        // If current element is smaller than or 
        // equal to pivot 
        if (arr[j] <= pivot) 
        { 
            i++;    // increment index of smaller element 
            my_swap(&arr[i], &arr[j]); 
        } 
    } 
    my_swap(&arr[i + 1], &arr[high]); 
    return (i + 1); 
} 

void my_quickSort(int arr[], int low, int high) 
{ 
    if (low < high) 
    { 
        /* pi is partitioning index, arr[p] is now 
           at right place */
        int pi = partition(arr, low, high); 
  
        // Separately sort elements before 
        // partition and after partition 
        my_quickSort(arr, low, pi - 1); 
        my_quickSort(arr, pi + 1, high); 
    } 
} 

int median(int *arr, int n)
{
  my_quickSort(arr, 0, n-1);
  return arr[n/2];
}

// This function counts the number of elements in the diagonals of the matrix. 
// It doesn't include the zero padding added to store the diagonals in the 2-D array
long long count_diag_elems(int *row, int *col, MYTYPE *val, int nnz, int N, int *nd)
{
  int i, *ind, num_diag=0, diag_no;
  long long sum = 0;
  ind = (int*)calloc(2*N-1, sizeof(int));
  if(ind == NULL){
    fprintf(stderr, "couldn't allocate ind using calloc\n");
    exit(1);
  }

  for(i = 0; i < nnz ; i++){
    if(!ind[N+col[i]-row[i]-1]++)
      num_diag++;
  }
  *nd =  num_diag;

  diag_no = -((2*N-1)/2);
  for(i=0;i<2*N-1;i++){
    if(ind[i]){
      sum += N - abs(diag_no);
      //printf("%d\n", diag_no);
      if(sum < 0)
        return -1;
    }
    diag_no++;
  }
  return sum;
}
void swap(int* a, int* b) 
{ 
  int t = *a; 
  *a = *b; 
  *b = t; 
}
void swap_val(MYTYPE* a, MYTYPE* b) 
{ 
  MYTYPE t = *a; 
  *a = *b; 
  *b = t; 
}

void quickSort(int arr[], int arr2[], MYTYPE arr3[], int left, int right)
{
  int i = left, j = right;
  int pivot = arr[(left + right) / 2];
  int pivot_col = arr2[(left + right) / 2];
 
  /* partition */
  while(i <= j) {
    while(arr[i] < pivot || (arr[i] == pivot && arr2[i] < pivot_col))
      i++;
    while(arr[j] > pivot || (arr[j] == pivot && arr2[j] > pivot_col))
      j--;
    if(i <= j) {
      swap(&arr[i], &arr[j]); 
      swap(&arr2[i], &arr2[j]); 
      swap_val(&arr3[i], &arr3[j]); 
      i++;
      j--;
    }
  }
 
  /* recursion */
  if(left < j)
    quickSort(arr, arr2, arr3, left, j);
  if (i < right)
    quickSort(arr, arr2, arr3, i, right);
}

void sort_coo(int start, int end, int *array1, int *array2, MYTYPE *array3)
{
  printf("sorting started...\n");
  int i, j, temp;
  MYTYPE temp2;
  for(i = 0; i < end-start-1; i++){
    for(j = start; j < end-i-1; j++){
      if(array1[j] > array1[j+1] || (array1[j] == array1[j+1] && array2[j] > array2[j+1])){
        swap(&array1[j],&array1[j+1]);
        swap(&array2[j],&array2[j+1]);
        swap_val(&array3[j],&array3[j+1]);
      }
    }
  }
  printf("sorting ended...\n");
}

void init_arr(int N, MYTYPE* a)
{	
	int i;
	for (i=0; i<N;i++) {
          a[i] = i;
	}
}
void zero_arr(int N, MYTYPE* a)
{	
	int i;
	for (i=0; i<N;i++) {
          a[i] = 0.0;
	}
}

//print array to std out
void print_arr(int N, char * name, double* array)
{	
	int i,j;	
	printf("\n%s\n",name);
	for (i=0;i<N;i++){
		for (j=0;j<N;j++) {
			printf("%g\t",array[N*i+j]);
		}
		printf("\n");
	}
}

void sort(int start, int end, int *array1, MYTYPE *array2)
{ 
  int i, j;
  for(i = 0; i < end-start-1; i++){
    for(j = start; j < end-i-1; j++){
      if(array1[j] > array1[j+1]){
        swap(&array1[j], &array1[j+1]);
        swap_val(&array2[j],&array2[j+1]);
      }
    }
  }
}

void cmp(MYTYPE *y, MYTYPE *y1, int N)
{
  int i;
  for(i = 0; i < N; i++){
    if(y[i] != y1[i])
      fprintf(stderr, "values don't match at index %d", i);
  }
}

double matlab_modulo(double x, double y) {
    double n = floor(x/y);
    return (x - n*y);
}

int fletcher_sum(MYTYPE *a, int size) {
    double sum1 = 0;
    double sum2 = 0;
    for (int i = 0; i < size; ++i) {
        sum1 = matlab_modulo((sum1 + a[i]),255);
        sum2 = matlab_modulo((sum2 + sum1),255);
    }

    return sum2 * 256 + sum1;
}
int fletcher_sum_1d_array_int(int *a, int size) {
    double sum1 = 0;
    double sum2 = 0;
    for (int i = 0; i < size; ++i) {
        sum1 = matlab_modulo((sum1 + a[i]),255);
        sum2 = matlab_modulo((sum2 + sum1),255);
    }

    return sum2 * 256 + sum1;
}

/*int create_blocks(int start, int end, int *array){
  int i = start;
  int num_blocks = 0;
  while(i < end - 1){
    start_block = i;
    num_blocks++;
    i++;
    while(i < end -1 && array[i] == array[i-1] + 1){
      i++;
    }
  }
  if(i == end - 1 && array[i] != array[i-1] + 1)
    num_blocks++;
  return num_blocks;
}*/

/*void csr_bcsr(int nz, int N, int *row_ptr, int *colind, MYTYPE *csr_val)
{
  for(i=0; i<N; i++){
    blocks_per_row[i] = create_blocks(row_ptr[i], row_ptr[i+1], colind);
  }

}
*/
void coo_csr(int nz, int N, int *row, int *col, MYTYPE *coo_val, int *row_ptr, int *colind, MYTYPE *val)
{
  int i, j, j0, r, c;
  MYTYPE data;

  for (i=0; i<nz; i++)
    row_ptr[row[i]]++;

  j = 0;
  for (i=0; i<N; i++){
    j0 = row_ptr[i];
    row_ptr[i] = j;
    j += j0;
  }

  for (i=0; i<nz; i++){
    r = row[i];
    c = col[i];
    data = coo_val[i];
    j = row_ptr[r];
    colind[j] = c;
    val[j] = data;
    row_ptr[r]++;
  }

  for( i = N-1; i > 0; i--){
    row_ptr[i] = row_ptr[i-1];
  }
  row_ptr[0] = 0;
  row_ptr[N] = nz;
  /*for(i = 0; i < N; i++){
    sort(row_ptr[i],row_ptr[i+1], colind, val);
  }*/

//  printf("Elapsed time for coo to csr =\t %g milliseconds\n", ((double)(stop - start)) / CLOCKS_PER_SEC * 1000);
}

void csr_ell(int *row_ptr, int *colind, MYTYPE *val, int **indices, MYTYPE **data, int N, int* num_cols, int nnz)
{
  int i, j, k, col, max = 0, temp = 0;

  for(i = 0; i < N ; i++){
    temp = row_ptr[i+1] - row_ptr[i];
    if (max < temp)
      max = temp;
  }
  *num_cols = max;
 
  /*if(((size_t)N * max) > pow(2, 27) || (((size_t)N * max * 2)/nnz) > 10){*/
      /*fprintf(stderr, "too large");*/
      /*exit(1);*/
  /*}*/

  *data = (MYTYPE*)calloc((size_t)N * max, sizeof(MYTYPE));
  if(*data == NULL){
    fprintf(stderr, "couldn't allocate ell_data using malloc");
    exit(1);
  }
  *indices = (int*)calloc((size_t)N * max, sizeof(int));
  if(*indices == NULL){
    fprintf(stderr, "couldn't allocate indices using malloc");
    exit(1);
  }

  for(i = 0; i < max; i++){
    for(j = 0; j < N; j++){
      (*indices)[i*N+j] = -1;
    }
  }

  for(i = 0; i < N; i++){
    k = 0;
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      (*data)[i*max+k] = val[j];
      (*indices)[i*max+k] = colind[j];
      k++;
    }
  }

  /*int prev_index = 0;
  for(i = 0; i < N; i++){
    for(j = 0; j < max; j++){
      if((*indices)[i*max+j] == -1)
        (*indices)[i*max+j] = prev_index;
      prev_index = (*indices)[i*max+j];
    }
  }*/
}
void csr_dia(int *row_ptr, int *colind, MYTYPE *val, int **offset, MYTYPE **data, int N, int *nd, int *stride, int nnz)
{
  int i, j, num_diag, min, *ind, index, diag_no, col, k;
  int move;
  num_diag = 0;

  ind = (int*)calloc(2*N-1, sizeof(int));
  if(ind == NULL){
    fprintf(stderr, "couldn't allocate ind using calloc\n");
    exit(1);
  }

  for(i = 0; i < N ; i++){
    for(j = row_ptr[i]; j<row_ptr[i+1]; j++){
      if(!ind[N+colind[j]-i-1]++)
        num_diag++;
    }
  }
  *nd = num_diag;
  *stride = N;
  size_t size = (size_t)num_diag * *stride;
  /*if(size > pow(2, 27) || (size/nnz) > 3){*/
    /*fprintf(stderr, "too large");*/
    /*exit(1);*/
  /*}*/

  *offset = (int*)malloc(num_diag * sizeof(int));
  if(*offset == NULL){
    fprintf(stderr, "couldn't allocate *offset using malloc\n");
    exit(1);
  }
  diag_no = -((2*N-1)/2);
  min = abs(diag_no);
  index = 0;
  for(i=0;i<2*N-1;i++){
    if(ind[i]){
      (*offset)[index++] = diag_no;
      if(min > abs(diag_no))
        min = abs(diag_no); 
    }
    diag_no++;
  }
  //*stride = N - min;
  *data = (MYTYPE*)calloc(size, sizeof(MYTYPE));
  if(*data == NULL){
    fprintf(stderr, "couldn't allocate *data using calloc\n");
    fprintf(stderr, "%s\n", strerror(errno));
    fprintf(stderr, "%d\n", errno);
    exit(1);
  }
  for(i = 0; i < N; i++){
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      col = colind[j];
      for(k = 0; k < num_diag; k++){
        move = 0;
        if(col - i == (*offset)[k]){
          //if((*offset)[k] < 0)
            //move = N - *stride; 
          //(*data)[(size_t)k * *stride + i - move] = val[j];
          (*data)[(size_t)i * num_diag + k] = val[j];
          break;
        }
      }
    }
  } 
}

void csr_diaii(int *row_ptr, int *colind, MYTYPE *val, int **offset, MYTYPE **data, int N, int *nd, int *stride, int nnz)
{
  int i, j, num_diag, min, *ind, index, diag_no, col, k;
  int move;
  num_diag = 0;

  ind = (int*)calloc(2*N-1, sizeof(int));
  if(ind == NULL){
    fprintf(stderr, "couldn't allocate ind using calloc\n");
    exit(1);
  }

  for(i = 0; i < N ; i++){
    for(j = row_ptr[i]; j<row_ptr[i+1]; j++){
      if(!ind[N+colind[j]-i-1]++)
        num_diag++;
    }
  }
  *nd = num_diag;
  *stride = N;
  size_t size = (size_t)num_diag * *stride;
  /*if(size > pow(2, 27) || (size/nnz) > 3){
    fprintf(stderr, "too large");
    exit(1);
  }*/

  *offset = (int*)malloc(num_diag * sizeof(int));
  if(*offset == NULL){
    fprintf(stderr, "couldn't allocate *offset using malloc\n");
    exit(1);
  }
  diag_no = -((2*N-1)/2);
  min = abs(diag_no);
  index = 0;
  for(i=0;i<2*N-1;i++){
    if(ind[i]){
      (*offset)[index++] = diag_no;
      if(min > abs(diag_no))
        min = abs(diag_no);
    }
    diag_no++;
  }
  //*stride = N - min;
  *data = (MYTYPE*)calloc(size, sizeof(MYTYPE));
  if(*data == NULL){
    fprintf(stderr, "couldn't allocate *data using calloc\n");
    fprintf(stderr, "%s\n", strerror(errno));
    fprintf(stderr, "%d\n", errno);
    exit(1);
  }
  for(i = 0; i < N; i++){
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      col = colind[j];
      for(k = 0; k < num_diag; k++){
        move = 0;
        if(col - i == (*offset)[k]){
          if((*offset)[k] < 0)
            move = N - *stride; 
          (*data)[(size_t)k * *stride + i - move] = val[j];
          break;
        }
      }
    }
  }
  //printf("Elapsed time for csr to dia =\t %g milliseconds\n", ((double)(stop - start)) / CLOCKS_PER_SEC * 1000);
}

void csr_ellii(int *row_ptr, int *colind, MYTYPE *val, int **indices, MYTYPE **data, int N, int* num_cols, int nnz)
{ 
  int i, j, k, col, max = 0, temp = 0;
  
  for(i = 0; i < N ; i++){
    temp = row_ptr[i+1] - row_ptr[i];
    if (max < temp)
      max = temp;
  }
  *num_cols = max;
  
  /*if(((size_t)N * max) > pow(2, 27) || (((size_t)N * max * 2)/nnz) > 10){*/
      /*fprintf(stderr, "too large");*/
      /*exit(-1);*/
  /*}*/

  *data = (MYTYPE*)calloc((size_t)N * max, sizeof(MYTYPE));
  if(*data == NULL){
    fprintf(stderr, "couldn't allocate ell_data using malloc");
    exit(1);
  }
  *indices = (int*)calloc((size_t)N * max, sizeof(int));
  if(*indices == NULL){
    fprintf(stderr, "couldn't allocate indices using malloc");
    exit(1);
  }

  /*for(i = 0; i < max; i++){
    for(j = 0; j < N; j++){
      (*indices)[i*N+j] = -1;
    }
  }*/

  for(i = 0; i < N; i++){
    k = 0;
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      (*data)[k*N+i] = val[j];
      (*indices)[k*N+i] = colind[j];
      k++;
    }
  }
}

void csr_custom(int *row_ptr, int *colind, MYTYPE *val, int **offset, MYTYPE **data, int N, int *nd, int **ptr)
{
  int i, j, num_diag, min, *ind, index, diag_no, col, k;
  clock_t start, stop;
  int move;
  num_diag = 0;
  size_t size = 0;
  int istart;
  int sum = 0;

  ind = (int*)calloc(2*N-1, sizeof(int));
  if(ind == NULL){
    fprintf(stderr, "couldn't allocate ind using calloc\n");
    exit(1);
  }

start = clock();
  for(i = 0; i < N ; i++){
    for(j = row_ptr[i]; j<row_ptr[i+1]; j++){
      if(!ind[N+colind[j]-i-1]++)
        num_diag++;
    }
  }
  *nd = num_diag;

  *offset = (int*)malloc(num_diag * sizeof(int));
  *ptr = (int*)malloc(num_diag * sizeof(int));
  if(*offset == NULL || *ptr == NULL){
    fprintf(stderr, "couldn't allocate *offset using malloc\n");
    exit(1);
  }

diag_no = -((2*N-1)/2);
  min = abs(diag_no);
  index = 0;
  for(i=0;i<2*N-1;i++){
    if(ind[i]){
      (*ptr)[index] = size;
      (*offset)[index++] = diag_no;
      size += N - abs(diag_no);
      if(min > abs(diag_no))
        min = abs(diag_no);
    }
    diag_no++;
  }
  *data = (MYTYPE*)calloc(size, sizeof(MYTYPE));
  if(*data == NULL){
    fprintf(stderr, "couldn't allocate *data using calloc\n");
    fprintf(stderr, "%s\n", strerror(errno));
    fprintf(stderr, "%d\n", errno);
    exit(1);
  }
for(i = 0; i < N; i++){
    for(j = row_ptr[i]; j < row_ptr[i+1]; j++){
      col = colind[j];
      for(k = 0; k < num_diag; k++){
        move = 0;
        int o = (*offset)[k];
        if(col - i == o){
          istart = (0 < -o) ? -o : 0;
          move = i - istart;
          (*data)[(*ptr)[k] + move] = val[j];
          sum++;
          break;
        }
      }
    }
  }
  stop = clock();
  //printf("Elapsed time for csr to dia =\t %g milliseconds\n", ((double)(stop - start)) / CLOCKS_PER_SEC * 1000);
}




