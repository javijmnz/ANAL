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

/***************************************************/
/* Function: average_sorting_time Date:            */
/*                                                 */
/* Your documentation                              */
/***************************************************/
short average_sorting_time(pfunc_sort metodo, int n_perms, int N, PTIME_AA ptime)
{
  int **array, comienzo, final, promedio_tiempo = 0, promedio_ob = 0, i, ob, min_ob, max_ob;

  
  /* Comprueba parámetros */
  if (!metodo || n_perms <= 0 || N <= 0 || !ptime)
    return ERR;

  array = generate_permutations(n_perms, N);
  if (!array)
    return ERR;
  
  max_ob = metodo(array[0],0, N - 1);
  min_ob = max_ob;

  for (i = 0; i < n_perms; i++) {

    comienzo = time(NULL);

    ob = metodo(array[i],0, N - 1);

    final = time(NULL);
  
    promedio_tiempo += final - comienzo;
    promedio_ob += ob;

    if (max_ob < ob)
      max_ob = ob;
    
    if (min_ob > ob)
      min_ob = ob;
  }

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
  int i;
  
  /* Comprueba parámetros */
  if (!method || !file || num_min <= 0 || num_max < num_min || incr <= 0 || n_perms <= 0)
    return ERR;
  
  sorting_times = malloc(((num_max - num_min + 1) / incr + 1) * sizeof(TIME_AA));
  if (!sorting_times)
    return ERR;
  
  for (i = num_min; i <= num_max; i+= incr){
    if (average_sorting_time(method, n_perms, ))
  }
}

/***************************************************/
/* Function: save_time_table Date:                 */
/*                                                 */
/* Your documentation                              */
/***************************************************/
short save_time_table(char* file, PTIME_AA ptime, int n_times)
{
  /* your code */
}


