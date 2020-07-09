#include "utils.h"
#if PERF
#include "papi.h"



int papi_init(int *event_set) {
  int events[3] = {PAPI_L1_DCM, PAPI_L2_DCM, PAPI_L3_TCM}, ret;

  cpu_set_t cpuset;
  CPU_ZERO(&cpuset);       //clears the cpuset
  CPU_SET(0, &cpuset);     //initialize cpuset to 0x0
  sched_setaffinity(0, sizeof(cpuset), &cpuset); //initialize main thread to P0

  ret = PAPI_library_init(PAPI_VER_CURRENT);
  if (ret != PAPI_VER_CURRENT && ret > 0) {
    fprintf(stderr,"PAPI library version mismatch!\n");
    exit(1);
  }
  if (ret < 0) {
    fprintf(stderr, "Initialization error!\n");
    exit(1);
  }

  ret = PAPI_create_eventset(event_set);
  if(ret != PAPI_OK){
    fprintf(stderr, "create event set error\n");
    exit(1);
  }
  ret = PAPI_add_events(*event_set, events, 3);
  if(ret != PAPI_OK){
    fprintf(stderr, "hi add event error\n");
    fprintf(stderr, "%d %s\n", ret, PAPI_strerror(ret));
    exit(1);
  }

  return ret;
}
#endif

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
long long count_diag_elems(int *row, int *col, VALUE_TYPE *val, int nnz, int N, int *nd)
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

int count_uniq_elems(int end, int start, int *arr, int *h){
  int i, j;
  int res = 0; 
  
  for (i = start+1; i < end; i++) {  
    if(!(h[arr[i]/16]))
      res++;
    h[arr[i]/16]++;
  } 
  return res; 
}

int string_compare(char *s1, char *s2)
{
  int i;
  if(strlen(s1) != strlen(s2))
    return -1;
  for(i = 0; i < strlen(s1); i++){
    if(tolower(s1[i]) != tolower(s2[i]))
      return -1;
  } 
  return 0;
}


void swap(int* a, int* b)
{ 
  int t = *a;
  *a = *b;
  *b = t;
}
void swap_val(VALUE_TYPE* a, VALUE_TYPE* b)
{
  VALUE_TYPE t = *a;
  *a = *b;
  *b = t;
}


void quickSort(int arr[], int arr2[], VALUE_TYPE arr3[], int left, int right)
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


void init_arr(int N, VALUE_TYPE* a)
{	
	int i;
	for (i=0; i<N;i++) {
          a[i] = i;
	}
}
void zero_arr(int N, VALUE_TYPE* a)
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

void sort(int start, int end, int *array1, VALUE_TYPE *array2)
{ 
  int i, j, temp;
  for(i = 0; i < end-start-1; i++){
    for(j = start; j < end-i-1; j++){
      if(array1[j] > array1[j+1]){
        temp = array1[j];
        array1[j] = array1[j+1];
        array1[j+1] = temp;
        temp = array2[j];
        array2[j] = array2[j+1];
        array2[j+1] = temp;
      }
    }
  }
}

void cmp(VALUE_TYPE *y, VALUE_TYPE *y1, int N)
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

int fletcher_sum(VALUE_TYPE *a, int size) {
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

int compute_avx2(int m, int n, int nnzA,
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

  err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
          err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
       err = spmv_avx2(m, n, alpha, x, y, csrRowPtrA, csrColIdxA, csrValA);
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
#if MKL
#include <mkl.h>
#include <mkl_spblas.h>

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

  spmv_mkl(m, n, alpha, x, y, A, desr);

  if (NUM_RUN)
  {
#ifndef DEBUG
      for (int i = 0; i < 50; i++)
         spmv_mkl(m, n, alpha, x, y, A, desr);
#endif
      anonymouslib_timer CSR5Spmv_timer;
      CSR5Spmv_timer.start();
      for (int i = 0; i < NUM_RUN; i++) {
         spmv_mkl(m, n, alpha, x, y, A, desr);
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
#endif
