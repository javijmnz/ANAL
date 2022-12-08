/***********************************************************/
/* Program: exercise2 Date:                             */
/* Authors:                                                */
/*                                                         */
/* Program that writes in a file the average times         */
/* of the search algorithm                                 */
/*                                                         */
/* Input: Command line                                     */
/* -num_min: minimum number of elements in the table       */
/* -num_max: maximum number of elements in the table       */
/* -incr: increment                                       */
/* -fkeys: number of keys to search                        */
/* -numP: Introduce the number of permutations to average  */
/* -outputFile: Name of the output file                    */
/*                                                         */
/* Output: 0 if there was an error                         */
/*        -1 otherwise                                     */
/***********************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "permutations.h"
#include "search.h"
#include "times.h"

int main(int argc, char** argv)
{
  int i, num_min,num_max,incr,n_times, search, key_gen;
  char name[256];
  short ret;
  pfunc_search search_functions[5] = {bin_search, lin_search, lin_auto_search, lin_search};
  pfunc_key_generator key_gen_functions[2] = {uniform_key_generator, potential_key_generator};
  int sorted_array[5] = {SORTED, NOT_SORTED, NOT_SORTED, SORTED};
  char *search_names[5] = {"bin_search", "lin_search", "lin_search_sorted", "lin_auto_search", "bad_lin_search_sorted"};
  char *key_gen_names[2] = {"unif", "pot"};
 
  srand(time(NULL));

  if (argc != 13) {
    fprintf(stderr, "Error in the input parameters:\n\n");
    fprintf(stderr, "%s -num_min <int> -num_max <int> -incr <int>\n", argv[0]);
    fprintf(stderr, "\t\t-n_times <int> -search <int> -key_gen <int> \n");
    fprintf(stderr, "Where:\n");
    fprintf(stderr, "-num_min: minimum number of elements of the table\n");
    fprintf(stderr, "-num_max: maximum number of elements of the table\n");
    fprintf(stderr, "-incr: increment\n");
    fprintf(stderr, "-n_times: number of times each key is searched\n");
    fprintf(stderr, "-search: 1: bin_search 2: lin_search 3: lin_auto_search 4: lin_search sorted\n");
    fprintf(stderr, "-key_gen: 1: uniform 2: potential\n");
    exit(-1);
  }

  printf("Practice number 3, section 2\n");
  printf("Done by: Your names\n");
  printf("Group: Your group\n");

  /* check the command line */
  for(i = 1; i < argc ; i++) {
    if (strcmp(argv[i], "-num_min") == 0) {
      num_min = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-num_max") == 0) {
      num_max = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-incr") == 0) {
      incr = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-n_times") == 0) {
      n_times = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-search") == 0) {
      search = atoi(argv[++i]);
    }else if (strcmp(argv[i], "-key_gen") == 0) {
      key_gen = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Parameter %s is invalid\n", argv[i]);
      exit(-1);
    }
  }

  if(search < 1 || search > 4 || key_gen < 1 || key_gen > 5 || num_min > num_max || incr < 1 || n_times < 1){
    fprintf(stderr, "Wrong arguments\n");
  }


  sprintf(name,"stats/%s_key_gen_%s_%d-%d_incr%d_n_times%d.log",search_names[search - 1], key_gen_names[key_gen - 1], num_min, num_max, incr, n_times);

  /* calculamos los tiempos */
  ret = generate_search_times(search_functions[search - 1], key_gen_functions[key_gen - 1], sorted_array[search - 1], 
                                name, num_min, num_max, incr, n_times);
  if (ret == ERR) { 
    printf("Error in function generate_search_times\n");
    exit(-1);
  }

  printf("Correct output \n");

  return 0;
}

