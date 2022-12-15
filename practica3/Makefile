#-----------------------
# IMPORTANTE: The values of the parameters for exercise?_test have to be conveniently adjusted.
# It is assumed that the name of the source files is exercise1.c, exercise2.c,...,exercise.h
#-----------------------

CC = gcc -ansi -pedantic
CFLAGS = -Wall 
EXE = test_search stats_all test_generator test_potential_evolution

all : $(EXE)

.PHONY : clean
clean :
	rm -f *.o core $(EXE)

$(EXE) : % : %.o search.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o $@ $@.o search.o times.o permutations.o -lm

permutations.o : permutations.c permutations.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $< -lm

search.o : search.c search.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $< -lm

times.o : times.c times.h
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -c $< -lm

exercise1_test:
	@echo Running exercise1
	@./exercise1 -size 10 -key 5

NUM_MIN = 1
NUM_MAX = 100001
INCR = 1000
N_TIMES = 10
KEY_GEN = 2
N_PERMS = 10

test_search_all:
	@echo "#---------------------------------------------------------------"
	@echo "Running test search \n"
	@echo "\nBinary search \n"
	@./test_search -size 20 -key 5 -search 1
	@echo "\nLineal search \n"
	@./test_search -size 20 -key 8 -search 2
	@echo "\nLineal autoorganized search \n"
	@./test_search -size 20 -key 9 -search 3


stats_bin_search:
	@echo "#---------------------------------------------------------------"
	@echo "Bin search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 1 -key_gen $(KEY_GEN)

stats_lin_search:
	@echo "#---------------------------------------------------------------"
	@echo "Lin search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 2 -key_gen $(KEY_GEN)

stats_lin_auto_search:
	@echo "#---------------------------------------------------------------"
	@echo "Lin auto search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN)"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 3 -key_gen $(KEY_GEN)



exec_stats: stats_bin_search stats_lin_search

stats_lin_auto_search_n_perms:
	@echo "#---------------------------------------------------------------"
	@echo "Lin auto search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN) n perms: $(N_PERMS)"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 3 -key_gen $(KEY_GEN) -n_perms $(N_PERMS) 

stats_lin_search_n_perms:
	@echo "#---------------------------------------------------------------"
	@echo "Lin search $(NUM_MIN)-$(NUM_MAX) incr: $(INCR) n times: $(N_TIMES) key_gen: $(KEY_GEN) n perms: $(N_PERMS)"
	@./stats_all -num_min $(NUM_MIN) -num_max $(NUM_MAX) -incr $(INCR) -n_times $(N_TIMES) -search 2 -key_gen $(KEY_GEN) -n_perms $(N_PERMS) 