/**
 *
 * Description: Implementation of functions for search
 *
 * File: search.c
 * Author: Carlos Aguirre and Javier Sanz-Cruzado
 * Version: 1.0
 * Date: 14-11-2016
 *
 */

#include "search.h"

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int _print_int(FILE *pf, const void *c){
    return fprintf(pf,"%d ",*((int*)c));
}

int _cmp_int(const void * c1, const void * c2){
    return *(((int*)c1) - *((int*)c2));
}

void _swap(int *a1, int *a2) {
  int aux;

  aux = *a1;
  *a1 = *a2;
  *a2 = aux;
}

/**
 *  Key generation functions
 *
 *  Description: Receives the number of keys to generate in the n_keys
 *               parameter. The generated keys go from 1 to max. The
 * 				 keys are returned in the keys parameter which must be 
 *				 allocated externally to the function.
 */
  
/**
 *  Function: uniform_key_generator
 *               This function generates all keys from 1 to max in a sequential
 *               manner. If n_keys == max, each key will just be generated once.
 */
void uniform_key_generator(int *keys, int n_keys, int max)
{
  int i;

  for(i = 0; i < n_keys; i++) keys[i] = 1 + (i % max);

  return;
}

/**
 *  Function: potential_key_generator
 *               This function generates keys following an approximately
 *               potential distribution. The smaller values are much more 
 *               likely than the bigger ones. Value 1 has a 50%
 *               probability, value 2 a 17%, value 3 the 9%, etc.
 */
void potential_key_generator(int *keys, int n_keys, int max)
{
  int i;

  for(i = 0; i < n_keys; i++) 
  {
    keys[i] = .5+max/(1 + max*((double)rand()/(RAND_MAX)));
  }

  return;
}

PDICT init_dictionary (int size, char order)
{
	PDICT pdict;

  if (size < 1 || order < NOT_SORTED || order > SORTED)
    return NULL;

  pdict = malloc(sizeof(DICT));
  if (!pdict)
    return NULL;
  
  pdict->size = size;
  pdict->order = order;
  pdict->n_data = 0;

  pdict->table = malloc(sizeof(int) * size);
  if (!pdict->table){
    free(pdict);
    return NULL;
  }
  return pdict;
}

void free_dictionary(PDICT pdict)
{
	free(pdict->table);
  free(pdict);
}

int insert_dictionary(PDICT pdict, int key)
{
  int A, j, ob = 0;
  if (!pdict)
    return ERR;
  
  if (pdict->size == pdict->n_data)
    return ERR;
  
  pdict->table[pdict->n_data] = key;
  pdict->n_data++;

  if (pdict->order == NOT_SORTED)
    return ob;
  
  
  A = pdict->table[pdict->n_data - 1];
  j = pdict->n_data - 2;
  while (j >= 0 && pdict->table[j] > A) {
    pdict->table[j+1] = pdict->table[j];
    j--;
    ob ++;
  }  
  pdict->table[j+1] = A;

  return ob;
}

int massive_insertion_dictionary (PDICT pdict,int *keys, int n_keys)
{
  int i, ob = 0, ret;
  if (!pdict || !keys || n_keys < 0)
    return ERR;
  
  for (i = 0; i < n_keys; i++){
    ret = insert_dictionary (pdict, keys[i]);
    if (ret == ERR)
      return ERR;
    ob += ret;
  }

  return ob; 
	
}

int search_dictionary(PDICT pdict, int key, int *ppos, pfunc_search method)
{
	if (!pdict || !ppos || !method){
    return ERR;
  }

  if (pdict->order == NOT_SORTED && (method == bin_search || method == lin_search_sorted))
    return ERR;
  
  return method(pdict->table, 0, pdict->n_data - 1, key, ppos);  
}


/* Search functions of the Dictionary ADT */
int bin_search(int *table,int F,int L,int key, int *ppos){
	int med = (L + F)/2, ob = 0;
  
  if (!table || F < 0 || L < F || !ppos)
    return ERR;
    
  while (F <= L) {
    if (key == table[med]) {
      *ppos = med;
      return ob + 1;
    } else if (key < table[med])
      L = med - 1;
    else
      F = med + 1;
    med = (L + F)/2;
    ob++;
  }
  
  *ppos = NOT_FOUND;       
  return OK;
}

int lin_search(int *table,int F,int L,int key, int *ppos) {
  int i;
  
	if (!table || F < 0 || L < F || !ppos)
    return ERR;
    
  i = F;
  while (table[i] != key && i <= L)
    i++;

  if (i > L) {
    *ppos = NOT_FOUND;
    return i - F + 1;
  } else {
    *ppos = i;
    return i - F + 1; /* OBs */
  }
}

int lin_search_sorted(int *table,int F,int L,int key, int *ppos) {
	int i;
  
	if (!table || F < 0 || L < F || !ppos)
    return ERR;
    
  i = F;
  while (table[i] < key && i <= L)
    i++;

  if (i > L) {
    *ppos = NOT_FOUND;
    return i - F + 1;
  } else if (table[i] > key) {
    *ppos = NOT_FOUND;
    return i - F + 1;
  } else {
    *ppos = i;
    return i - F + 1; /* OBs Seguro que es un +1??? */
  }
}

int lin_auto_search(int *table,int F,int L,int key, int *ppos) {
	int i;
  
	if (!table || F < 0 || L < F || !ppos)
    return ERR;
    
  i = F;
  while (table[i] != key && i <= L)
    i++;

  if (i > L) {
    *ppos = NOT_FOUND;
    return ERR;
  } else {
    *ppos = i;
    if (i != F)
      _swap(table + i, table + i - 1);
    return i - F + 1; /* OBs */
  }
}
