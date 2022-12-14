/***********************************************/
/* Program: exercise1     Date:             */
/* Authors:                                    */
/*                                             */
/* Program that checks the correct behaviour of*/
/* linear search                               */
/*                                             */
/* Input: Command line                         */
/*   -size: number of elements in the dictionary */
/*   -key:  key to search                      */
/*                                             */
/* Output: 0: OK, -1: ERR                      */
/***********************************************/

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<time.h>

#include "permutations.h"
#include "search.h"

int main(int argc, char** argv)
{
  int i, nob, pos;
  unsigned int key, size, search;
  PDICT pdict;
  int *perm;
  pfunc_search search_functions[3] = {bin_search, lin_search, lin_auto_search};
  int sorted_array[3] = {SORTED, NOT_SORTED, NOT_SORTED};

  srand(time(NULL));

  if (argc != 7) {
    fprintf(stderr, "Error in the input parameters:\n\n");
    fprintf(stderr, "%s -size <int> -key <int>\n", argv[0]);
    fprintf(stderr, "where:\n");
    fprintf(stderr, " -size : number of elements in the table.\n");
    fprintf(stderr, " -key : key to search.\n");
    fprintf(stderr, " -search : 1 -> bin search 2 -> lin search 3 -> lin auto search.\n");

    exit(-1);
  }

  printf("Practice number 3, section 1\n");
  printf("Done by: Javier Jiménez y Pablo Fernández\n");
  printf("Group: 120\n");

  /* comprueba la linea de comandos */
  for(i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-size") == 0) {
      size = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-key") == 0) {
      key = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-search") == 0) {
      search = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Error: Parameter %s is invalid\n", argv[i]);
    }
  }

  if (search < 1 || search > 3 || size < 1){
    fprintf(stderr, "Error: Wrong input parameters\n");
  }

  pdict = init_dictionary(size, sorted_array[search - 1]);

  if (pdict == NULL) {
    /* error */
    fprintf(stderr, "Error: Dictionary could not be initialized\n");
    exit(-1);
  }

  perm = generate_perm(size);

  if (perm == NULL) {
    /* error */
    fprintf(stderr, "Error: No hay memoria\n");
    free_dictionary(pdict);
    exit(-1);
  }

  nob = massive_insertion_dictionary(pdict, perm, size);

  if (nob == ERR) {
    /* error */
    fprintf(stderr, "Error: Dictionary could not be created\n");
    free(perm);
    free_dictionary(pdict);
    exit(-1);
  }
  
  printf("Array to search: ");
  for (i = 0; i < size; i++)
    printf("%d ",pdict->table[i]);
  printf("\n");

  nob = search_dictionary(pdict, key, &pos, search_functions[search - 1]);

  if (nob >= 0) {
    printf("Key %d found in position %d in %d basic op.\n",key,pos,nob);
  } else if (pos == NOT_FOUND) { /* Aquí ponía nob == NOT_FOUND */
    printf("Key %d not found in table\n",key);
  } else {
    printf("Error when searching the key %d\n",key);
  }

  free(perm);
  free_dictionary(pdict);

  return 0;
}

