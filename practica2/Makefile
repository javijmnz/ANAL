#-----------------------
# IMPORTANTE: The values of the parameters for exercise?_test have to be conveniently adjusted.
# It is assumed that the name of the source files is exercise1.c, exercise2.c,...,exercise.h
#-----------------------

CC = gcc -ansi -pedantic
CFLAGS = -Wall
EXE = exercise1 exercise2 exercise3 exercise4 exercise4_alt exercise5
PLOTTERS = stats1_bien stats1_mal

INTER_STATS1 = 200000
NUMINTER_STATS1 = 1000
AVG_STATS1 = 100

MIN_STATS5 = 1
MAX_STATS5 = 1000
INCR_STATS5 = 1
FILENAME_STATS5 = stats5.txt
NUMP_STATS5 = 100

all : $(EXE) $(PLOTTERS)
stats : stats1 stats5

.PHONY : clean
clean :
	rm -f -r *.o core $(EXE)
	rm -f stats/*.plotter
	rm -f stats/*.o

$(EXE) : % : %.o sorting.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o $@ $@.o sorting.o times.o permutations.o

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
	@./exercise5 -num_min 1 -num_max 5 -incr 1 -numP 5 -outputFile exercise5.log

$(PLOTTERS) : % : stats/%.o sorting.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o stats/$@.plotter stats/$@.o sorting.o times.o permutations.o

stats1 : stats1_bien stats1_mal
	@echo "generando stats1_mal.txt y stats1_bien.txt"
	@stats/stats1_bien.plotter -inter $(INTER_STATS1) -numInter $(NUMINTER_STATS1) -avg $(AVG_STATS1)
	@stats/stats1_mal.plotter -inter $(INTER_STATS1) -numInter $(NUMINTER_STATS1) -avg $(AVG_STATS1)

stats5 : exercise5
	@echo generando stats5.txt
	@./exercise5 -num_min $(MIN_STATS5) -num_max $(MAX_STATS5) -incr $(INCR_STATS5) -numP $(NUMP_STATS5) -outputFile stats/$(FILENAME_STATS5)