#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main() {
    long i;
    printf("%lu %lu %lu %lu %lu\n", sizeof(int), sizeof(long), sizeof(long long), sizeof(unsigned int), sizeof(int *));
    i = INT_MAX +2;
    printf("%lu",i);
}
