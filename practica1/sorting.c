/**
 *
 * Descripcion: Implementation of sorting functions
 *
 * Fichero: sorting.c
 * Autores: Javier Jiménez, Pablo Fernández
 * Version: 1.0
 *
 */


#include "sorting.h"

void swap(int *e1, int *e2) {
  int aux;

  /* Comprueba parámetros */
  if (!e1 || !e2 || *e1 == *e2)
    return;
  
  aux = *e1;
  *e1 = *e2;
  *e2 = aux;
}


/***************************************************/
/* Function: SelectSort    Date:                   */
/* Ordena una permutación de enteros en orden      */
/* ascendente                                      */
/* Input:                                          */
/*  int* array: puntero a la permutación           */
/*  int ip: índice inferior de la sección a ordenar*/
/*  int iu: índice superior de la sección a ordenar*/
/* Output:                                         */ 
/*  int: el número de OB realizadas si todo ha ido */
/*    bien o ERR (-1) en caso contrario            */                     
/***************************************************/
int SelectSort(int* array, int ip, int iu)
{
  int i, minimo, sum = 0;

  /* Comprueba parámetros */
  if (!array || ip < 0)
    return ERR;
  
  /* Algoritmo */
  for (i = ip; i < iu; i++){
    minimo = min(array, i, iu);
    sum += iu - i;
    swap(array + i, array + minimo);   
  }
  
  return sum;
}

/***************************************************/
/* Function: SelectSortInv    Date:                */
/* Ordena permutaciones de enteros en orden        */
/* descendente                                     */
/* Input:                                          */
/*  int* array: puntero a la permutación           */
/*  int ip: índice inferior de la sección a ordenar*/
/*  int iu: índice superior de la sección a ordenar*/
/* Output:                                         */
/*  int: el número de OB realizadas si todo ha ido */
/*    bien o ERR (-1) en caso contrario            */
/***************************************************/
int SelectSortInv(int* array, int ip, int iu)
{
  int i, minimo, sum = 0;

  /* Comprueba parámetros */
  if (!array || ip < 0)
    return ERR;
  
  /* Algoritmo */
  for (i = iu; i > ip; i--){
    minimo = min(array, ip, i);
    sum += i - ip;
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
  
  for (j = ip + 1; j <= iu; j++)
      if (array[j] < array[minimo])
        minimo = j;
  
  return minimo;
}

