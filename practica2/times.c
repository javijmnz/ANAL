/**
 *
 * Descripcion: Implementation of time measurement functions
 *
 * Fichero: times.c
 * Autores: Javier Jiménez, Pablo Fernández
 * Version: 1.0
 *
 */

#include "times.h"
#include "sorting.h"
#include "permutations.h"
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

/* FUNCIONES PRIVADAS */

void free_perms(int **array, int num){
  int i;
  for(i = 0; i < num; i++)
    free(array[i]);
  free(array);
}

void perm_worst_case_mergesort_rec(int pot, int*array); 

/***************************************************/
/* Function: average_sorting_time Date:            */
/*                                                 */
/* Calcula los tiempos de ejecución de una función */
/* de ordenación de permutadciones de enteros      */
/* Input:                                          */
/*  pfunc_sort metodo: puntero a la función de     */
/*    ordenacción                                  */
/*  int n_perms: número de permutaciones a ordenar */
/*  int N: tamaño de las permutaciones a ordenar   */
/*  PTIME_AA ptime: puntero a la estructura donde  */
/*    se almacenan los tiempos                     */
/* Output:                                         */
/*  short: OK si todo ha ido bien o ERR si ha      */
/*    habido algún problema                        */
/***************************************************/
short average_sorting_time(pfunc_sort metodo, int n_perms, int N, PTIME_AA ptime){
  int **array, total_ob = 0, i, ob, min_ob, max_ob;
  clock_t comienzo, final;
  
  /* Comprueba parámetros */
  if (!metodo || n_perms <= 0 || N <= 0 || !ptime)
    return ERR;

  /* Genera las permutaciones */
  array = generate_permutations(n_perms, N);
  if (!array)
    return ERR;
  
  /* Definimos valores por defecto para OB mínimas y máximas (son límites) */
  min_ob = INT_MAX;
  max_ob = 0;

  /* Comienza el test de rendimiento */
  comienzo = clock();

  for (i = 0; i < n_perms; i++) {
    /* Ordena la permutación i-ésima */
    ob = metodo(array[i], 0, N - 1);
    if (ob == ERR) {
      free_perms(array, n_perms);
      return ERR;
    }
    
    /* Vamos contando el número total de OB en todas las permutaciones para calcular después el promedio */
    total_ob += ob;

    /* Actualizamos los valores de OB máxima y mínima (en la primera iteración toman valores con sentido) */
    if (max_ob < ob)
      max_ob = ob;
    
    if (min_ob > ob)
      min_ob = ob;
  }
  
  /* Termina el test de rendimiento*/
  final = clock();
  
  /* Libera las permutaciones */
  free_perms(array, n_perms);

  /* Almacenamos los datos necesarios en la estructura ptime */
  ptime->n_elems = n_perms;
  ptime->N = N;
  ptime->time = (double)(final - comienzo) / (double)n_perms;
  ptime->average_ob = (double)total_ob / (double)n_perms;
  ptime->min_ob = min_ob;
  ptime->max_ob = max_ob;

  return OK;
}

short average_sorting_time_alt(pfunc_sort metodo, int n_perms, int N, int **array, PTIME_AA ptime) {
  int total_ob = 0, i, ob, min_ob, max_ob;
  clock_t comienzo, final;
  
  /* Comprueba parámetros */
  if (!metodo || n_perms <= 0 || !ptime || !array)
    return ERR;
  
  /* Definimos valores por defecto para OB mínimas y máximas (son límites) */
  min_ob = INT_MAX;
  max_ob = 0;

  /* Comienza el test de rendimiento */
  comienzo = clock();

  for (i = 0; i < n_perms; i++) {
    /* Ordena la permutación i-ésima */
    ob = metodo(array[i], 0, N - 1);
    if (ob == ERR) {
      return ERR;
    }
    
    /* Vamos contando el número total de OB en todas las permutaciones para calcular después el promedio */
    total_ob += ob;

    /* Actualizamos los valores de OB máxima y mínima (en la primera iteración toman valores con sentido) */
    if (max_ob < ob)
      max_ob = ob;
    
    if (min_ob > ob)
      min_ob = ob;
  }
  
  /* Termina el test de rendimiento*/
  final = clock();

  /* Almacenamos los datos necesarios en la estructura ptime */
  ptime->n_elems = n_perms;
  ptime->N = N;
  ptime->time = (double)(final - comienzo) / (double)n_perms;
  ptime->average_ob = (double)total_ob / (double)n_perms;
  ptime->min_ob = min_ob;
  ptime->max_ob = max_ob;

  return OK;
}

/***************************************************/
/* Function: generate_sorting_times Date:          */
/*                                                 */
/* Calcula los tiempos de ejecución de una función */
/* de ordenación de permutadciones de enteros para */
/* un conjunto de tamaños                          */
/* Input:                                          */
/*  pfunc_sort method: puntero a la función de     */
/*    ordenacción                                  */
/*  char* file: nombre del fichero donde se va a   */
/*    guardar la información                       */
/*  int num_min: tamaño mínimo de las permutaciones*/
/*    a ordenar                                    */
/*  int num_max: tamaño máximo de las permutaciones*/
/*    a ordenar                                    */
/*  int incr: diferencia entre cada tamaño de      */
/*    permutacioens para el test                   */
/*  int n_perms: número de permutaciones a ordenar */
/*    por cada tamaño                              */
/* Output:                                         */
/*  short: OK si todo ha ido bien o ERR si ha      */
/*    habido algún problema                        */
/***************************************************/
short generate_sorting_times(pfunc_sort method, char* file, int num_min, int num_max, int incr, int n_perms){
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes;
  
  /* Comprueba parámetros */
  if (!method || !file || num_min <= 0 || num_max < num_min || incr <= 0 || n_perms <= 0)
    return ERR;
  
  /* Cálculo del número de tamaños a probar */
  num_ptimes = (num_max - num_min) / incr + 1;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times)
    return ERR;
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = num_min, j = 0, flag = OK; i <= num_max && flag == OK; i+= incr, j++)
    flag = average_sorting_time(method, n_perms, i, sorting_times + j);
  
  /* Control de errores */
  if (flag == ERR) {
    free(sorting_times);
    return ERR;
  }

  /* Guarda los sorting times en un fichero */
  flag = save_time_table(file, sorting_times, num_ptimes);
  free(sorting_times);

  return flag;
}

short generate_sorting_times_2func(pfunc_sort method_1, pfunc_sort method_2, char* file_1, char* file_2, int num_min, int num_max, int incr, int n_perms){ 
  PTIME_AA sorting_times_1, sorting_times_2;
  int i, j, flag, num_ptimes, **perms;
  
  /* Comprueba parámetros */
  if (!method_1 ||!method_2 || !file_1 || !file_2 || num_min <= 0 || num_max < num_min || incr <= 0 || n_perms <= 0)
    return ERR;
  
  /* Cálculo del número de tamaños a probar */
  num_ptimes = (num_max - num_min) / incr + 1;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times_1 = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times_1)
    return ERR;
  
  sorting_times_2 = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times_2){
    free(sorting_times_2);
    return ERR;
  }
    
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = num_min, j = 0, flag = OK ; i <= num_max && flag == OK; i+= incr, j++)
    perms = generate_permutations(n_perms, i);
    if(!perms)
      flag = ERR;
    if(flag == OK)
      flag = average_sorting_time_alt(method_1, n_perms, i, perms, sorting_times_1 + j);
    if(flag == OK)
      flag = average_sorting_time_alt(method_2, n_perms, i, perms, sorting_times_2 + j);
  
  /* Control de errores */
  if (flag == ERR) {
    free(sorting_times_1);
    free(sorting_times_2);
    return ERR;
  }

  /* Guarda los sorting times en un fichero */
  flag = save_time_table(file_1, sorting_times_1, num_ptimes);
  if(flag == OK)
    flag = save_time_table(file_2, sorting_times_2, num_ptimes);

  free(sorting_times_1);
  free(sorting_times_2);

  return flag;
}

short generate_sorting_times_mergesort_worst(char* file, int pot_min, int pot_max){
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes, *perm[1];
  
  /* Comprueba parámetros */
  if (!file || pot_min < 0 || pot_max < pot_min)
    return ERR;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times)
    return ERR;
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = pot_min, j = 0, flag = OK; i <= pot_max && flag == OK; i++, j++)
    perm[0] = generate_mergesort_worst_perm(i);
    if(!perm[0])
      flag = ERR;
    if(flag == OK)  
      flag = average_sorting_time_alt(MergeSort, 1, pow(2, i), perm, sorting_times + j);
  
  /* Control de errores */
  if (flag == ERR) {
    free(sorting_times);
    return ERR;
  }

  /* Guarda los sorting times en un fichero */
  flag = save_time_table(file, sorting_times, num_ptimes);
  free(sorting_times);

  return flag;
}

short generate_sorting_times_quicksort_worst(pfunc_sort _quicksort, char* file, int num_min, int num_max, int incr){
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes, *perm[1];
  
  /* Comprueba parámetros */
  if (!_quicksort || !file || num_min <= 0 || num_max < num_min || incr <= 0)
    return ERR;
  
  /* Comprueba quicksort */
  if (_quicksort != QuickSort_v1 && _quicksort != QuickSort_v2 && _quicksort != QuickSort_v3){
    return ERR;
  }
  
  /* Cálculo de los sorting times para cada tamaño */
  /* Cálculo del número de tamaños a probar */
  num_ptimes = (num_max - num_min) / incr + 1;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times)
    return ERR;
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = num_min, j = 0, flag = OK; i <= num_max && flag == OK; i+= incr, j++)
    perm[0] = generate_quicksort_worst_perm(i);
    if(!perm[0])
      flag == ERR;
    if(flag == OK)
      flag = average_sorting_time_alt(_quicksort, 1, i, perm, sorting_times + j);
  
  /* Control de errores */
  if (flag == ERR) {
    free(sorting_times);
    return ERR;
  }

  /* Guarda los sorting times en un fichero */
  flag = save_time_table(file, sorting_times, num_ptimes);
  free(sorting_times);

  return flag;
}

/***************************************************/
/* Function: save_time_table Date:                 */
/*                                                 */
/* Guarda los tiempos de ejecución almacenados en  */
/* unas estructuras TIME_AA en un fichero de texto */
/* Input:                                          */ 
/*  char* file: nombre del fichero donde se va a   */
/*    guardar la información                       */
/*  PTIME_AA ptime: puntero al array de estructuras*/
/*    TIME_AA cuya información se quiere guardar   */
/*  int n_times: tamaño del array de estructuras   */
/*    TIME_AA                                      */
/* Output:                                         */
/*  short: OK si todo ha ido bien o ERR si ha      */
/*    habido algún problema                        */
/***************************************************/
short save_time_table(char *file, PTIME_AA ptime, int n_times)
{
  FILE *pf;
  int i;

  /* Comprueba parámetros */
  if (!file || !ptime || n_times <= 0)
    return ERR;
  
  /* Abre el archivo en modo escritura */
  pf = fopen(file, "w");
  if (!pf)
    return ERR;
  
  /* Imprime los datos del array ptime en el fichero */
  for (i = 0; i < n_times; i++) {
    fprintf(pf, "%d %lf %lf %d %d\n", ptime[i].N, ptime[i].time, ptime[i].average_ob, ptime[i].max_ob, ptime[i].min_ob);
  }
  
  fclose(pf);
  return OK;
}
