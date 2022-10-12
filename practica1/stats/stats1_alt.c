#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "../permutations.h"

int main(int argc, char** argv){

    int inter, numInter, num, *array;
    FILE *pf = NULL;
    long long i, j, k, cont;

    srand(time(NULL));

    if (argc != 7) {
    fprintf(stderr, "Input parameter error:\n\n");
    fprintf(stderr, "%s -inter <int> -numInter <int> -numN <int> \n", argv[0]);
    fprintf(stderr, "Where:\n");
    fprintf(stderr, " -inter : intervals.\n");
    fprintf(stderr, " -numInter : intervals.\n");
    fprintf(stderr, " -numN : ammout of mumbers to generate.\n");
    exit(-1);
    }

    /* check command line */
  for(i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-inter") == 0) {
      inter = atoi(argv[++i]);
      printf("%d",inter);
    } else if (strcmp(argv[i], "-numInter") == 0) {
      numInter = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-numN") == 0) {
      num = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong Parameter %s \n", argv[i]);
    }
  }
    printf("Rand max: %d", RAND_MAX);

    array = calloc(numInter, sizeof(int));
    if(!array){
        printf("No space");
        return 1;
    }

    pf = fopen("stats_alt.txt", "w");
    if (!pf) {
        free(array);
        return ERR;
    }
    
    cont = inter * numInter * 1000;
    for (j = 0; j < inter; j++){
        for(k = 0; k < numInter; k++){
            for(i = 0; i < 100; i++){
                array[random_num_mal(0, numInter * inter, RAND_MAX) / inter]++;
            }
        }
    }
    

    for(i = 0; i < numInter; i++){
        fprintf(pf, "%lld %d\n", i*inter, array[i]);
    }

    free(array);
    fclose(pf);

    return 0;
}