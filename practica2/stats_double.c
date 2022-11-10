/***********************************************************/
/* Program: stats_double               Date:               */
/* Authors:                                                */
/*                                                         */
/* Programa that writes in a file                          */
/* the average times of the two selected sorting           */
/* algorithms on the same permutations                     */
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
  int i, num_min, num_max, incr, n_perms, numfunc1, numfunc2;
  short ret;
  pfunc_sort func[6] = {SelectSort, SelectSortInv, MergeSort, QuickSort_v1, QuickSort_v2, QuickSort_v3};
  char *nombresAlgoritmos[6] = {"SelectSort", "SelectSortInv", "MergeSort", "QuickSort_v1", "QuickSort_v2", "QuickSort_v3"};
  char nombreFichero1[BufLength] = "\0", nombreFichero2[BufLength] = "\0";

  srand(time(NULL));

  if (argc != 13) {
    fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s -func1  <pfunc_sort> -func2  <pfunc_sort> -num_min <int> -num_max <int>\n", argv[0]);
    fprintf(stderr, "\t\t -incr <int> -numP <int> -outputFile <string> \n");
    fprintf(stderr, "Donde:\n");
    fprintf(stderr, " -func1 : sorting method:\n");
    fprintf(stderr, " -func2 : sorting method:\n");
    fprintf(stderr, " \t (0) SelectSort\n");
    fprintf(stderr, " \t (1) SelectSortInv\n");
    fprintf(stderr, " \t (2) MergeSort\n");
    fprintf(stderr, " \t (3) QuickSort_v1\n");
    fprintf(stderr, " \t (4) QuickSort_v2\n");
    fprintf(stderr, " \t (5) QuickSort_v3\n");
    fprintf(stderr, "-num_min: lowest number of table elements\n");
    fprintf(stderr, "-num_max: highest number of table elements\n");
    fprintf(stderr, "-incr: increment\n");
    fprintf(stderr, "-numP: number of permutations to average\n");
    exit(-1);
  }

  printf("Practice number 2, Sorting test\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");
  
  /* check command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-func1") == 0) {
      numfunc1 = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-func2") == 0) {
      numfunc2 = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-num_min") == 0) {
      num_min = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-num_max") == 0) {
      num_max = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-incr") == 0) {
      incr = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-numP") == 0) {
      n_perms = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong paramenter %s\n", argv[i]);
    }
  }

  if (numfunc1 < 0 || numfunc1 > 5 || numfunc2 < 0 || numfunc2 > 5) {
    fprintf(stderr, "ERROR: Selecciona métodos de ordenación válidos:\n");
    fprintf(stderr, " \t (0) SelectSort\n");
    fprintf(stderr, " \t (1) SelectSortInv\n");
    fprintf(stderr, " \t (2) MergeSort\n");
    fprintf(stderr, " \t (3) QuickSort_v1\n");
    fprintf(stderr, " \t (4) QuickSort_v2\n");
    fprintf(stderr, " \t (5) QuickSort_v3\n");
    exit(-1);
  }

  sprintf(nombreFichero1, "stats/double/%s_vs_%s_%d-%d_incr%d_per%d_%s.log", nombresAlgoritmos[numfunc1], nombresAlgoritmos[numfunc2], num_min, num_max, incr, n_perms, nombresAlgoritmos[numfunc1]);
  sprintf(nombreFichero2, "stats/%s_vs%s_%d-%d_incr%d_per%d_%s.log", nombresAlgoritmos[numfunc1], nombresAlgoritmos[numfunc2], num_min, num_max, incr, n_perms, nombresAlgoritmos[numfunc2]);

  /* compute times */
  ret = generate_sorting_times_2func(func[numfunc1], func[numfunc2], nombreFichero1, nombreFichero2, num_min, num_max,incr, n_perms);
  if (ret == ERR) { /* ERR_TIME should be a negative number */
    printf("Error in function generate_sorting_times\n");
    exit(-1);
  }
  printf("Correct output \n");

  return 0;
}

