#include<stdio.h>
#include<stdlib.h>
#include "mmio.h"
#include "config.h"
#include "utils.h"
#include<math.h>

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

int main(int argc, char* argv[])
{ 
  MM_typecode matcode;
  int i, k, M, N, entries, anz, r, c, ret_code;
  double v;
  int *row, *col, *col_width, *first_col_row, *last_col_row, last_col = -1;
  int *x_used, *nnz_row, *diff_nnz_row;
  float *scatter_row, *misses, *nnz_per_row;
  int total_misses;
  int min_nnz_row, max_nnz_row, min_col_width, max_col_width, min_diff_nnz_row, max_diff_nnz_row;
  float min_scatter_row, max_scatter_row;
  int empty_rows = 0;
  int zero_rows = 0, one_rows = 0, two_rows = 0, three_rows = 0, four_rows = 0, five_rows = 0;
  MYTYPE *coo_val;
  FILE *f;

  if(argc < 2){
    fprintf(stderr, "Usage: %s [martix-market-filename] \n", argv[0]);
      exit(1);
  }
  else{
    if((f = fopen(argv[1], "r")) == NULL){
      fprintf(stderr, "couldn't open file\n");
      exit(1);
    }
  }

  anz = count_nnz(f);

  rewind(f);

  if (mm_read_banner(f, &matcode) != 0)
  {
      fprintf(stderr, "Could not process Matrix Market banner.\n");
      exit(1);
  }
  if ((ret_code = mm_read_mtx_crd_size(f, &M, &N, &entries)) !=0)
      exit(1);

  if(M > N) 
    N = M;
  else
    M = N;


  row = (int*)malloc(anz * sizeof(int));
  if(row == NULL){
    fprintf(stderr, "couldn't allocate row using malloc");
    exit(1);
  }
  col = (int*)malloc(anz * sizeof(int));
  if(col == NULL){
    fprintf(stderr, "couldn't allocate col using malloc");
    exit(1);
  }
  coo_val = (MYTYPE*)malloc(anz * sizeof(MYTYPE));
  if(coo_val == NULL){
    fprintf(stderr, "couldn't allocate val using malloc");
    exit(1);
  }
  nnz_row = (int*)calloc(N, sizeof(int));
  if(nnz_row == NULL){
    fprintf(stderr, "couldn't allocate nnz_row using malloc");
    exit(1);
  }
  diff_nnz_row = (int*)calloc(N, sizeof(int));
  if(diff_nnz_row == NULL){
    fprintf(stderr, "couldn't allocate nnz_row using malloc");
    exit(1);
  }
  col_width = (int*)calloc(N, sizeof(int));
  if(col_width == NULL){
    fprintf(stderr, "couldn't allocate col_width using malloc");
    exit(1);
  }
  first_col_row = (int*)calloc(N, sizeof(int));
  if(first_col_row == NULL){
    fprintf(stderr, "couldn't allocate first col row using malloc");
    exit(1);
  }
  last_col_row = (int*)calloc(N, sizeof(int));
  if(last_col_row == NULL){
    fprintf(stderr, "couldn't allocate last col row using malloc");
    exit(1);
  }
  nnz_per_row = (float*)calloc(N, sizeof(float));
  if(nnz_per_row == NULL){
    fprintf(stderr, "couldn't allocate scatter_row using malloc");
    exit(1);
  }
  scatter_row = (float*)calloc(N, sizeof(float));
  if(scatter_row == NULL){
    fprintf(stderr, "couldn't allocate scatter_row using malloc");
    exit(1);
  }
  misses = (float*)calloc(N, sizeof(float));
  if(misses == NULL){
    fprintf(stderr, "couldn't allocate misses using malloc");
    exit(1);
  }
  x_used = (int*)calloc(N, sizeof(int));
  if(x_used == NULL){
    fprintf(stderr, "couldn't allocate x used using malloc");
    exit(1);
  }
  int *last_used = (int*)malloc(N * sizeof(int));
  if(last_used == NULL){
    fprintf(stderr, "couldn't allocate last_used using malloc");
    exit(1);
  }
  for(i = 0; i < N; i++)
    last_used[i] = -1;
  int *reuse_distance = (int*)calloc(N, sizeof(int));
  if(reuse_distance == NULL){
    fprintf(stderr, "couldn't allocate reuse_distance using malloc");
    exit(1);
  }

  /* NOTE: when reading in doubles, ANSI C requires the use of the "l"  */
  /*   specifier as in "%lg", "%lf", "%le", otherwise errors will occur */
  /*  (ANSI C X3.159-1989, Sec. 4.9.6.2, p. 136 lines 13-15)            */

  k = 0;
  if(mm_is_symmetric(matcode)){
    if(!mm_is_pattern(matcode)){
      for (i=0; i<entries; i++){
        fscanf(f, "%d %d %lf\n", &r, &c, &v);
        if( v < 0 || v > 0){
          row[k] = r - 1;
          col[k]= c - 1;
          coo_val[k] = v;
          if(r == c){
            k++;
          }
          else{
            row[k+1] = col[k]; 
            col[k+1] = row[k];
            coo_val[k+1] = v;
            k = k + 2;
          }
        }
      }
    }
    else{
      for (i=0; i<entries; i++){
        fscanf(f, "%d %d\n", &r, &c);
        row[k] = r - 1;
        col[k]= c - 1;
        coo_val[k] = 1.0;
        if(r == c){
          k++;
        }
        else{
          row[k+1] = col[k];
          col[k+1] = row[k];
          coo_val[k+1] = 1.0;
          k = k + 2;
        }
      }
    }
  }
  else {
    if(!mm_is_pattern(matcode)){
      for (i=0; i<entries; i++){
        fscanf(f, "%d %d %lf\n", &r, &c, &v);
        if( v < 0 || v > 0){
          row[k] = r - 1;
          col[k]= c - 1;
          coo_val[k] = v;
          k++;
        }
      }
    }
    else {
      for (i=0; i<entries; i++){
        fscanf(f, "%d %d\n", &r, &c);
        row[i] = r - 1;
        col[i]= c - 1;
        coo_val[i] = 1.0;
      }
    }
  }

  quickSort(row, col, coo_val, 0, anz-1);

  int distance;
  for(i = 0; i < anz; i++){
    if(last_used[(col[i])/16] == -1){
      last_used[(col[i])/16] = row[i];
      continue;
    }
    distance = row[i] - last_used[(col[i])/16];
    if(distance <= row[i])
      reuse_distance[distance]++;
    last_used[(col[i])/16] = row[i];
  }
  int sum = 0;
  for(i = 0; i < 16; i++){
    sum += reuse_distance[i];
  }

  min_nnz_row = N;
  max_nnz_row = 0;
  min_col_width = N;
  max_col_width = 0;

  for(i = 0; i < N; i++){
    first_col_row[i] = N;
    last_col_row[i] = -1;
  }
  for(i = 0; i < anz; i++){
    x_used[col[i]]++;
    if(last_col >= 0 && row[i-1] < row[i])
      last_col = -1;
    nnz_row[row[i]]++;
    if(first_col_row[row[i]] > col[i]) 
      first_col_row[row[i]] = col[i];
    if(last_col_row[row[i]] < col[i]) 
      last_col_row[row[i]] = col[i];
    if(last_col >= 0 && (col[i] - 16) < last_col)
      continue;
    else{
      misses[row[i]]++;
      last_col = col[i];
    }
  }
  total_misses = 0;
  for(i = 0; i < N; i++){
    if(nnz_row[i] > max_nnz_row)
      max_nnz_row = nnz_row[i];
    if(nnz_row[i] < min_nnz_row)
      min_nnz_row = nnz_row[i];
    col_width[i] = last_col_row[i] - first_col_row[i] + 1;
    if(col_width[i] < 0)
      col_width[i] = 0;
    if(col_width[i] > max_col_width)
      max_col_width = col_width[i];
    if(col_width[i] < min_col_width)
      min_col_width = col_width[i]; 
    if(col_width[i] > 0)
      scatter_row[i] = ((float)nnz_row[i])/col_width[i];
    if(nnz_row[i] > 0)
      misses[i] = misses[i]/nnz_row[i];
    if(i < N-1){
      diff_nnz_row[i] = abs(nnz_row[i] - nnz_row[i+1]);
    }
    if(x_used[i] > 0)
      total_misses++;
    if(nnz_row[i] == 0)
      empty_rows++; 
    if(nnz_row[i] == 1)
      one_rows++;
    if(nnz_row[i] == 2)
      two_rows++;
    if(nnz_row[i] == 3)
      three_rows++;
    if(nnz_row[i] == 4)
      four_rows++;
    if(nnz_row[i] == 5)
      five_rows++;
    nnz_per_row[i] = (float)nnz_row[i]/N;
    if(nnz_row[i] == 0)
      nnz_per_row[i] = 0.1/N;
    if(misses[i] == 0)
      misses[i] = 0.1/N;
    if(scatter_row[i] == 0)
      scatter_row[i] = 0.1/N;
  }
  min_scatter_row = scatter_row[0];
  max_scatter_row = scatter_row[0];
  min_diff_nnz_row = diff_nnz_row[0];
  max_diff_nnz_row = diff_nnz_row[0];
  for (int i = 1; i < N; i++) {
     if (scatter_row[i] < min_scatter_row)
        min_scatter_row = scatter_row[i];
     if (scatter_row[i] > max_scatter_row)
        max_scatter_row = scatter_row[i];
     if (diff_nnz_row[i] < min_diff_nnz_row)
        min_diff_nnz_row = diff_nnz_row[i];
     if (diff_nnz_row[i] > max_diff_nnz_row)
        max_diff_nnz_row = diff_nnz_row[i];
  }

  int total_small_rows = empty_rows + one_rows + two_rows + three_rows + four_rows + five_rows;
  int total_elems_small_rows = one_rows * 1 + two_rows * 2 + three_rows * 3 + four_rows * 4 + five_rows * 5;
  int num_diags = 0;
  long long diag_elem = count_diag_elems(row, col, coo_val, anz, N,&num_diags);
  long long ell_elem = 2 * max_nnz_row * N;
  if ( 2 * max_nnz_row != ell_elem / N)
    ell_elem = -1;


  printf("N,%d\n", N);
  printf("NNZ,%d\n", anz);
  printf("Nonzeros(nnz/N),%g\n", anz/((float)N));
  printf("Density,%g\n", anz/((float)N*N));
  /*printf("%f,", ((float)sum*100)/anz);*/
  printf("Diags,%d\n", num_diags);
  printf("Num_diag_elem,%lld\nNum_diag_elem_per_NNZ,%f\n", diag_elem, (double)diag_elem/anz); 
  /*printf("ELL_elem(num_ell_elem, num_ell_elem/NNZ) %lld,%f\n", ell_elem, (double)ell_elem/anz);*/
  /*printf("Empty_rows(percentage) %f,%f,%f,%f,%f,%f,%f,",(float)empty_rows*100/N, (float)one_rows*100/N, (float)two_rows*100/N, (float)three_rows*100/N, (float)four_rows*100/N, (float)five_rows*100/N, (float)total_small_rows*100/N);*/
  /*printf("Empty_rows(percentage) %f\n",(float)empty_rows*100/N);*/
  printf("Small_rows_percentage,%f\n", (float)total_small_rows*100/N);
  printf("Small_rows_elem_percentage,%f\n", (float)total_elems_small_rows*100/anz);
  /*printf("%f,", mean_i(diff_nnz_row, N-1));*/
  printf("NNZ_min,%d\nNNZ_max,%d\nNNZ_mean,%f\nNNZ_sd,%f\n", min_nnz_row, max_nnz_row, mean_i(nnz_row, N), sd_i(nnz_row, N, mean_i(nnz_row, N)));
  printf("DiffNNZ_min,%d\nDiffNNZ_max,%d\nDiffNNZ_mean,%f\nDiffNNZ_sd,%f\n", min_diff_nnz_row, max_diff_nnz_row, mean_i(diff_nnz_row, N), sd_i(diff_nnz_row, N, mean_i(diff_nnz_row, N)));
  float mean_col_width = mean_i(col_width, N);
  printf("BW_min,%f\nBW_max,%f\nBW_mean,%f\nBW_sd,%f\n", (float)min_col_width/N, (float)max_col_width/N, mean_col_width/N, sd_i(col_width, N, mean_col_width));
  printf("Scatter_min,%f\nScatter_max,%f\nScatter_mean,%f\nScatter_geom,%f\nScatter_sd,%f\n", min_scatter_row, max_scatter_row, mean_f(scatter_row, N), geo_mean(scatter_row, N), sd_f(scatter_row,N, mean_f(scatter_row, N)));
  printf("Misses,%f\n", geo_mean(misses, N));
  printf("FLOPS_byte,%f\n", (float)(2 * anz)/(8 * anz + 12 * N));
  free(row);
  free(col);
  free(coo_val);
  free(nnz_row);
  free(first_col_row);
  free(last_col_row);
  free(col_width);
  free(scatter_row);
  free(misses);
  free(x_used);

  return 0;
}

