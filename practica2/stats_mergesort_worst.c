/***********************************************************/
/* Program: stats_mergesort_worst      Date:               */
/* Authors:                                                */
/*                                                         */
/* Programa that writes in a file                          */
/* the worst times of MergeSort                            */
/*                                                         */
/* Input: Command Line                                     */
/* -func: index of sorting function                        */
/* -pot_min: lowest power of 2 size of table               */
/* -pot_max: highest power of 2 size of table              */
/* Output: 0 in case of error                              */
/* -1 otherwise                                            */
/***********************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sorting.h"
#include "times.h"

#define BufLength 512

int main(int argc, char** argv)
{
  int i, numfunc, pot_min, pot_max;
  short ret;
  char nombreFichero[BufLength] ="\0";
  pfunc_sort func_sort[4] = {MergeSort, QuickSort_v1, QuickSort_v2, QuickSort_v3};
  char *nombresAlgoritmos[4] = {"MergeSort", "QuickSort_v1", "QuickSort_v2", "QuickSort_v3"};

  srand(time(NULL));

  if (argc != 7) {
    fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s -func <pfunc_sort> -pot_min <int> -pot_max <int>\n", argv[0]);
    fprintf(stderr, "Donde:\n");
    fprintf(stderr, "-func : sorting method:\n");
    fprintf(stderr, " \t (0) Mergesort\n");
    fprintf(stderr, " \t (1) QuickSort_v1\n");
    fprintf(stderr, " \t (2) QuickSort_v2\n");
    fprintf(stderr, " \t (3) QuickSort_v3\n");
    fprintf(stderr, "-pot_min: lowest power of 2 size of table\n");
    fprintf(stderr, "-pot_max: highest power of 2 size of table\n");
    exit(-1);
  }

  printf("Practice number 2, MergeSort Worst Case perm\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");
  
  /* check command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-func") == 0) {
      numfunc = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-pot_min") == 0) {
      pot_min = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-pot_max") == 0) {
      pot_max = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong paramenter %s\n", argv[i]);
    }
  }

  if (numfunc < 0 || numfunc > 4) {
    fprintf(stderr, "ERROR: Selecciona un método de ordenación válido:\n");
    fprintf(stderr, " \t (0) Mergesort\n");   
    fprintf(stderr, " \t (1) QuickSort_v1\n");
    fprintf(stderr, " \t (2) QuickSort_v2\n");
    fprintf(stderr, " \t (3) QuickSort_v3\n");
    exit(-1);
  }

  sprintf(nombreFichero, "stats/worst_data/%s_pot%d-pot%d_with_worst_MergeSort.log",nombresAlgoritmos[numfunc], pot_min, pot_max);

  /* compute times */
  
  ret = generate_sorting_times_mergesort_worst_perm(func_sort[numfunc], nombreFichero, pot_min, pot_max);
  
  if (ret == ERR) { /* ERR_TIME should be a negative number */
    printf("Error in function generate_sorting_times\n");
    exit(-1);
  }
  printf("Correct output \n");

  return 0;
}
