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
#include <stdlib.h>

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

/***************************************************/
/* Function: MergeSort    Date:                */
/***************************************************/
int MergeSort(int* tabla, int ip, int iu) {
  
  int medio, ob1, ob2, ob3;
  /* Comprueba parámetros */
  if (!tabla || ip > iu) {
    return ERR;
  }
  /* Caso base */
  if (ip == iu)
    return OK;
  
  /* Recursión */
  medio = (ip + iu) / 2;
  ob1 = MergeSort(tabla, ip, medio);
  if (ob1 == ERR)
    return ERR;
  
  ob2 = MergeSort(tabla, medio + 1, iu);
  if (ob2 == ERR)
    return ERR;
  
  ob3 = merge(tabla, ip, iu, medio);
  if (ob3 == ERR)
    return ERR;
  
  return ob1 + ob2 + ob3;
}


int merge(int* tabla, int ip, int iu, int imedio) {
  int *aux, i, j, k, ob = 0;
  
  
  aux = (int *) malloc((iu - ip + 1) * sizeof(int));
  if (!aux)
    return ERR;
  
  for (i = ip, j = imedio + 1, k = 0; i <= imedio && j <= iu; k++) {
    if (tabla[i] < tabla[j]){
      aux[k] = tabla[i];
      i++;
    } else {
      aux[k] = tabla[j];
      j++;
    }
    ob++;
  }

  if (i > imedio)
    for (; j <= iu; j++, k++)
      aux[k] = tabla[j];
  else if (j > iu)
    for (; i <= imedio; i++, k++)
      aux[k] = tabla[i];

  for (i = ip, j = 0; i <= iu; i++, j++)
    tabla[i] = aux[j];

  free(aux);
  return ob;
}
/***************************************************/
/* Function: QuickSort    Date:                */
/***************************************************/

int QuickSort(int* tabla, int ip, int iu){
  int medio, ob = 0;
  /* Comprueba parámetros */
  if (!tabla || ip > iu) {
    return ERR;
  }
  /* Caso base */
  if (ip == iu)
    return OK;
  
  ob += partition(tabla, ip, iu, &medio);
  if (ip < medio - 1)
    ob += QuickSort(tabla, ip, medio - 1);
  
  if (medio + 1 < iu) 
    ob += QuickSort(tabla, medio + 1, iu);
  
  return ob;
}

int partition(int* tabla, int ip, int iu, int *pos) {
  int medio, i, k, ob = 0;

  /* Comprueba parámetros */
  if (!tabla || ip < iu || !pos)
    return ERR;

  medio = median(tabla, ip, iu, pos);
  k = tabla[medio];
  swap(tabla + ip, tabla + medio);
  medio = ip;
  for (i = ip + 1; i <= iu; i++) {
    if (tabla[i] < k) {
      medio++;
      swap(tabla + i, tabla + medio);
    }
    ob++;
  }
  swap(tabla + ip, tabla + medio);
  return ob;
}

int median(int *tabla, int ip, int iu, int *pos) {
  /* Comprueba parámetros */
  if (!tabla || ip > iu || !pos)
    return ERR;

  *pos = 0;
  return OK;
}
