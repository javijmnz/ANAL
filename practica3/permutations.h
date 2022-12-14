/**
 *
 * Descripcion: Header for functions for permutations generation
 *
 * Fichero: permutations.h
 * Autor: Carlos Aguirre 
 * Version: 1.1
 * Fecha: 16-09-2019
 *
 */

#ifndef PERMUTATIONS_H
#define PERMUTATIONS_H

/* constants */

#ifndef ERR
  #define ERR -1
  #define OK (!(ERR))
#endif

typedef int *(* pfunc_perm)(int);

int random_num(int inf, int sup);

int* generate_perm(int N);

int *generate_sorted_perm(int N);

#endif
