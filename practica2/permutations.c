/**
 *
 * Descripcion: Implementation of function that generate permutations
 *
 * File: permutations.c
 * Autores: Javier Jiménez, Pablo Fernández
 * Version: 1.1
 *
 */


#include "permutations.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
#include <math.h>

void __swap(int *e1, int *e2) {
  int aux;

  /* Comprueba parámetros */
  if (!e1 || !e2 || *e1 == *e2)
    return;

  aux = *e1;
  *e1 = *e2;
  *e2 = aux;
}

/***************************************************/
/* Function: random_num Date:                      */
/* Authors: Javier Jiménez y Pablo Fernández       */
/*                                                 */
/* Rutine that generates a random number           */
/* between two given numbers                       */
/*                                                 */
/* Input:                                          */
/* int inf: lower limit                            */
/* int sup: upper limit                            */
/* Output:                                         */
/* int: random number                              */
/***************************************************/

int random_num(int inf, int sup) {
  /* Comprobación de parámetros */
  if (inf > sup || inf < 0)
    return ERR;
  
  return inf + (int) ((sup - inf + 1.0) * (rand() / ((double)RAND_MAX + 1.0)));
}

int random_num_mal(int inf, int sup) {
  /* Comprobación de parámetros */
  if (inf > sup || inf < 0)
    return ERR;
  
  return inf + (rand() % (sup - inf + 1));
}

/***************************************************/
/* Function: generate_perm Date:                   */
/* Authors:                                        */
/*                                                 */
/* Rutine that generates a random permutation      */
/*                                                 */
/* Input:                                          */
/* int n: number of elements in the permutation    */
/* Output:                                         */
/* int *: pointer to integer array                 */
/* that contains the permutation                   */
/* or NULL in case of error                        */
/***************************************************/
int * generate_perm(int N)
{
  int *perm, i, j, aux;
  
  /* Comprueba parámetros */
  if (N <= 0)
    return NULL;
  
  /* Reserva memoria para los números */
  perm = (int *) calloc(N, sizeof(int));
  if (!perm)
    return NULL;
  
  /* Genera los números */
  for (i = 0; i < N; i++) {
    perm[i] = i + 1;
  }

  /* Permuta los números */
  for (i = 0; i < N; i++) {
    j = random_num(i, N-1);
    if (j == ERR)
      return NULL;

    aux = perm[i];
    perm[i] = perm[j];
    perm[j] = aux;
  }
  
  return perm;
}


/***************************************************/
/* Function: generate_permutations Date:           */
/* Authors:                                        */
/*                                                 */
/* Function that generates n_perms random          */
/* permutations with N elements                    */
/*                                                 */
/* Input:                                          */
/* int n_perms: Number of permutations             */
/* int N: Number of elements in each permutation   */
/* Output:                                         */
/* int**: Array of pointers to integer that point  */
/* to each of the permutations                     */
/* NULL en case of error                           */
/***************************************************/

int ** generate_permutations(int n_perms, int N) {
  int ** perms, i, flag = OK;

  /* Comprueba parámetros */
  if (n_perms <= 0 || N <= 0)
    return NULL;

  /* Reserva memoria para los punteros a las permutaciones */
  perms = (int **) malloc(n_perms * sizeof(int *));
  if (!perms) {
    return NULL;        
  }
  
  /* Genera las permutaciones */
  for (i = 0; i < n_perms && flag == OK; i++){
    perms[i] = generate_perm(N);
    if (perms[i] == NULL) {
      flag = ERR;
    }
  }

  /* Comprueba errores en la generación de permutaciones */
  if (flag == ERR) {
    for (i -= 2; i >= 0; i--) {
      free(perms[i]);
    }
    free(perms);
    return NULL;
  }
  
  return perms;
}

int **copy_permutations(int **array, int n_perms, int N){
  int ** perms, i, flag = OK;

  /* Comprueba parámetros */
  if (n_perms <= 0 || N <= 0 || !array)
    return NULL;

  /* Reserva memoria para los punteros a las permutaciones */
  perms = (int **) malloc(n_perms * sizeof(int *));
  if (!perms) {
    return NULL;        
  }
  
  /* copia las permutaciones */
  for (i = 0; i < n_perms && flag == OK; i++){
    perms[i] = copy_perm(array[i], N);
    if (perms[i] == NULL) {
      flag = ERR;
    }
  }
  /* Comprueba errores en la copia de permutaciones */
  if (flag == ERR) {
    for (i -= 2; i >= 0; i--) {
      free(perms[i]);
    }
    free(perms);
    return NULL;
  }
  
  return perms;
  
}

int *copy_perm(int *array, int N){
  int *copy, i;

  if (N <= 0 || !array)
    return NULL;
  
  /* Reserva memoria para los números */
  copy = (int *) calloc(N, sizeof(int));
  if (!copy)
    return NULL;
  
  /* Genera los números */
  for (i = 0; i < N; i++) {
    copy[i] = array[i];
  }
  return copy;
}

int ** generate_permutations_alt(pfunc_perm func_perm, int n_perms, int N) {
  int **perms, i, flag = OK;

  /* Comprueba parámetros */
  if (!func_perm || n_perms <= 0 || N <= 0)
    return NULL;

  /* Reserva memoria para los punteros a las permutaciones */
  perms = (int **) malloc(n_perms * sizeof(int *));
  if (!perms)
    return NULL;        

  /* Genera las permutaciones */
  for (i = 0; i < n_perms && flag == OK; i++){
    perms[i] = func_perm(N);
    if (perms[i] == NULL)
      flag = ERR;
  }

  /* Comprueba errores en la generación de permutaciones */
  if (flag == ERR) {
    for (i -= 2; i >= 0; i--) {
      free(perms[i]);
      free(perms);
      return NULL;
    }
  }

  return perms;
}

/* Generación de permutaciones para casos peores */

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

int *generate_quicksort_worst_perm_v1(int N){
  int *array, i;

  array = (int*) malloc(N * sizeof(int));
  if (!array)
    return NULL;

  for (i = 0; i < N; i++){
    array[i] = i;
  }

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

  p = (int *) malloc(N * sizeof(int));
  if (!p)
    return NULL;

  v = (int *) malloc(N * sizeof(int));
  if (!v) {
    free(p);
    return NULL;
  }

  for (i = 1; i <= N; i++)
    p[i] = i;

  for(i = 0; i < N; i += 2){
    pivot0 = i;
    pivot1 = (i + N - 1)/2;
    v[p[pivot1]] = i + 1;
    v[p[pivot0]] = i;
    __swap(p + pivot1, p + i + 1);
    
  }

  if(i == N)
    v[N -1] = i - 1;

  for (i = 0; i < N; i++)
    v[i]++;
  
  return v;
}
