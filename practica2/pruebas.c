#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int* perm_worst_case_mergesort(int pot);
int * generate_quicksort_worst_perm_v2(int N);
int * generate_quicksort_worst_perm_v3(int N);

void _swap(int *e1, int *e2) {
  int aux;

  /* Comprueba parámetros */
  if (!e1 || !e2 || *e1 == *e2)
    return;

  aux = *e1;
  *e1 = *e2;
  *e2 = aux;
}

int main(){
    int *array, i;

    array = perm_worst_case_mergesort(3);

    for (i = 0; i < 8; i++)
        printf("%d ", array[i]);
    
    free(array);
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
  int *array, i, size = (int) pow(2, pot), aux;

  array = (int*) malloc(size * sizeof(int));
  if (!array)
    return NULL;

  perm_worst_case_mergesort_rec(pot, array);
  
  return array;
}

int * generate_quicksort_worst_perm_v2(int N){
  int *array, i, j, k, l;

  array = (int*) malloc(N * sizeof(int));
  if (!array)
    return NULL;

  for (i = N/2 - 1, j = N/2, k= 1; i >= 0; i--, j++, k += 2){
    array[i] = k;
    array[j] = k + 1;
  }
  if (N % 2)
    array[j] = k;

  return array;
}

int *generate_quicksort_worst_perm_v3(int N){
  int *p, *v, i, pivot0, pivot1;


  p = (int*) malloc(N * sizeof(int));
  if (!p)
    return NULL;

  v = (int*) malloc(N * sizeof(int));
  if (!v){
    free(p);
    return NULL;
  }

  for (i = 0; i < N; i++)
    p[i] = i;

  for(i = 0; i < N; i += 2){
    pivot0 = i;
    pivot1 = (i + N - 1)/2;
    v[p[pivot1]] = i + 1;
    v[p[pivot0]] = i;
    _swap(p + pivot1, p + i + 1);
    
  }

  if(i == N){
    v[N -1] = i - 1;
  }

  return v;
}
