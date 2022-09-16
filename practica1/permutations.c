/**
 *
 * Descripcion: Implementation of function that generate permutations
 *
 * File: permutations.c
 * Autor: Carlos Aguirre
 * Version: 1.1
 * Fecha: 21-09-2019
 *
 */


#include "permutations.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

/***************************************************/
/* Function: random_num Date:                      */
/* Authors:                                        */
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
int random_num(int inf, int sup)
{
  int k;
  /* Comprobación de parámetros */
  if (inf > sup)
    return ERR;
    
  /* Mala implementación */
  /* return inf + (rand() % (sup - inf + 1)); */
  
  /* Buena implementación */
  k = inf + (int) ((sup - inf + 1.0) * (rand() / (RAND_MAX + 1.0)));
  printf("%d", k);
  return k;
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
/* that contains the permitation                   */
/* or NULL in case of error                        */
/***************************************************/
int* generate_perm(int N)
{
  int *perm, i, j, aux;
  printf("%d N", N);

  /* Semilla */
  srand(time(NULL));
  
  /* Reserva memoria para los números */
  perm = (int *) calloc(N, sizeof(int));
  if (!perm)
    return NULL;
  
  /* Genera los números */
  for (i = 1; i <= N; i++) {
    perm[i] = i;
    printf("%d", i);
  }

  /* Permuta los números */
  for (i = 0; i <= N; i++) {
    printf("%d %d \n", i, N);
    j = random_num(0, N-1);
    printf("Random num: %d", j);
    aux = perm[i];
    perm[i] = perm[j];
    perm[j] = aux;
    printf("Perm[%d]%d   Perm[%d]%d", i, perm[i], j, perm[j]);
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
/*
int** generate_permutations(int n_perms, int N)
{
  int**ret, i, flag = 0;

  ret = calloc(n_perms, sizeof(int*));
  if(!ret){
    return NULL;        
  }
  
  for(i = 0; i < n_perms; i++){
    ret[i] = generate_perm(N);
    if(ret[i] == NULL)
  }

}
*/
