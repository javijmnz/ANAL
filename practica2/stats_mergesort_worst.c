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
  int i, pot_min, pot_max;
  short ret;
  char nombreFichero[BufLength] = "\0";

  srand(time(NULL));

  if (argc != 5) {
    fprintf(stderr, "Error in input parameters:\n\n");
    fprintf(stderr, "%s -pot_min <int> -pot_max <int>\n", argv[0]);
    fprintf(stderr, "Donde:\n");
    fprintf(stderr, "-pot_min: lowest power of 2 size of table\n");
    fprintf(stderr, "-pot_max: highest power of 2 size of table\n");
    exit(-1);
  }

  printf("Practice number 2, MergeSort Worst Case\n");
  printf("Done by: Javier Jiménez, Pablo Fernández\n");
  printf("Group: 1202\n");
  
  /* check command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-pot_min") == 0) {
      pot_min = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-pot_max") == 0) {
      pot_max = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong paramenter %s\n", argv[i]);
    }
  }

  sprintf(nombreFichero, "stats/worst_data/MergeSort_pot%d-pot%d_worst.log", pot_min, pot_max);

  /* compute times */
  
  ret = generate_sorting_times_mergesort_worst(nombreFichero, pot_min, pot_max);
  
  if (ret == ERR) { /* ERR_TIME should be a negative number */
    printf("Error in function generate_sorting_times\n");
    exit(-1);
  }
  printf("Correct output \n");

  return 0;
}