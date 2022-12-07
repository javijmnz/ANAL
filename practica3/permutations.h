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
int random_num_mal(int inf, int sup);
int* generate_perm(int N);
int** generate_permutations(int n_perms, int N);
int ** generate_permutations_alt(pfunc_perm func_perm, int n_perms, int N);
int *generate_mergesort_worst_perm(int pot);
int * generate_quicksort_worst_perm_v1(int N);
int * generate_quicksort_worst_perm_v2(int N);
int * generate_quicksort_worst_perm_v3(int N);
int **copy_permutations(int **array, int n_perms, int N);
int *copy_perm(int *array, int N);

int *generate_sorted_perm(int N);

#endif
