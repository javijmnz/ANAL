/***********************************************************/
/* Program: stats_single               Date:               */
/* Authors:                                                */
/*                                                         */
/* Programa that writes in a file                          */
/* the average times of the selected sorting algorithm     */
/*                                                         */
/* Input: Command Line                                     */
/* -func: index of sorting function                        */
/* -num_min: lowest number of table elements               */
/* -num_max: highest number of table elements              */
/* -incr: increment\n                                      */
/* -numP: number of permutations to average                */
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
  int i, num_min, num_max, incr, numfunc, worst_version;
  short ret;
  pfunc_sort func_sort[4] = {MergeSort, QuickSort_v1, QuickSort_v2, QuickSort_v3};
  pfunc_perm func_perm[3] = {generate_quicksort_worst_perm_v1, generate_quicksort_worst_perm_v2, generate_quicksort_worst_perm_v3};
  char *nombresAlgoritmos[4] = {"MergeSort", "QuickSort_v1", "QuickSort_v2", "QuickSort_v3"};
  char nombreFichero[BufLength] = "\0";

  srand(time(NULL));

  if (argc != 11) {
    fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s -func  <pfunc_sort> -worst_version <pfunc_perm> -num_min <int> -num_max <int>\n", argv[0]);
    fprintf(stderr, "\t\t -incr <int> -numP <int>\n");
    fprintf(stderr, "Donde:\n");
    fprintf(stderr, "-func : sorting method:\n");
    fprintf(stderr, " \t (0) Mergesort\n");
    fprintf(stderr, " \t (1) QuickSort_v1\n");
    fprintf(stderr, " \t (2) QuickSort_v2\n");
    fprintf(stderr, " \t (3) QuickSort_v3\n");
    fprintf(stderr, "-worst_version : 'worst case permutation' version:\n");
    fprintf(stderr, " \t (1) For QuickSort_v1\n");
    fprintf(stderr, " \t (2) For QuickSort_v2\n");
    fprintf(stderr, " \t (3) For QuickSort_v3\n");
    fprintf(stderr, "-num_min: lowest number of table elements\n");
    fprintf(stderr, "-num_max: highest number of table elements\n");
    fprintf(stderr, "-incr: increment\n");
    exit(-1);
  }

  printf("Practice number 2, QuickSort Worst (or not so worst) Case\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");
  
  /* check command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-func") == 0) {
      numfunc = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-worst_version") == 0) {
      worst_version = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-num_min") == 0) {
      num_min = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-num_max") == 0) {
      num_max = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-incr") == 0) {
      incr = atoi(argv[++i]);
    }  else {
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

  if (worst_version < 1 || worst_version > 3) {
    fprintf(stderr, "ERROR: Selecciona un caso peor válido:\n");
    fprintf(stderr, " \t (1) For QuickSort_v1\n");
    fprintf(stderr, " \t (2) For QuickSort_v2\n");
    fprintf(stderr, " \t (3) For QuickSort_v3\n");
    exit(-1);
  }

  sprintf(nombreFichero, "stats/worst_data/%s_%d-%d_incr%d_with_worst_QuickSort_v%d.log", nombresAlgoritmos[numfunc], num_min, num_max, incr, worst_version);

  /* compute times */
  ret = generate_sorting_times_quicksort_worst_perm(func_sort[numfunc], func_perm[worst_version - 1], nombreFichero, num_min, num_max, incr);
  if (ret == ERR) { /* ERR_TIME should be a negative number */
    printf("Error in function generate_sorting_times\n");
    exit(-1);
  }
  printf("Correct output \n");

  return 0;
}
