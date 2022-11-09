/**
 *
 * Descripcion: Header file for sorting functions 
 *
 * Fichero: sorting.h
 * Autor: Carlos Aguirre
 * Version: 1.0
 * Fecha: 16-09-2019
 *
 */

#ifndef SORTING_H
#define SORTING_H

/* constants */

#ifndef ERR
  #define ERR -1
  #define OK (!(ERR))
#endif

/* type definitions */
typedef int (* pfunc_sort)(int*, int, int);

typedef int (* pfunc_median)(int *, int, int, int *);

/* Functions */

int SelectSort(int* array, int ip, int iu);
int SelectSortInv(int* array, int ip, int iu);
int min(int* array, int ip, int iu);
int MergeSort(int* tabla, int ip, int iu);
int merge(int* tabla, int ip, int iu, int imedio);
int QuickSort_v1(int* tabla, int ip, int iu);
int QuickSort_v2(int* tabla, int ip, int iu);
int QuickSort_v3(int* tabla, int ip, int iu);
int partition(int* tabla, int ip, int iu, int *pos, pfunc_median median);
int median(int *tabla, int ip, int iu, int *pos);
int median_avg(int *tabla, int ip, int iu, int *pos);
int median_stat(int *tabla, int ip, int iu, int *pos);

#endif
