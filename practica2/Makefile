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

QS_WORST_VERSION = 2

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
	
exercise1_test:
	@echo Running exercise1
	@./exercise1 -limInf 1 -limSup 5 -numN 10

exercise2_test:
	@echo Running exercise2
	@./exercise2 -size 1 -numP 5

exercise3_test:
	@echo Running exercise3
	@./exercise3 -size 1 -numP 5

exercise4_test:
	@echo Running exercise4
	@./exercise4 -size 1

exercise5_test:
	@echo Running exercise5
	@./exercise5 -num_min 1 -num_max 5 -incr 1 -numP 5000 -outputFile exercise5.log

tests:
	@echo "Probando algoritmos para tamaños $(NUM_MIN)-$(NUM_MAX) con incrementos de $(INCR) y $(NUMP) permutaciones"
#	@echo "Probando MergeSort"
#	@./stats_single -func 2 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
#	@echo "Probando QuickSort_v1"
#	@./stats_single -func 3 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
#	@echo "Probando QuickSort_v2"
#	@./stats_single -func 4 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
#	@echo "Probando QuickSort_v3"
#	@./stats_single -func 5 -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)

tests_quicksort_worst:
	@echo "Probando QuickSort para tamaños $(NUM_MIN)-$(NUM_MAX) con incrementos de $(INCR) y $(NUMP) permutaciones, con la versión $(QS_WORST_VERSION) del worst case"
	@echo "Probando QuickSort_v1"
	@./stats_quicksort_worst -func 1 -worst_version $(QS_WORST_VERSION) -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
	@echo "Probando QuickSort_v2"
	@./stats_quicksort_worst -func 2 -worst_version $(QS_WORST_VERSION) -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)
	@echo "Probando QuickSort_v3"
	@./stats_quicksort_worst -func 3 -worst_version $(QS_WORST_VERSION) -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -numP $(NUMP)

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