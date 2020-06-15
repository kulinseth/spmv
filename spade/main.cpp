#include "utils.h"
#include "mmio.h"
std::ofstream outf;

int count_nnz(FILE *f)
{
  MM_typecode matcode;
  int i, M, N, entries, anz, r, c, ret_code;
  double v;

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
  return anz;
}


void print_features(FILE* f)
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
  VALUE_TYPE *coo_val;

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
  coo_val = (VALUE_TYPE*)malloc(anz * sizeof(VALUE_TYPE));
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

}


static inline
void run_small_test_matrix() {

  /*
   * >>> indptr = np.array([0, 2, 3, 6])
   * >>> indices = np.array([0, 2, 2, 0, 1, 2])
   * >>> data = np.array([1, 2, 3, 4, 5, 6])
   * >>> csr_matrix((data, indices, indptr), shape=(3, 3)).toarray()
   * array([[1, 0, 2],
   *        [0, 0, 3],
   *        [4, 5, 6]])
   * indptr = array([0, 2, 3, 6, 7], dtype=int32)
   * indices = array([0, 2, 2, 0, 1, 2, 3], dtype=int32)
   * val = array([1, 2, 3, 4, 5, 6, 7])
   * array([[1, 0, 2, 0],
   *        [0, 0, 3, 0],
   *        [4, 5, 6, 0],
   *        [0, 0, 0, 7]])
   */
  std::ifstream f("../data/test.csv");
  int m, n, nnzA;
  VALUE_TYPE alpha = 1.0;
  if (f) {
    f >> m >> n >> nnzA;
    int *csrRowPtr = (int *)_mm_malloc((m+1) * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
    VALUE_TYPE *x = (VALUE_TYPE *)_mm_malloc((m+1) * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < m+1; i++) {
      f >> csrRowPtr[i];
      x[i] = 1.0;
    }
    int *csrColIdx = (int *)_mm_malloc(nnzA * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < nnzA; i++) {
      f >> csrColIdx[i];
    }
    VALUE_TYPE *csrVal = (VALUE_TYPE *)_mm_malloc(nnzA * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    for (int i = 0; i < nnzA; i++) {
      f >> csrVal[i];
    }

    VALUE_TYPE *y = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
    VALUE_TYPE *y_ref = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
#if DEBUG
    std::cout << "y_ref ";
#endif
    for (int i = 0; i < m; i++)
    {
        VALUE_TYPE sum = 0;
        for (int j = csrRowPtr[i]; j < csrRowPtr[i+1]; j++)
            sum += x[csrColIdx[j]] * csrVal[j] * alpha;
        y_ref[i] = sum;
#if DEBUG
        std::cout << sum << ", ";
#endif
    }

    compute_avx2(m, n, nnzA, csrRowPtr, csrColIdx, csrVal, x, y, y_ref, alpha);
  }

}


int main(int argc, char* argv[])
{
  // report precision of floating-point
  std::cout << "------------------------------------------------------" << std::endl;
  if (sizeof(VALUE_TYPE) == 4) {
    std::cout << "32-bit Single Precision";
  }
  else if (sizeof(VALUE_TYPE) == 8) {
    std::cout << "64-bit Double Precision";
  }
  else {
    std::cout << "Wrong precision. Program exit!" << std::endl;
    return 0;
  }
  std::cout << "------------------------------------------------------" << std::endl;

  int m, n, nnzA;

  //ex: ./spmv webbase-1M.mtx
  int argi = 1;
  VALUE_TYPE alpha = 1.0;
  int err = 0;

  char  *filename;
  if(argc > 1) {
    filename = argv[argi++];
    outf.open(argv[argi++]);
    if (!outf.is_open()) return -1;
  } else {
    std::cout << "Usage : ./spmv <test.exp> tmp.csv" << std::endl;
    std::cout << "Running a test mtx matrix " << std::endl;

    return 0;
  }
  std::cout << "--------------" << filename << "--------------" << std::endl;
  outf << "Name,Baseline ms,Baseline BW, Baseline GFlops";
#if __AVX2__
  outf << ",SPADE ms, SPADE BW, SPADE GFLOPs";
#endif
#if MKL
  outf << ",MKL ms, MKL BW, MKL GFLOPs";
#endif
  outf << std::endl;
  std::ifstream in_file(filename);
  std::string s;
  while ( in_file >> s) {
     int *csrRowPtrA;
     int *csrColIdxA;
     VALUE_TYPE *csrValA;
     // read matrix from mtx file
     int ret_code;
     MM_typecode matcode;
     FILE *f;

     int nnzA_mtx_report;
     int isInteger = 0, isReal = 0, isPattern = 0, isSymmetric = 0;

     // load matrix
     if ((f = fopen(s.c_str(), "r")) == NULL) {
         std::cout << "Can't open " << s << std::endl;
         continue;
     }
     std::string last_element(s.substr(s.rfind("/") + 1));
     outf << last_element << ",";
     print_features(f);
     rewind(f);
     if (mm_read_banner(f, &matcode) != 0)
     {
         std::cout << "Could not process Matrix Market banner." << std::endl;
         return -2;
     }

     if ( mm_is_complex( matcode ) )
     {
         std::cout <<"Sorry, data type 'COMPLEX' is not supported. " << std::endl;
         return -3;
     }

     if ( mm_is_pattern( matcode ) )  { isPattern = 1; /*cout << "type = Pattern" << std::endl;*/ }
     if ( mm_is_real ( matcode) )     { isReal = 1; /*cout << "type = real" << std::endl;*/ }
     if ( mm_is_integer ( matcode ) ) { isInteger = 1; /*cout << "type = integer" << std::endl;*/ }

     /* find out size of sparse matrix .... */
     ret_code = mm_read_mtx_crd_size(f, &m, &n, &nnzA_mtx_report);
     if (ret_code != 0)
         return -4;

     if ( mm_is_symmetric( matcode ) || mm_is_hermitian( matcode ) )
     {
         isSymmetric = 1;
         std::cout << "symmetric = true" << std::endl;
     }
     else
     {
         std::cout << "symmetric = false" << std::endl;
     }

     int *csrRowPtrA_counter = (int *)calloc((m+1) ,sizeof(int));
     //memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

     int *csrRowIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
     int *csrColIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
     VALUE_TYPE *csrValA_tmp    = (VALUE_TYPE *)malloc(nnzA_mtx_report * sizeof(VALUE_TYPE));

     /* NOTE: when reading in doubles, ANSI C requires the use of the "l"  */
     /*   specifier as in "%lg", "%lf", "%le", otherwise errors will occur */
     /*  (ANSI C X3.159-1989, Sec. 4.9.6.2, p. 136 lines 13-15)            */

     for (int i = 0; i < nnzA_mtx_report; i++)
     {
         int idxi, idxj;
         double fval;
         int ival;

         if (isReal)
             fscanf(f, "%d %d %lg\n", &idxi, &idxj, &fval);
         else if (isInteger)
         {
             fscanf(f, "%d %d %d\n", &idxi, &idxj, &ival);
             fval = ival;
         }
         else if (isPattern)
         {
             fscanf(f, "%d %d\n", &idxi, &idxj);
             fval = 1.0;
         }

         // adjust from 1-based to 0-based
         idxi--;
         idxj--;

         csrRowPtrA_counter[idxi]++;
         csrRowIdxA_tmp[i] = idxi;
         csrColIdxA_tmp[i] = idxj;
         csrValA_tmp[i] = fval;
     }

     if (f != stdin)
         fclose(f);

     if (isSymmetric)
     {
         for (int i = 0; i < nnzA_mtx_report; i++)
         {
             if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i])
                 csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
         }
     }

     // exclusive scan for csrRowPtrA_counter
     int old_val, new_val;

     old_val = csrRowPtrA_counter[0];
     csrRowPtrA_counter[0] = 0;
     for (int i = 1; i <= m; i++)
     {
         new_val = csrRowPtrA_counter[i];
         csrRowPtrA_counter[i] = old_val + csrRowPtrA_counter[i-1];
         old_val = new_val;
     }

     nnzA = csrRowPtrA_counter[m];
     csrRowPtrA = (int *)_mm_malloc((m+1) * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
     memcpy(csrRowPtrA, csrRowPtrA_counter, (m+1) * sizeof(int));
     memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

     csrColIdxA = (int *)_mm_malloc(nnzA * sizeof(int), ANONYMOUSLIB_X86_CACHELINE);
     csrValA    = (VALUE_TYPE *)_mm_malloc(nnzA * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);

     if (isSymmetric) {
         for (int i = 0; i < nnzA_mtx_report; i++) {
             if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i]) {
                 int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
                 csrColIdxA[offset] = csrColIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;

                 offset = csrRowPtrA[csrColIdxA_tmp[i]] + csrRowPtrA_counter[csrColIdxA_tmp[i]];
                 csrColIdxA[offset] = csrRowIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
             }
             else {
                 int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
                 csrColIdxA[offset] = csrColIdxA_tmp[i];
                 csrValA[offset] = csrValA_tmp[i];
                 csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
             }
         }
     }
     else {
         for (int i = 0; i < nnzA_mtx_report; i++) {
             int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
             csrColIdxA[offset] = csrColIdxA_tmp[i];
             csrValA[offset] = csrValA_tmp[i];
             csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
         }
     }

     // free tmp space
     free(csrColIdxA_tmp);
     free(csrValA_tmp);
     free(csrRowIdxA_tmp);
     free(csrRowPtrA_counter);

     srand(time(NULL));

     // set csrValA to 1, easy for checking floating-point results
     for (int i = 0; i < nnzA; i++)
     {
         csrValA[i] = rand() % 10;
         //csrValA[i] = 1.0;
     }

     std::cout << " ( " << m << ", " << n << " ) nnz = " << nnzA << std::endl;

     VALUE_TYPE *x = (VALUE_TYPE *)_mm_malloc(n * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
     for (int i = 0; i < n; i++)
         x[i] = rand() % 10;

     VALUE_TYPE *y = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);
     VALUE_TYPE *y_ref = (VALUE_TYPE *)_mm_malloc(m * sizeof(VALUE_TYPE), ANONYMOUSLIB_X86_CACHELINE);

     double gb = getB<int, VALUE_TYPE>(m, nnzA);
     double gflop = getFLOP<int>(nnzA);


     // compute reference results on a cpu core
     anonymouslib_timer ref_timer;
     ref_timer.start();

     int ref_iter = 1;
     for (int iter = 0; iter < ref_iter; iter++)
     {
         for (int i = 0; i < m; i++)
         {
             VALUE_TYPE sum = 0;
             for (int j = csrRowPtrA[i]; j < csrRowPtrA[i+1]; j++)
                 sum += x[csrColIdxA[j]] * csrValA[j] * alpha;
             y_ref[i] = sum;
         }
     }

     double ref_time = ref_timer.stop() / (double)ref_iter;
     std::cout << "cpu sequential time = " << ref_time
          << " ms. Bandwidth = " << gb/(1.0e+6 * ref_time)
          << " GB/s. GFlops = " << gflop/(1.0e+6 * ref_time)  << " GFlops." << std::endl << std::endl;

     std::cout << "Baseline " << std::endl;
     compute_baseline(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
     std::cout << "Spade AVX baseline " << std::endl;
#if __AVX2__
     compute_avx2(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
#endif
#if MKL
     std::cout << "MKL " << std::endl;
     compute_mkl(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref, alpha);
#endif
      outf << std::endl;
     _mm_free(csrRowPtrA);
     _mm_free(csrColIdxA);
     _mm_free(csrValA);
     _mm_free(x);
     _mm_free(y);
     _mm_free(y_ref);
  }

  return 0;

}
