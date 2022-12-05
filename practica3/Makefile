#-----------------------
# IMPORTANTE: The values of the parameters for exercise?_test have to be conveniently adjusted.
# It is assumed that the name of the source files is exercise1.c, exercise2.c,...,exercise.h
#-----------------------

CC = gcc -ansi -pedantic
CFLAGS = -Wall
EXE = exercise1 exercise2

all : $(EXE)

.PHONY : clean
clean :
	rm -f *.o core $(EXE)

$(EXE) : % : %.o search.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o $@ $@.o search.o times.o permutations.o

permutations.o : permutations.c permutations.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $<

search.o : search.c search.h
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
	@./exercise1 -size 10 -key 5

NUM_MIN = 1
NUM_MAX = 101
INCR = 1
N_TIMES = 100000
KEY_GEN = 1

stats_bin_search:
	@echo "#---------------------------------------------------------------"
	@echo "Bin search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 1 -key_gen $(KEY_GEN)

stats_lin_search:
	@echo "#---------------------------------------------------------------"
	@echo "Lin search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 2 -key_gen $(KEY_GEN)

stats_lin_search_sorted:
	@echo "#---------------------------------------------------------------"
	@echo "Lin search sorted $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 3 -key_gen $(KEY_GEN)

stats_lin_auto_search:
	@echo "#---------------------------------------------------------------"
	@echo "Lin auto search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 4 -key_gen $(KEY_GEN)

stats_bad_lin_search_sorted:
	@echo "#---------------------------------------------------------------"
	@echo "Bad lin search sorted $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 5 -key_gen $(KEY_GEN)

stats_all: stats_bin_search stats_lin_search stats_lin_search_sorted stats_lin_auto_search