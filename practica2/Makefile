#-----------------------
# IMPORTANTE: The values of the parameters for exercise?_test have to be conveniently adjusted.
# It is assumed that the name of the source files is exercise1.c, exercise2.c,...,exercise.h
#-----------------------

CC = gcc -ansi -pedantic
CFLAGS = -Wall
EXTRA_FLAGS = -lm
EXE = test_sort stats_single stats_all stats_mergesort_worst stats_quicksort_worst

NUM_MIN = 1
NUM_MAX = 10001
INCR = 100
NUMP = 1000
POT_MIN = 1
POT_MAX = 20

all : $(EXE)

.PHONY : clean
clean :
	rm -f -r *.o core $(EXE)

$(EXE) : % : %.o sorting.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o $@ $@.o sorting.o times.o permutations.o $(EXTRA_FLAGS)

permutations.o : permutations.c permutations.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $<

sorting.o : sorting.c sorting.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $<

times.o : times.c times.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $<

tests:
	@echo "Probando algoritmos para tamaños $(NUM_MIN)-$(NUM_MAX) con incrementos de $(INCR) y $(NUMP) permutaciones"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)

tests_worst_m:
	@./stats_mergesort_worst -func 0 -pot_min $(POT_MIN) -pot_max $(POT_MAX)
	@./stats_mergesort_worst -func 1 -pot_min $(POT_MIN) -pot_max $(POT_MAX)
	@./stats_mergesort_worst -func 2 -pot_min $(POT_MIN) -pot_max $(POT_MAX)
	@./stats_mergesort_worst -func 3 -pot_min $(POT_MIN) -pot_max $(POT_MAX)

tests_worst_q1:
	@./stats_quicksort_worst -func 0 -worst_version 1 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 1 -worst_version 1 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 2 -worst_version 1 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 3 -worst_version 1 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)

tests_worst_q2:
	@./stats_quicksort_worst -func 0 -worst_version 2 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 1 -worst_version 2 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 2 -worst_version 2 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 3 -worst_version 2 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)

tests_worst_q3:
	@./stats_quicksort_worst -func 0 -worst_version 3 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 1 -worst_version 3 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 2 -worst_version 3 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)
	@./stats_quicksort_worst -func 3 -worst_version 3 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR)	