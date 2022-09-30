/**
 *
 * Descripcion: Implementation of time measurement functions
 *
 * Fichero: times.c
 * Autor: Carlos Aguirre Maeso
 * Version: 1.0
 * Fecha: 16-09-2019
 *
 */

#include "times.h"
#include "sorting.h"
#include "permutations.h"
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

/* FUNCIONES PRIVADAS */

void free_perms(int **array, int num){
  int i;
  for(i = 0; i < num; i++)
    free(array[i]);
  free(array);
}

/***************************************************/
/* Function: average_sorting_time Date:            */
/*                                                 */
/* Your documentation                              */
/***************************************************/
short average_sorting_time(pfunc_sort metodo, int n_perms, int N, PTIME_AA ptime)
{
  int **array, promedio_tiempo = 0, promedio_ob = 0, i, ob, min_ob, max_ob;
  clock_t comienzo, final;
  
  /* Comprueba parámetros */
  if (!metodo || n_perms <= 0 || N <= 0 || !ptime)
    return ERR;

  array = generate_permutations(n_perms, N);
  if (!array)
    return ERR;
  
  max_ob = metodo(array[0],0, N - 1);
  if (max_ob == ERR) {
    free_perms(array, n_perms);
    return ERR;
  }
  min_ob = max_ob;

  comienzo = clock();

  for (i = 0; i < n_perms; i++) {

    ob = metodo(array[i],0, N - 1);
    if (ob == ERR) {
      free_perms(array, n_perms);
      return ERR;
    }
    
    promedio_ob += ob;

    if (max_ob < ob)
      max_ob = ob;
    
    if (min_ob > ob)
      min_ob = ob;
  }

  final = clock();
  promedio_tiempo = (double)(final - comienzo) / (double)n_perms;

  free(array);

  ptime->n_elems = n_perms;
  ptime->N = N;
  ptime->time = (double)promedio_tiempo / (double)n_perms;
  ptime->average_ob = (double)promedio_ob / (double)n_perms;
  ptime->min_ob = min_ob;
  ptime->max_ob = max_ob;

  return OK;
}

/***************************************************/
/* Function: generate_sorting_times Date:          */
/*                                                 */
/* Your documentation                              */
/***************************************************/
short generate_sorting_times(pfunc_sort method, char* file, int num_min, int num_max, int incr, int n_perms)
{
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes, correction;
  
  /* Comprueba parámetros */
  if (!method || !file || num_min <= 0 || num_max < num_min || incr <= 0 || n_perms <= 0 || incr < 1)
    return ERR;
  
  correction = (num_min % incr == num_max % incr ? 1:0);
  if (incr == 1)
    correction = 0;
  
  num_ptimes = (num_max - num_min + 1) / incr + correction;
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times)
    return ERR;
  
  for (i = num_min, j = 0, flag = OK; i <= num_max && flag == OK; i+= incr, j++)
    flag = average_sorting_time(method, n_perms, i, sorting_times + j);
  
  if (flag == ERR) {
    free(sorting_times);
    return ERR;
  }

  flag = save_time_table(file, sorting_times, num_ptimes);
  free(sorting_times);

  return flag;
}

/***************************************************/
/* Function: save_time_table Date:                 */
/*                                                 */
/* Your documentation                              */
/***************************************************/
short save_time_table(char *file, PTIME_AA ptime, int n_times)
{
  FILE *pf;
  int i;
  
  pf = fopen(file, "w");
  if (!pf)
    return ERR;
  
  for (i = 0; i < n_times; i++) {
    fprintf(pf, "%d %lf %lf %d %d\n", ptime[i].N, ptime[i].time, ptime[i].average_ob, ptime[i].max_ob, ptime[i].min_ob);
  }
  
  fclose(pf);
  return OK;
}


