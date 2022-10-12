#-----------------------
# IMPORTANTE: The values of the parameters for exercise?_test have to be conveniently adjusted.
# It is assumed that the name of the source files is exercise1.c, exercise2.c,...,exercise.h
#-----------------------

CC = gcc -ansi -pedantic
CFLAGS = -Wall
EXE = exercise1 exercise2 exercise3 exercise4 exercise5 pruebas stats/stats1_alt
PLOTTERS = stats1
PLOTS = stats1_bien stats1_mal

LIMNIF_STATS1 = 1
LIMSUP_STATS1 = 100
NUMN_STATS1 = 10000000
RAND_MAX_MAL = 440

FILENAME_STATS_5 = exercise5_javi.log
OUTPUT_STATS_5 = stats5_
IMAGE_TYPE = .png
COLUMS_STATS_5 = 2 3

all : $(EXE) $(PLOTTERS)
plots : run_stats1 $(PLOTS)
plots5: $(COLUMS_STATS_5)


.PHONY : clean clean_plots
clean :
	rm -f -r *.o core $(EXE)
	rm -f stats/*.plotter
	rm -f stats/*.o

clean_plots :
	rm -f stats/*.txt
	rm -f stats/*.png

$(EXE) : % : %.o sorting.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o $@ $@.o sorting.o times.o permutations.o

$(PLOTTERS) : % : stats/%.o sorting.o times.o permutations.o
	@echo "#---------------------------"
	@echo "# Generating $@ "
	@echo "# Depepends on $^"
	@echo "# Has changed $<"
	$(CC) $(CFLAGS) -o stats/$@.plotter stats/$@.o sorting.o times.o permutations.o

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
	@./exercise2 -size 20 -numP 5

exercise3_test:
	@echo Running exercise3
	@./exercise3 -size 9 -numP 5

exercise4_test:
	@echo Running exercise4
	@./exercise4 -size 10

exercise5_test:
	@echo Running exercise5
	@./exercise5 -num_min 1 -num_max 5 -incr 1 -numP 5 -outputFile exercise5.log

$(PLOTS): % : run_stats1
	@echo "ploteando $@"
	@gnuplot stats/$@.gp

run_stats1 : stats1
	@echo "generando stats1_mal.txt y stats1_bien.txt"
	@stats/stats1.plotter -limInf $(LIMNIF_STATS1) -limSup $(LIMSUP_STATS1) -numN $(NUMN_STATS1) -randMaxMal $(RAND_MAX_MAL)

$(COLUMS_STATS_5): 
	@echo "ploteando stats 5 columna $@"
	@gnuplot -c stats/stats5.gp stats/$(FILENAME_STATS_5) $(OUTPUT_STATS_5)$@$(IMAGE_TYPE) $@