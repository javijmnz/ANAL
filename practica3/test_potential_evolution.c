#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "search.h"
#include "permutations.h"

#define N 100
#define N_TIMES 100000

int cmp_int(const void *e1, const void *e2) {
    return *((int *) e1) - *((int *) e2);
}

int main() {
    int *claves = NULL, i, j, nob, pos, *perm = NULL;
    PDICT pdict = NULL;

    srand(time(NULL));
    claves = (int *) malloc(N * N_TIMES * sizeof(int));
    if (!claves) {
        exit(-1);
    }

    pdict = init_dictionary(N, NOT_SORTED);

    if (pdict == NULL) {
        /* error */
        fprintf(stderr, "Error: Dictionary could not be initialized\n");
        free(claves);
        exit(-1);
    }

    perm = generate_perm(N);

    if (perm == NULL) {
        /* error */
        fprintf(stderr, "Error: No hay memoria\n");
        free_dictionary(pdict);
        free(claves);
        exit(-1);
    }

    nob = massive_insertion_dictionary(pdict, perm, N);

    if (nob == ERR) {
        /* error */
        fprintf(stderr, "Error: Dictionary could not be created\n");
        free(perm);
        free_dictionary(pdict);
        free(claves);
        exit(-1);
    }

    printf("Array inicial: \n");
    for (j = 0; j < N; j++)
        printf("%d ", pdict->table[j]);
    printf("\n");

    uniform_key_generator(claves, N * N_TIMES, N);
    for (i = 1; i <= N * N_TIMES; i++) {
        search_dictionary(pdict, claves[i-1], &pos, lin_auto_search);
        if (i % (N * 1000) == 0 || i == N || i == 10*N || i == 100*N || i == 1000*N) {
            printf("Array tras %d búsquedas: \n", i);
            for (j = 0; j < N; j++)
                printf("%d ", pdict->table[j]);
            printf("\n");
        }
    }
    printf("\n");
    free(perm);
    free_dictionary(pdict);
    free(claves);

    return EXIT_SUCCESS;
}
