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
#include "permutations.h"
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

/* FUNCIONES PRIVADAS */

void free_perms(int **array, int num){
  int i;

  /* Comprueba parámetros */
  if (!array || num < 0)
    return;
  
  for (i = 0; i < num; i++)
    free(array[i]);

  free(array);
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

short generate_search_times(pfunc_search method, pfunc_key_generator generator, int order, char* file, int num_min, int num_max, int incr, int n_times){
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes;
  
  /* Comprueba parámetros */
  if (!method || !generator || n_times <= 0 || !file || (order != 0 && order!= 1) || num_min < 0 || num_max < num_min || incr < 0)
    return ERR;
  
  /* Cálculo del número de tamaños a probar */
  num_ptimes = (num_max - num_min) / incr + 1;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times){
    return ERR;
  }
    
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = num_min, j = 0, flag = OK; i <= num_max && flag == OK; i+= incr, j++)
    flag = average_search_time(method, generator, order, i, n_times, sorting_times + j);
  
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

short generate_search_times_n_perm(pfunc_search method, pfunc_key_generator generator, int order, char* file, int num_min, int num_max, int incr, int n_perms, int n_times){
  PTIME_AA sorting_times;
  int i, j, flag, num_ptimes;
  
  /* Comprueba parámetros */
  if (!method || !generator || n_times <= 0 || !file || (order != 0 && order!= 1) || num_min < 0 || num_max < num_min || incr < 0)
    return ERR;
  
  /* Cálculo del número de tamaños a probar */
  num_ptimes = (num_max - num_min) / incr + 1;

  /* Reserva de memoria para las estructuras que almacenan los datos */
  sorting_times = (PTIME_AA) malloc(num_ptimes * sizeof(TIME_AA));
  if (!sorting_times){
    return ERR;
  }
    
  
  /* Cálculo de los sorting times para cada tamaño */
  for (i = num_min, j = 0, flag = OK; i <= num_max && flag == OK; i+= incr, j++)
    flag = average_search_time_n_perms(method, generator, order, i, n_times, n_perms, sorting_times + j);
  
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

short average_search_time(pfunc_search metodo, pfunc_key_generator generator, char order, int N, int n_times, PTIME_AA ptime) {
  int *perm = NULL, *keys = NULL, pos, i, ob, min_ob, max_ob;
  clock_t comienzo, final;
  long long total_ob = 0;
  PDICT dict = NULL;

  if (!metodo || !generator || N <= 0 || n_times <= 0 || !ptime || (order != 0 && order!= 1)){
    return ERR;
  }    

  dict = init_dictionary(N, order);
  if (!dict){
    return ERR;
  }

  /*Optimización*/

  if (order == NOT_SORTED)
    perm = generate_perm(N);
  else
    perm = generate_sorted_perm(N);

  if (!perm){
    free_dictionary(dict);
    return ERR;
  }

  
    
  if (massive_insertion_dictionary(dict, perm, N) == ERR){
    free(perm);
    free_dictionary(dict);
    return ERR;
  }
  
  keys = malloc(n_times * N * sizeof(int));
  if (!keys){
    printf("ERROR: memory");
    free(perm);
    free_dictionary(dict);
    return ERR;
  }
  
  generator(keys, n_times * N, N);

  /* Definimos valores por defecto para OB mínimas y máximas (son límites) */
  min_ob = INT_MAX;
  max_ob = 0;

  /* Comienza el test de rendimiento */
  comienzo = clock();

  for (i = 0; i < n_times * N; i++) {
    /* Busca la clave i-ésima */
    ob = search_dictionary(dict, keys[i], &pos, metodo);
    if (ob == ERR) {
      free(keys);
      free(perm);
      free_dictionary(dict);
      return ERR;
    }
    
    /* Vamos contando el número total de OB en todas las búsquedas para calcular después el promedio */
    total_ob += ob;

    /* Actualizamos los valores de OB máxima y mínima (en la primera iteración toman valores con sentido) */
    if (max_ob < ob)
      max_ob = ob;
    
    if (min_ob > ob)
      min_ob = ob;
  }
  
  /* Termina el test de rendimiento */
  final = clock();

  /* Almacenamos los datos necesarios en la estructura ptime */
  ptime->n_elems = n_times * N;
  ptime->N = N;
  ptime->time = (double)(final - comienzo) / (double)(n_times * N);
  ptime->average_ob = (double)total_ob / (double)(n_times * N);
  ptime->min_ob = min_ob;
  ptime->max_ob = max_ob;

  free(keys);
  free(perm);
  free_dictionary(dict);
  
  return OK;
}

short average_search_time_n_perms(pfunc_search metodo, pfunc_key_generator generator, char order, int N, int n_times, int n_perms, PTIME_AA ptime) {
  int *perm = NULL, *keys = NULL, pos, i, j, ob, min_ob, max_ob;
  clock_t comienzo, final;
  long long total_ob = 0;
  double tiempo = 0;
  PDICT dict = NULL;

  if (!metodo || !generator || N <= 0 || n_times <= 0 || n_perms <= 0 || !ptime || (order != 0 && order!= 1)){
    return ERR;
  }    

  for (j = 0; j < n_perms; j++){

    dict = init_dictionary(N, order);
    if (!dict){
      return ERR;
    }
  /*Optimización*/

    if (order == NOT_SORTED)
      perm = generate_perm(N);
    else
      perm = generate_sorted_perm(N);

    if (!perm){
      free_dictionary(dict);
      return ERR;
    }

    
      
    if (massive_insertion_dictionary(dict, perm, N) == ERR){
      free(perm);
      free_dictionary(dict);
      return ERR;
    }
    
    keys = malloc(n_times * N * sizeof(int));
    if (!keys){
      printf("ERROR: memory");
      free(perm);
      free_dictionary(dict);
      return ERR;
    }
    
    generator(keys, n_times * N, N);

    /* Definimos valores por defecto para OB mínimas y máximas (son límites) */
    min_ob = INT_MAX;
    max_ob = 0;

    /* Comienza el test de rendimiento */
    comienzo = clock();

    for (i = 0; i < n_times * N; i++) {
      /* Busca la clave i-ésima */
      ob = search_dictionary(dict, keys[i], &pos, metodo);
      if (ob == ERR) {
        free(keys);
        free(perm);
        free_dictionary(dict);
        return ERR;
      }
      
      /* Vamos contando el número total de OB en todas las búsquedas para calcular después el promedio */
      total_ob += ob;

      /* Actualizamos los valores de OB máxima y mínima (en la primera iteración toman valores con sentido) */
      if (max_ob < ob)
        max_ob = ob;
      
      if (min_ob > ob)
        min_ob = ob;
    }

    /* Termina el test de rendimiento */
    final = clock();

    tiempo += (final - comienzo);

    free(keys);
    free(perm);
    free_dictionary(dict);
  }
  
  

  /* Almacenamos los datos necesarios en la estructura ptime */
  ptime->n_elems = n_times * N * n_perms;
  ptime->N = N;
  ptime->time = tiempo / (double)(n_times * N * n_perms);
  ptime->average_ob = (double)total_ob / (double)(n_times * N * n_perms);
  ptime->min_ob = min_ob;
  ptime->max_ob = max_ob;
  
  return OK;
}

short save_time_table(char *file, PTIME_AA ptime, int n_times){
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
  for (i = 0; i < n_times; i++)
    fprintf(pf, "%d %f %f %d %d\n", ptime[i].N, ptime[i].time, ptime[i].average_ob, ptime[i].max_ob, ptime[i].min_ob);
  
  fclose(pf);
  return OK;
}
