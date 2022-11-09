/**************************************************/
/* Programa: ejercise4       Date:                */
/* Authors:                                       */
/*                                                */
/* Program that checks InsertSort                 */
/*                                                */
/* Input: Command Line                            */
/* -size: number of elements of each permutation  */
/* Output: 0: OK, -1: ERR                         */
/**************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "permutations.h"
#include "sorting.h"

int main(int argc, char** argv)
{
  int tamano, i, j, ret, numfunc;
  int* perm = NULL;
  pfunc_sort func[6] = {SelectSort, SelectSortInv, MergeSort, QuickSort_v1, QuickSort_v2, QuickSort_v3};

  srand(time(NULL));

  if (argc != 5) {
	fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s -size <int> -func <pfunc_sort>\n", argv[0]);
    fprintf(stderr, "Where:\n");
    fprintf(stderr, " -size : number of elements in the permutation.\n");
    fprintf(stderr, " -func : sorting method:\n");
    fprintf(stderr, " \t (0) SelectSort\n");
    fprintf(stderr, " \t (1) SelectSortInv\n");
    fprintf(stderr, " \t (2) MergeSort\n");
    fprintf(stderr, " \t (3) QuickSort_v1\n");
    fprintf(stderr, " \t (4) QuickSort_v2\n");
    fprintf(stderr, " \t (5) QuickSort_v3\n");
    return 0;
  }
  printf("Practice number 2, section 4\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");

  /* check command line */
  for(i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-size") == 0) {
      tamano = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-func") == 0) {
      numfunc = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong paramenter %s\n", argv[i]);
    }
  }

  if (numfunc < 0 || numfunc > 5) {
    fprintf(stderr, "ERROR: Selecciona un método de ordenación válido: \n");
    fprintf(stderr, " \t (0) SelectSort\n");
    fprintf(stderr, " \t (1) SelectSortInv\n");
    fprintf(stderr, " \t (2) MergeSort\n");
    fprintf(stderr, " \t (3) QuickSort_v1\n");
    fprintf(stderr, " \t (4) QuickSort_v2\n");
    fprintf(stderr, " \t (5) QuickSort_v3\n");
    exit(-1);
  }

  perm = generate_perm(tamano);

  if (perm == NULL) { /* error */
    printf("Error: Out of memory\n");
    exit(-1);
  }

  ret = func[numfunc](perm, 0, tamano-1);

  if (ret == ERR) {
    printf("Error: Error in sorting function\n");
    free(perm);
    exit(-1);
  }

  for(j = 0; j < tamano; j++) {
    printf("%d \t", perm[j]);
  }
  printf("\n");

  free(perm);

  return 0;
}

