#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main() {
    long i;
    printf("%lu %lu %lu %lu %lu\n", sizeof(int), sizeof(double), sizeof(float), sizeof(long), sizeof(long long), sizeof(unsigned int), sizeof(int *));
    i = INT_MAX / 25 * 4;

    printf("%d\n", rand());
    printf("%lu",i);
}
