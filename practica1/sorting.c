/**
 *
 * Descripcion: Implementation of sorting functions
 *
 * Fichero: sorting.c
 * Autor: Carlos Aguirre
 * Version: 1.0
 * Fecha: 16-09-2019
 *
 */


#include "sorting.h"

void swap(int *e1, int *e2) {
  int aux;

  /* Comprueba parámetros */
  if (!e1 || !e2)
    return;
  
  aux = *e1;
  *e1 = *e2;
  *e2 = aux;
}


/***************************************************/
/* Function: SelectSort    Date:                   */
/* Your comment                                    */
/***************************************************/
int SelectSort(int* array, int ip, int iu)
{
  int i, minimo, sum = 0;

  /* Comprueba parámetros */
  if (!array || ip < 0)
    return ERR;
  
  /* Algoritmo */
  for (i = ip; i <= iu; i++){
    minimo = min(array, i, iu);
    sum += iu - i + 1;
    swap(array + i, array + minimo);   
  }
  return sum;
}

/* PRUEBA */
int SelectSortInv(int* array, int ip, int iu)
{
  int i, minimo, sum = 0;

  /* Comprueba parámetros */
  if (!array || ip < 0)
    return ERR;
  
  /* Algoritmo */
  for (i = iu; i <= ip; i--){
    minimo = min(array, i, ip);
    sum += i - ip + 1;
    swap(array + i, array + minimo);   
  }
  return sum;
}

int min(int* array, int ip, int iu)
{
  int j, minimo;

  /* Comprueba parámetros */
  if (!array || ip < 0)
    return ERR;

  /* Busca el mínimo */
  minimo = ip;
  
  for (j = ip; j <= iu; j++)
      if (array[j] < array[minimo])
        minimo = j;
  
  return minimo;
}

