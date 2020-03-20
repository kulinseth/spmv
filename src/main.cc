#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sched.h>
#include "mmio.h"
#include <math.h>
#include <libgen.h>
#include "spmv.h"
#include "papi.h"
#include <sys/types.h>
#include <sys/syscall.h>

#define OUTER_MAX 3

//template <typename T, typename F>
void *spmv_wrapper(void *ptr) {
  spmv_pthread_struct *s = (spmv_pthread_struct *)ptr;
  cpu_set_t cpuset;
  int cpu = s->tid + 1;
  CPU_ZERO(&cpuset);       //clears the cpuset
  CPU_SET(cpu, &cpuset);
  sched_setaffinity(0, sizeof(cpuset), &cpuset);
  for(int inside = 0; inside < s->inside_max; inside++){
    s->fn(s->sp);
  }
  pthread_exit(NULL);
}

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


//void launch_spmv (Index *row, Index *col, Value *coo_val, Index *row_ptr,
                  //Index *colind, int anz, int N, int inside_max) {
  //spmv_pthread_struct *s[num_workers];
  //int nnz_per_worker = anz / num_workers;
  //int rem = anz - nnz_per_worker * num_workers;
  //int t_index = 0;
  //int t = 0;
  //for(t = 0; t < num_workers; t++){
    //s[t] = (spmv_pthread_struct*)malloc(sizeof(spmv_pthread_struct));
    //if(s[t] == NULL){
      //printf("struct couldn't be allocated\n");
      //exit (EXIT_FAILURE);
    //}
    //s[t]->sp = (spmv_struct*)calloc(1, sizeof(spmv_struct));
    //s[t]->tid = t;
    //s[t]->sp->n = nnz_per_worker;
    //s[t]->sp->N = N;
    //s[t]->sp->ptr = row + t_index;
    //s[t]->sp->ind =  col + t_index;
    //s[t]->sp->data = coo_val + t_index;
    //s[t]->sp->x = x;
    //s[t]->sp->y = (Value*) calloc(N, sizeof(Value));
    //s[t]->fn = &spmv_coo;
    //t_index += nnz_per_worker;
    //s[t]->inside_max = inside_max;
  //}
  //s[t-1]->sp->n += rem;
  //int iret;
  //if ((ret = PAPI_start(event_set)) != PAPI_OK) {
    //fprintf(stderr, "PAPI failed to start counters: %s\n", PAPI_strerror(ret));
    //exit(1);
  //}
  //for (i=0; i<outer_max; i++){
    //zero_arr(N, y);
    //for(t = 0; t < num_workers; t++)
      //zero_arr(N, s[t]->sp->y);
    //start = clock();
    //clock_gettime(clk_id, &start_tp);
    //for(t = 0; t < num_workers; t++) {
      //iret = pthread_create(&threads[t], NULL, spmv_wrapper, (void *)(s[t])); 
      //if(iret != 0){
        //printf("Error in pthreads!\n");
        //exit(1);
      //}
    //}
    //for(t = 0; t < num_workers; t++){
      //pthread_join(threads[t], NULL);
      //for(int j = 0; j < N; j++){
        //y[j] += s[t]->sp->y[j];
      //}
    //}
    //[>printf("%d\n", fletcher_sum(y, N)); <]
    //clock_gettime(clk_id, &stop_tp);
    //printf("Time elpased %f\n",(double) ((stop_tp.tv_sec - start_tp.tv_sec) + ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
    //exec_arr[i] = 1.0/1000000 * 2 * anz * inside_max/ ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
    //sum += ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
  //}
  //if ((ret = PAPI_read(event_set, values)) != PAPI_OK) {
    //fprintf(stderr, "PAPI failed to read counters: %s\n", PAPI_strerror(ret));
    //exit(1);
  //}
  //printf("coo\n");
  //printf("Num_threads %d\n", num_workers);
  //printf("Outer %d\n", outer_max);
  //printf("Inside %d\n", inside_max);
  //printf("N %d\n", N);
  //printf("NNZ %d\n", anz);
  //mean  = 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum));
  //for (i=0; i<outer_max; i++){
    //variance += (mean - exec_arr[i]) * (mean - exec_arr[i]);
  //}
  //variance /= outer_max;
  //sd = sqrt(variance);
  //printf("SD %g\n", sd);
  //printf("MFLOPS_S %g\n", 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum)));
  //printf("Time %g\n", (((double)(sum))/CLOCKS_PER_SEC));
  //printf("%d\n", fletcher_sum(coo_val, anz));
  //printf("%d\n", fletcher_sum(x, M));
  //printf("Fletcher_sum %d\n", fletcher_sum(y, N));
  //printf("L1 data cache misses is %lld\n", values[0]);
  //printf("L2 data cache misses is %lld\n", values[1]);
  //printf("L3 data cache misses is %lld\n", values[2]);

//}

int main(int argc, char* argv[])
{
  struct timespec start_tp, stop_tp;
  clockid_t clk_id;
  clk_id = CLOCK_REALTIME;
  int ret_code, r, c, k;
  MM_typecode matcode;
  FILE *f, *g;
  int M, N, entries, anz, i, j, *row, *col, *row_ptr, *colind, *offset, *ptr, *indices, num_diags, stride, num_cols;
  Value *x, *y, *val, *dia_data, *ell_data, *coo_val;
  double v;
  clock_t start, stop;
  double sum = 0, mean = 0, sd = 0, variance = 0;
  int ret, event_set=PAPI_NULL;
  int inside = 0, inside_max = 1000000, outer_max = OUTER_MAX;
  double exec_arr[OUTER_MAX];
  long long values[3];

  if(argc < 4){
    fprintf(stderr, "Usage: %s [martix-market-filename] format_num num_workers\n", argv[0]);
      exit(1);
  }
  else{
    if((f = fopen(argv[1], "r")) == NULL)
      exit(1);
  }

  ret = papi_init(&event_set);

  int num_workers = atoi(argv[3]);

  if(mm_read_banner(f, &matcode) != 0){
    fprintf(stderr, "Could not process Matrix Market banner.\n");
    exit(1);
  }

  /*  This is how one can screen matrix types if their application */
  /*  only supports a subset of the Matrix Market data types.      */

  if(mm_is_complex(matcode) && mm_is_matrix(matcode) && mm_is_sparse(matcode)){
    fprintf(stderr, "Sorry, this application does not support ");
    fprintf(stderr, "Market Market type: [%s]\n", mm_typecode_to_str(matcode));
    exit(1);
  }

  /* find out size of sparse matrix .... */

  if((ret_code = mm_read_mtx_crd_size(f, &M, &N, &entries)) !=0)
    exit(1);

  /* reseve memory for matrices */

  if(mm_is_symmetric(matcode)){
    anz = 0;
    if(!mm_is_pattern(matcode)){
      for (i=0; i<entries; i++)
      {
        fscanf(f, "%d %d %lf\n", &r, &c, &v);
        if( v < 0 || v > 0){
          if(r == c)
            anz++;
          else
            anz = anz + 2;
        }
      }
    }
    else{
      for (i=0; i<entries; i++)
      {
        fscanf(f, "%d %d\n", &r, &c);
        if(r == c)
          anz++;
        else
          anz = anz + 2;
      }
    }
  }
  else{
      anz = 0;
      for (i=0; i<entries; i++)
      {
        fscanf(f, "%d %d %lf\n", &r, &c, &v);
        if( v < 0 || v > 0)
          anz++;
      }
  }
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

  row = (Index*)malloc(anz * sizeof(Index));
  if(row == NULL){
    fprintf(stderr, "couldn't allocate row using malloc");
    exit(1);
  }
  col = (Index*)malloc(anz * sizeof(Index));
  if(col == NULL){
    fprintf(stderr, "couldn't allocate col using malloc");
    exit(1);
  }
  coo_val = (Value*)malloc(anz * sizeof(Value));
  if(coo_val == NULL){
    fprintf(stderr, "couldn't allocate val using malloc");
    exit(1);
  }
  row_ptr = (Index*)calloc(N+1, sizeof(Index));
  if(row_ptr == NULL){
    fprintf(stderr, "couldn't allocate row_ptr using malloc");
    exit(1);
  }
  colind = (Index*)malloc(anz * sizeof(Index));
  if(colind == NULL){
    fprintf(stderr, "couldn't allocate colind using malloc");
    exit(1);
  }
  val = (Value*)malloc(anz * sizeof(Value));
  if(val == NULL){
    fprintf(stderr, "couldn't allocate val using malloc");
    exit(1);
  }
  x=(Value*) malloc( sizeof(Value)*N );
  if(x == NULL){
    fprintf(stderr, "couldn't allocate x using malloc");
    exit(1);
  }
  init_arr(N,x);
  y=(Value*) calloc(N, sizeof(Value));
  if(y == NULL){
    fprintf(stderr, "couldn't allocate y using calloc");
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
	       if(fpclassify(coo_val[k]) == FP_NAN){
            fprintf(stderr,"bad value : nan\n");
            exit(1);
          }
          if(fpclassify(coo_val[k]) == FP_INFINITE){
            fprintf(stderr,"bad value : infinite\n");
            exit(1);
          }
          if(fpclassify(coo_val[k]) == FP_SUBNORMAL){
            fprintf(stderr,"bad value : subnormal\n");
            coo_val[k] = 0.0;
          }
          if(r == c){
            k++;
          }
          else{
            row[k+1] = col[k];
            col[k+1] = row[k];
            coo_val[k+1] = v;
	    if(fpclassify(coo_val[k+1]) == FP_SUBNORMAL){
              fprintf(stderr,"bad value : subnormal\n");
              coo_val[k+1] = 0.0;
            }
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
	  if(fpclassify(coo_val[k]) == FP_NAN){
            fprintf(stderr,"bad value : nan\n");
            exit(1);
          }
          if(fpclassify(coo_val[k]) == FP_INFINITE){
            fprintf(stderr,"bad value : infinite\n");
            exit(1);
          }
          if(fpclassify(coo_val[k]) == FP_SUBNORMAL){
            fprintf(stderr,"bad value : subnormal\n");
            coo_val[k] = 0.0;
          }
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

  if(anz > 1000000) inside_max = 1;
  else if (anz > 100000) inside_max = 500;
  else if (anz > 50000) inside_max = 1000;
  else if(anz > 20000) inside_max = 5000;
  else if(anz > 5000) inside_max = 10000;
  else if(anz > 500) inside_max = 100000;
  //inside_max *= 6;

  pthread_t threads[num_workers];

  if(atoi(argv[2]) == SPMV_ALGORITHM_COO){
     spmv_pthread_struct *s[num_workers];
     int nnz_per_worker = anz / num_workers;
     int rem = anz - nnz_per_worker * num_workers;
     int t_index = 0;
     int t = 0;
     for(t = 0; t < num_workers; t++){
       s[t] = (spmv_pthread_struct*)malloc(sizeof(spmv_pthread_struct));
       if(s[t] == NULL){
         printf("struct couldn't be allocated\n");
         exit (EXIT_FAILURE);
       }
       s[t]->sp = (spmv_struct*)calloc(1, sizeof(spmv_struct));
       s[t]->tid = t;
       s[t]->sp->n = nnz_per_worker;
       s[t]->sp->N = N;
       s[t]->sp->ptr = row + t_index;
       s[t]->sp->ind =  col + t_index;
       s[t]->sp->data = coo_val + t_index;
       s[t]->sp->x = x;
       s[t]->sp->y = (Value*) calloc(N, sizeof(Value));
       s[t]->fn = &spmv_coo;
       t_index += nnz_per_worker;
       s[t]->inside_max = inside_max;
     }
     s[t-1]->sp->n += rem;
     int iret;
     if ((ret = PAPI_start(event_set)) != PAPI_OK) {
       fprintf(stderr, "PAPI failed to start counters: %s\n", PAPI_strerror(ret));
       exit(1);
     }
     for (i=0; i<outer_max; i++){
       zero_arr(N, y);
       for(t = 0; t < num_workers; t++)
         zero_arr(N, s[t]->sp->y);
       start = clock();
       clock_gettime(clk_id, &start_tp);
       for(t = 0; t < num_workers; t++) {
         iret = pthread_create(&threads[t], NULL, spmv_wrapper, (void *)(s[t])); 
         if(iret != 0){
           printf("Error in pthreads!\n");
           exit(1);
         }
       }
       for(t = 0; t < num_workers; t++){
         pthread_join(threads[t], NULL);
         for(int j = 0; j < N; j++){
           y[j] += s[t]->sp->y[j];
         }
       }
       /*printf("%d\n", fletcher_sum(y, N)); */
       clock_gettime(clk_id, &stop_tp);
       printf("Time elpased %f\n",(double) ((stop_tp.tv_sec - start_tp.tv_sec) + ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
       exec_arr[i] = 1.0/1000000 * 2 * anz * inside_max/ ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
       sum += ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
     }
     if ((ret = PAPI_read(event_set, values)) != PAPI_OK) {
       fprintf(stderr, "PAPI failed to read counters: %s\n", PAPI_strerror(ret));
       exit(1);
     }
     printf("coo\n");
     printf("Num_threads %d\n", num_workers);
     printf("Outer %d\n", outer_max);
     printf("Inside %d\n", inside_max);
     printf("N %d\n", N);
     printf("NNZ %d\n", anz);
     mean  = 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum));
     for (i=0; i<outer_max; i++){
       variance += (mean - exec_arr[i]) * (mean - exec_arr[i]);
     }
     variance /= outer_max;
     sd = sqrt(variance);
     printf("SD %g\n", sd);
     printf("MFLOPS_S %g\n", 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum)));
     printf("Time %g\n", (((double)(sum))/CLOCKS_PER_SEC));
     printf("Fletcher sum coo_val: %d\n", fletcher_sum(coo_val, anz));
     printf("Fletcher sum x: %d\n", fletcher_sum(x, M));
     printf("Fletcher_sum y: %d\n", fletcher_sum(y, N));
     printf("L1 data cache misses is %lld\n", values[0]);
     printf("L2 data cache misses is %lld\n", values[1]);
     printf("L3 data cache misses is %lld\n", values[2]);

    //launch_spmv(row, col, coo_val, row_ptr, colind, anz);
  } else if(atoi(argv[2]) == SPMV_ALGORITHM_CSR){
    coo_csr(anz, N, row, col, coo_val, row_ptr, colind, val);
    spmv_pthread_struct *s[num_workers];
    int rows_per_worker = N / num_workers;
    int rem = N - rows_per_worker * num_workers;
    int t_index = 0;
    int t = 0;
    for(t = 0; t < num_workers; t++){
      s[t] = (spmv_pthread_struct*)malloc(sizeof(spmv_pthread_struct));
      if(s[t] == NULL){
        printf("struct couldn't be allocated\n");
        exit(1);
      }

      s[t]->sp = (spmv_struct*)calloc(1, sizeof(spmv_struct));
      s[t]->tid = t;
      s[t]->sp->n = rows_per_worker;
      s[t]->sp->N = rows_per_worker;
      s[t]->sp->ptr = row_ptr + t_index;
      s[t]->sp->ind =  colind;
      s[t]->sp->data = val;
      s[t]->sp->x = x;
      s[t]->sp->y = y + t_index;
      s[t]->fn = &spmv_csr;
      t_index += rows_per_worker;
      s[t]->len = rows_per_worker;
      s[t]->inside_max = inside_max;
    }
    s[t-1]->sp->N += rem;
    int iret;
    if ((ret = PAPI_start(event_set)) != PAPI_OK) {
      fprintf(stderr, "PAPI failed to start counters: %s\n", PAPI_strerror(ret));
      exit(1);
    }
    for (i=0; i<outer_max; i++){
      zero_arr(N, y);
      //for(t = 0; t < num_workers; t++)
        //zero_arr(N, s[t]->y);
      start = clock();
      clock_gettime(clk_id, &start_tp);
      for(t = 0; t < num_workers; t++){
        iret = pthread_create(&threads[t], NULL, spmv_wrapper, (void *)(s[t]));
        if(iret != 0){
          printf("Error in pthreads!\n");
          exit(1);
        }
      }
      for(t = 0; t < num_workers; t++){
        pthread_join(threads[t], NULL);
      }
      stop = clock();
      //printf("%d\n", fletcher_sum(y, N)); 
      //exec_arr[i] = 1.0/1000000 * 2 * anz / ((double)(stop - start)/ CLOCKS_PER_SEC); 
      //sum += (double)(stop - start);
      clock_gettime(clk_id, &stop_tp);
      //printf("%lf\n",(double) ((stop_tp.tv_sec - start_tp.tv_sec) + ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
      exec_arr[i] = 1.0/1000000 * 2 * anz * inside_max/ ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
      sum += ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
    }
    if ((ret = PAPI_read(event_set, values)) != PAPI_OK) {
      fprintf(stderr, "PAPI failed to read counters: %s\n", PAPI_strerror(ret));
      exit(1);
    }
    printf("csr\n");
    printf("Num_threads %d\n", num_workers);
    printf("Outer %d\n", outer_max);
    printf("Inside %d\n", inside_max);
    printf("N %d\n", N);
    printf("NNZ %d\n", anz);
    mean  = 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum));
    for (i=0; i<outer_max; i++){
      variance += (mean - exec_arr[i]) * (mean - exec_arr[i]);
    }
    variance /= outer_max;
    sd = sqrt(variance);
    printf("SD %f\n", sd);
    printf("MFLOPS_s %g\n", 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum)));
    printf("Time %g\n", (((double)(sum))/CLOCKS_PER_SEC));
    //printf("%d\n", fletcher_sum_1d_array_int(row, anz)); 
    //printf("%d\n", fletcher_sum_1d_array_int(col, anz)); 
    printf("Fletcher sum coo_val: %d\n", fletcher_sum(coo_val, anz)); 
    printf("Fletcher_sum x: %d\n", fletcher_sum(x, M)); 
    printf("Fletcher_sum y: %d\n", fletcher_sum(y, N));
    printf("L1 data cache misses is %lld\n", values[0]);
    printf("L2 data cache misses is %lld\n", values[1]);
    printf("L3 data cache misses is %lld\n", values[2]);
  } else if(atoi(argv[2]) == SPMV_ALGORITHM_DIA) {
    coo_csr(anz, N, row, col, coo_val, row_ptr, colind, val);
    csr_dia(row_ptr, colind, val, &offset, &dia_data, N, &num_diags, &stride, anz);
    spmv_pthread_struct *s[num_workers];
    int rows_per_worker = N / num_workers;
    int rem = N - rows_per_worker * num_workers;
    int t_index = 0;
    int t = 0;
    for(t = 0; t < num_workers; t++) {
      s[t] = (spmv_pthread_struct*)malloc(sizeof(spmv_pthread_struct));
      if(s[t] == NULL){
        printf("struct couldn't be allocated\n");
        exit(1);
      }

      s[t]->sp = (spmv_struct*)calloc(1, sizeof(spmv_struct));
      s[t]->tid = t;
      s[t]->sp->n = num_diags;
      s[t]->sp->N = N;
      s[t]->sp->start_row = t_index/num_diags;
      s[t]->sp->data = dia_data;
      s[t]->sp->ptr = offset;
      s[t]->sp->x = x;
      s[t]->sp->y = y;
      s[t]->sp->end_row = s[t]->sp->start_row + rows_per_worker;
      s[t]->fn = &spmv_dia;
      t_index += rows_per_worker * num_diags;
      s[t]->inside_max = inside_max;
    }
    s[t-1]->sp->end_row += rem;
    int iret;
    for (i=0; i<outer_max; i++) {
      zero_arr(N, y);
      for(t = 0; t < num_workers; t++) zero_arr(N, s[t]->sp->y);
      clock_gettime(clk_id, &start_tp);
      for(t = 0; t < num_workers; t++){
        iret = pthread_create(&threads[t], NULL, spmv_wrapper, (void *)(s[t]));
        if(iret != 0){
          printf("Error in pthreads!\n");
          exit(1);
        }
      }
      for(t = 0; t < num_workers; t++){
        pthread_join(threads[t], NULL);
      }
      //stop = clock();
      //printf("%d\n", fletcher_sum(y, N)); 
      //exec_arr[i] = 1.0/1000000 * 2 * anz / ((double)(stop - start)/ CLOCKS_PER_SEC); 
      //sum += (double)(stop - start);
      clock_gettime(clk_id, &stop_tp);
      //printf("%f\n",(double) ((stop_tp.tv_sec - start_tp.tv_sec) + ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
      exec_arr[i] = 1.0/1000000 * 2 * anz * inside_max/ ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0))); 
      sum += ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
    }
    printf("dia\n");
    printf("Num_threads %d\n", num_workers);
    printf("Outer %d\n", outer_max);
    printf("Inside %d\n", inside_max);
    printf("N %d\n", N);
    printf("NNZ %d\n", anz);
    mean  = 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum));
    for (i=0; i<outer_max; i++){
      variance += (mean - exec_arr[i]) * (mean - exec_arr[i]);
    }
    variance /= outer_max;
    sd = sqrt(variance);
    printf("SD %f\n", sd);
    printf("MFLOPS_s %g,", 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum)));
    printf("Time %g\n", (((double)(sum))/CLOCKS_PER_SEC));
    //printf("%d\n", fletcher_sum_1d_array_int(row, anz)); 
    //printf("%d\n", fletcher_sum_1d_array_int(col, anz)); 
    printf("Fletcher_sum coo_val %d\n", fletcher_sum(coo_val, anz)); 
    printf("Fletcher_sum x: %d\n", fletcher_sum(x, M)); 
    printf("Fletcher_sum y: %d\n", fletcher_sum(y, N));
  } else if(atoi(argv[2]) == SPMV_ALGORITHM_ELL) {
    coo_csr(anz, N, row, col, coo_val, row_ptr, colind, val);
    csr_ell(row_ptr, colind, val, &indices, &ell_data, N, &num_cols, anz);

    spmv_pthread_struct *s[num_workers];
    int rows_per_worker = N / num_workers;
    int rem = N - rows_per_worker * num_workers;
    int t_index = 0;
    int t;
    for(t = 0; t < num_workers; t++){
      s[t] = (spmv_pthread_struct*)malloc(sizeof(spmv_pthread_struct));
      if(s[t] == NULL){
        printf("struct couldn't be allocated\n");
        exit(1);
      }
      s[t]->sp = (spmv_struct*)calloc(1, sizeof(spmv_struct));
      s[t]->tid = t;
      s[t]->sp->n = num_cols;
      s[t]->sp->N = N;
      s[t]->sp->start_row = t_index/num_cols;
      s[t]->sp->data = ell_data;
      s[t]->sp->ind = indices;
      s[t]->sp->x = x;
      s[t]->sp->y = y;
      s[t]->fn = &spmv_ell;
      t_index += rows_per_worker * num_cols;
      s[t]->sp->end_row = s[t]->sp->start_row + rows_per_worker;
      s[t]->inside_max = inside_max;
    }
    s[t-1]->sp->end_row += rem;
    int iret;
    for (i=0; i<outer_max; i++){
      zero_arr(N, y);
      for(t = 0; t < num_workers; t++)
      clock_gettime(clk_id, &start_tp);
      for(t = 0; t < num_workers; t++){
        iret = pthread_create(&threads[t], NULL, spmv_wrapper, (void *)(s[t]));
        if(iret != 0){
          printf("Error in pthreads!\n");
          exit(1);
        }
      }
      for(t = 0; t < num_workers; t++){
        pthread_join(threads[t], NULL);
      }
      clock_gettime(clk_id, &stop_tp);
      exec_arr[i] = 1.0/1000000 * 2 * anz * inside_max/ ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
      sum += ((double)((stop_tp.tv_sec - start_tp.tv_sec)+ ((stop_tp.tv_nsec - start_tp.tv_nsec) / 1000000000.0)));
    }
    printf("ell\n");
    printf("Num_threads %d\n", num_workers);
    printf("Outer %d\n", outer_max);
    printf("Inside %d\n", inside_max);
    printf("N %d\n", N);
    printf("NNZ %d\n", anz);
    mean  = 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum));
    for (i=0; i<outer_max; i++){
      variance += (mean - exec_arr[i]) * (mean - exec_arr[i]);
    }
    variance /= outer_max;
    sd = sqrt(variance);
    printf("SD %g\n", sd);
    printf("MFLOPS_s %g\n", 1.0/1000000 * 2 * anz * outer_max * inside_max/ ((double)(sum)));
    printf("Time %g\n", (((double)(sum))/CLOCKS_PER_SEC));
    printf("Fletcher_sum coo_val %d\n", fletcher_sum(coo_val, anz)); 
    printf("Fletcher_sum x: %d\n", fletcher_sum(x, M)); 
    printf("Fletcher_sum %d\n", fletcher_sum(y, N));
  }

  if (f !=stdin)
    fclose(f);
  pthread_exit(NULL);

  free(x);
  free(y);
  free(row);
  free(col);
  free(coo_val);

  return 0;
}
