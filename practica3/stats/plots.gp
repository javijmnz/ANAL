

#--------------------------------------------------------------------------------------------------------------------------------------------------
# COMPARACIÓN DE TODOS OB
#--------------------------------------------------------------------------------------------------------------------------------------------------
num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k3

set terminal png size 1000,1000
set output 'graph/comp_all_key_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria, lineal y lineal autoorganizada\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin search -> %.2f*n \n", k2).sprintf("Lin auto search -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'lin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'lin auto search' with l


num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "100"

set xrange [int(num_min): int(num_max)]

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k3

set terminal png size 1000,1000
set output 'graph/comp_all_key_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria, lineal y lineal autoorganizada\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin search -> %.2f*n \n", k2).sprintf("Lin auto search -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'lin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'lin auto search' with l


#--------------------------------------------------------------------------------------------------------------------------------------------------
# COMPARACIÓN DE TODOS TIEMPO
#--------------------------------------------------------------------------------------------------------------------------------------------------
num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k3

set terminal png size 1000,1000
set output 'graph/comp_all_key_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria, lineal y lineal autoorganizada\n".'Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin search -> %.4f*n \n", k2).sprintf("Lin auto search -> %.4f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'lin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'lin auto search' with l


num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "100"

set xrange [int(num_min): int(num_max)]

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k1
fit f2(x)'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k2
fit f3(x)'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k3

set terminal png size 1000,1000
set output 'graph/comp_all_key_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria, lineal y lineal autoorganizada\n".'Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin search -> %.4f*n \n", k2).sprintf("Lin auto search -> %.4f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'


plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'lin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'lin auto search' with l


#--------------------------------------------------------------------------------------------------------------------------------------------------
# BEST AVG WORST
#--------------------------------------------------------------------------------------------------------------------------------------------------

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1000"

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title 'Búsqueda binaria (incr = '.incr.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> ceil(logn) \n")

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'caso medio' with l, \
        'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'peor caso' with l, \
        'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'mejor caso' with l, \
        log(x) / log(2) title "log" with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title 'Búsqueda lineal (incr = '.incr.')'."\n".sprintf("Caso medio -> %.2f*n \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'caso medio' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'peor caso' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'mejor caso' with l

# lin auto search

# lo mismo lo quito los fit
f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada (incr = '.incr.' n_times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000000"

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title 'Búsqueda binaria (incr = '.incr.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> ceil(logn) \n")

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'caso medio' with l, \
        'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'peor caso' with l, \
        'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'mejor caso' with l, \
        log(x) / log(2) title "log" with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title 'Búsqueda lineal (incr = '.incr.')'."\n".sprintf("Caso medio -> %.2f*n \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'caso medio' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'peor caso' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'mejor caso' with l

# lin auto search

# lo mismo lo quito los fit
f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada (incr = '.incr.' n_times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l

#--------------------------------------------------------------------------------------------------------------------------------------------------
# CMP BIN LIN SEARCH
#--------------------------------------------------------------------------------------------------------------------------------------------------

# OB

num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_lin_bin_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin search -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'lin search' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_lin_bin_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin search -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'lin search' with l

# TIME

num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k2

set terminal png size 1000,1000
set output 'graph/comp_lin_bin_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria y lineal\n".'Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin search -> %.4f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'lin search' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k2

set terminal png size 1000,1000
set output 'graph/comp_lin_bin_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria y lineal\n".'Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin search -> %.4f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 title 'bin search' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'lin search' with l



#--------------------------------------------------------------------------------------------------------------------------------------------------
# CMP BIN LIN AUTO SEARCH
#--------------------------------------------------------------------------------------------------------------------------------------------------

#OB

# N_times = 1

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1"
n_perms = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title 'Comparación búsqueda binaria y lineal autoorganizada n_times = '.n_times."\n".' Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search' with l


# N_times = 1.000

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000"
n_perms = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".' Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search' with l

# N_times = 1.000.000

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".' Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'lin auto search' with l

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'


plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'lin auto search' with l

# TIME

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1000000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".' Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin auto search -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'lin auto search' with l

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".'Tiempo (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin auto search -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'


plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'lin auto search' with l

#--------------------------------------------------------------------------------------------------------------------------------------------------
# CMP DIFFERENT LIN AUTO SEARCH
#--------------------------------------------------------------------------------------------------------------------------------------------------

# OB medias

num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 via k3

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_avg_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 1000 -> %.2f*logn \n", k2).sprintf("n times = 1000000 -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 title 'n times = 1000000' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 via k4

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_avg_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 10 -> %.2f*logn \n", k2).sprintf("n times = 100 -> %.2f*logn \n", k3).sprintf("n times = 1000 -> %.2f*logn \n", k4)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:3 title 'n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 title 'n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'n times = 1000' with l

# OB minimos

num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:5 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:5 via k3

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_min_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Minimo (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 1000 -> %.2f*logn \n", k2).sprintf("n times = 1000000 -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:5 title 'n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:5 title 'n times = 1000000' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:5 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:5 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:5 via k4

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_min_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Mínimo (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 10 -> %.2f*logn \n", k2).sprintf("n times = 100 -> %.2f*logn \n", k3).sprintf("n times = 1000 -> %.2f*logn \n", k4)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:5 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:5 title 'n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:5 title 'n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:5 title 'n times = 1000' with l

# OB maximos

num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:4 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:4 via k3

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_max_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Máximo (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 1000 -> %.2f*logn \n", k2).sprintf("n times = 1000000 -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:4 title 'n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:4 title 'n times = 1000000' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:4 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:4 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:4 via k4

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_max_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Máximo (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 10 -> %.2f*logn \n", k2).sprintf("n times = 100 -> %.2f*logn \n", k3).sprintf("n times = 1000 -> %.2f*logn \n", k4)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:4 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:4 title 'n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:4 title 'n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:4 title 'n times = 1000' with l

#--------------------------------------------------------------------------------------------------------------------------------------------------
# CMP DIFFERENT LIN AUTO SEARCH
#--------------------------------------------------------------------------------------------------------------------------------------------------
num_min = "1"
num_max = "101"
incr = "1"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 via k3

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_avg_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 1000 -> %.2f*logn \n", k2).sprintf("n times = 1000000 -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 title 'n times = 1000000' with l

num_min = "1"
num_max = "100001"
incr = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 via k4

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_avg_ob.png'
set title "Comparación busqueda lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n".sprintf("n times = 1 -> %.2f*logn \n", k1).sprintf("n times = 10 -> %.2f*logn \n", k2).sprintf("n times = 100 -> %.2f*logn \n", k3).sprintf("n times = 1000 -> %.2f*logn \n", k4)

set xlabel 'Tamaño'
set ylabel 'OB'

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10.log' using 1:3 title 'n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 title 'n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'n times = 1000' with l


#--------------------------------------------------------------------------------------------------------------------------------------------------
# CMP UNIF VS POT
#--------------------------------------------------------------------------------------------------------------------------------------------------
num_min = "1"
num_max = "101"
incr = "1"
n_times = "100000"

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*logn \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'uniforme' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'potencial' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:3 title 'potencial' with l
        
