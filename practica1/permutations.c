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
  /* Comprobación de parámetros */
  if (inf > sup || inf < 0 || inf > RAND_MAX || sup > RAND_MAX)
    return ERR;
  
  return inf + (int) ((sup - inf + 1.0) * (rand() / (RAND_MAX + 1.0)));
}

int random_num_mal(int inf, int sup) {
  return inf + (random_num(0, 2000) % (sup - inf + 1));
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
      free(perms);
      return NULL;
    }
  }
  
  return perms;
}

