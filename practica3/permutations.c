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
int * generate_perm(int N) {
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

int *generate_sorted_perm(int N){
  int *array, i;

  /* Comprueba parámetros */
  if (N <= 0)
    return NULL;

  /* Reserva memoria para la permutación */
  array = (int*) malloc(N * sizeof(int));
  if (!array)
    return NULL;

  /* Genera la permutación */
  for (i = 0; i < N; i++){
    array[i] = i + 1;
  }

  return array;
}
