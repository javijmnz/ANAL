#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "../permutations.h"

int main(int argc, char** argv){

    int inter, numInter, avg, *array;
    FILE *pf = NULL;
    int i, j, k;

    srand(time(NULL));

    if (argc != 7) {
    fprintf(stderr, "Input parameter error:\n\n");
    fprintf(stderr, "%s -inter <int> -numInter <int> -avg <int> \n", argv[0]);
    fprintf(stderr, "Where:\n");
    fprintf(stderr, " -inter : intervals.\n");
    fprintf(stderr, " -numInter : intervals.\n");
    fprintf(stderr, " -avg : ammout of mumbers to generate per number.\n");
    exit(-1);
    }

    /* check command line */
  for(i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-inter") == 0) {
      inter = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-numInter") == 0) {
      numInter = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-avg") == 0) {
      avg = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong Parameter %s \n", argv[i]);
    }
  }

    array = calloc(numInter, sizeof(int));
    if(!array){
        printf("No space");
        return 1;
    }

    pf = fopen("stat1_mal.txt", "w");
    if (!pf) {
        free(array);
        return ERR;
    }
    
    for (j = 0; j < inter; j++){
        for(k = 0; k < numInter; k++){
            for(i = 0; i < avg; i++){
                array[random_num_mal(0, numInter * inter) / inter]++;
            }
        }
    }
    

    for(i = 0; i < numInter; i++){
        fprintf(pf, "%d %d\n", i*inter, array[i]);
    }

    free(array);
    fclose(pf);

    return 0;
}
