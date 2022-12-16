#include <stdio.h>
#include <stdlib.h>
#include "search.h"

#define NUMKEYS 2000000
#define MAX 1000000

int cmp_int(const void *e1, const void *e2) {
    return *((int *) e1) - *((int *) e2);
}

int main() {
    int claves[NUMKEYS], i;
    double *porcentajes;
    porcentajes = (double *) calloc(MAX, sizeof(double));
    if (!porcentajes)
        return EXIT_FAILURE;
    potential_key_generator(claves, NUMKEYS, MAX);
    for (i = 0; i < NUMKEYS; i++) {
        porcentajes[claves[i]-1]++;
    }
    printf("\n");
    for (i = 0; i < 100; i++)
        printf("%.3lf ", (double)porcentajes[i]/NUMKEYS * 100);
    printf("\n");
    free(porcentajes);
    return EXIT_SUCCESS;
}
