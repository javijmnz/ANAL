#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define RAND_MAX 3000

int main() {
    long i;
    printf("%lu %lu %lu %lu %lu\n", sizeof(int), sizeof(long), sizeof(long long), sizeof(unsigned int), sizeof(int *));
    i = INT_MAX / 25 * 4;

    printf("%d\n", rand());
    printf("%lu",i);
}
