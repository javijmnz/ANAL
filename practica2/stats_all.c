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
  int i, num_min, num_max, incr, n_perms;
  short ret;
  pfunc_sort func[4] = {MergeSort, QuickSort_v1, QuickSort_v2, QuickSort_v3};
  char *nombresAlgoritmos[4] = {"MergeSort", "QuickSort_v1", "QuickSort_v2", "QuickSort_v3"};
  char **nombresFicheros;
  char *array;

  nombresFicheros = (char **) malloc(4 * sizeof(char *));
  if (!nombresFicheros)
    exit(-1);

  array = (char *) malloc(4 * BufLength * sizeof(char));
  if (!array){
    free(nombresFicheros);
    exit(-1);
  }
  
  for (i = 0; i < 4; i++)
    nombresFicheros[i] = array + i * BufLength;

  srand(time(NULL));

  if (argc != 9) {
    fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s-num_min <int> -num_max <int>\n", argv[0]);
    fprintf(stderr, "\t\t -incr <int> -numP <int>\n");
    fprintf(stderr, "Donde:\n");
    fprintf(stderr, "-num_min: lowest number of table elements\n");
    fprintf(stderr, "-num_max: highest number of table elements\n");
    fprintf(stderr, "-incr: increment\n");
    fprintf(stderr, "-numP: number of permutations to average\n");
    exit(-1);
  }

  printf("Practice number 2, Time Test\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");
  
  /* check command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-num_min") == 0) {
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
  
  for (i = 0; i < 4; i++)
    sprintf(nombresFicheros[i], "stats/data/%s_%d-%d_incr%d_per%d.log", nombresAlgoritmos[i], num_min, num_max, incr, n_perms);

  /* compute times */
  ret = generate_sorting_times_n(func, nombresFicheros, 4, num_min, num_max,incr, n_perms);
  if (ret == ERR) { /* ERR_TIME should be a negative number */
    printf("Error in function generate_sorting_times\n");
    exit(-1);
  }
  printf("Correct output \n");
  free(array);
  free(nombresFicheros);

  return 0;
}

