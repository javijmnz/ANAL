#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "../permutations.h"

int main(int argc, char** argv)
{
  int i;
  unsigned int inf, sup, num, j;
  FILE *pf = NULL;
  int *count = NULL;

  srand(time(NULL));

  if (argc != 7) {
    fprintf(stderr, "Input parameter error:\n\n");
    fprintf(stderr, "%s -limInf <int> -limSup <int> -numN <int>\n", argv[0]);
    fprintf(stderr, "Where:\n");
    fprintf(stderr, " -limInf : Lower limit.\n");
    fprintf(stderr, " -limSup : Upper limit.\n");
    fprintf(stderr, " -numN : ammout of mumbers to generate.\n");
    exit(-1);
  }

  /* check command line */
  for(i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-limInf") == 0) {
      inf = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-limSup") == 0) {
      sup = atoi(argv[++i]);
    } else if (strcmp(argv[i], "-numN") == 0) {
      num = atoi(argv[++i]);
    } else {
      fprintf(stderr, "Wrong Parameter %s \n", argv[i]);
    }
  }

  count = (int *) calloc(sup - inf + 1, sizeof(int));
  if (!count)
    return ERR;
  pf = fopen("stats/stats1_bien.txt", "w");
  if (!pf) {
    free(count);
    return ERR;
  }

  /* print data */
  for(j = 0; j < num; j++) {
    i = random_num(inf, sup);
    count[i - inf]++;
  }

  for (j = inf; j <= sup; j++) {
    if (fprintf(pf, "%d     %d\n", j, count[j - inf]) < 0) {
        fclose(pf);
        free(count);
        return ERR;
    }
  }

  fclose(pf);
  pf = NULL;
  for (j = 0; j < sup - inf + 1; j++)
    count[j] = 0;

  pf = fopen("stats/stats1_mal.txt", "w");
  if (!pf) {
    free(count);
    return ERR;
  }

  /* print data */
  for(j = 0; j < num; j++) {
    i = random_num_mal(inf, sup);
    count[i - inf]++;
  }

  for (j = inf; j <= sup; j++) {
    if (fprintf(pf, "%d     %d\n", j, count[j - inf]) < 0) {
        fclose(pf);
        free(count);
        return ERR;
    }
  }

  fclose(pf);

  free(count);

  return 0;
}
