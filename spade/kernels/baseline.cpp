#include "utils.h"

void spmv_baseline(int m, int n,  VALUE_TYPE  alpha,
                  VALUE_TYPE *  x, VALUE_TYPE  *y,  int*  csr_row_pointer,
                  int*  csr_column_index,  VALUE_TYPE*  csr_value)
{
    int i, j;
    VALUE_TYPE temp;
    for(i = 0; i < m ; i++) {
      temp = 0;
#if DEBUG
      std::cout << " Row " << csr_row_pointer[i] << ", " << csr_row_pointer[i+1] << std::endl;
      std::cout << "Vals, index " << std::endl;
#endif
      for(j = csr_row_pointer[i]; j < csr_row_pointer[i+1]; j++){
#if DEBUG
        std::cout << csr_value[j] << ", " << x[csr_column_index[j]] << ", " << csr_column_index[j] << std::endl;
#endif
        temp += csr_value[j] * x[csr_column_index[j]];
      }
      y[i] = temp;
    }
}
