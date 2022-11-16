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

    array = generate_quicksort_worst_perm_v3(3);

    for (i = 0; i < 3; i++)
        printf("%d ", array[i]);
    
    free(array);
    return 0;
}

void _generate_mergesort_worst_perm_rec(int pot, int* array) {
  int i, size;
  if (pot == 0) {
    array[0] = 1;
    return; 
  }

  _generate_mergesort_worst_perm_rec(pot - 1, array);
  _generate_mergesort_worst_perm_rec(pot - 1, array + (int) pow(2, pot - 1));
  size = pow(2, pot - 1);

  for (i = 0; i < size; i++) {
    array[i] = 2 * array[i] -1;
    array[size + i] = 2 * array[size + i];
  }
}

int *generate_mergesort_worst_perm(int pot) {
  int *array, size = (int) pow(2, pot);

  array = (int*) malloc(size * sizeof(int));
  if (!array)
    return NULL;

  _generate_mergesort_worst_perm_rec(pot, array);
  
  return array;
}

int *generate_quicksort_worst_perm_v2(int N){
  int *array, i, j, k;

  array = (int*) malloc(N * sizeof(int));
  if (!array)
    return NULL;
  if (N % 2) {
    for (i = N/2, j = N/2 + 1, k = 1; i > 0; i--, j++, k += 2){
      array[i] = k;
      array[j] = k + 1;
    }
    array[0] = k;
  } else {
    for (i = N/2 - 1, j = N/2, k= 1; i >= 0; i--, j++, k += 2){
      array[i] = k;
      array[j] = k + 1;
    }
  }

  return array;
}

int *generate_quicksort_worst_perm_v3(int N){
  int *p, *v, i, pivot0, pivot1;

  N *= 2;
  
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

  for (i = 0; i < N; i++)
    v[i]++;

  free(p);

  return v;
}
