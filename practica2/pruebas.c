#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int* perm_worst_case_mergesort(int pot);

int main(){
    int *array, i;

    array = perm_worst_case_mergesort(4);

    for (i = 0; i < 16; i++)
        printf("%d ", array[i]);
    
    return 0;
}

void perm_worst_case_mergesort_rec(int pot, int*array) {
  int i, size;
  if(pot == 0){
    array[0] = 1;
    return; 
  }

  perm_worst_case_mergesort_rec(pot - 1, array);
  perm_worst_case_mergesort_rec(pot - 1, array + (int) pow(2, pot - 1));
  size = pow(2, pot - 1);

  for(i = 0; i < size; i++){
    array[i] = 2 * array[i] -1;
    array[size + i] = 2 * array[size + i];
  }
}

int* perm_worst_case_mergesort(int pot){
  int *array, i, size = (int) pow(pot, 2), aux;

  array = (int*) malloc(size * sizeof(int));
  if (!array)
    return NULL;

  perm_worst_case_mergesort_rec(pot, array);
  
  return array;
}
