

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
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_1.log' using 1:2 title 'lin auto search' with l


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

# potencial

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada'."\nGeneración de claves potencial\n".'(incr = '.incr.' n_times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l

# solo caso medio

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title ' Búsqueda lineal autoorganizada'."\nGeneración de claves potencial\n".'(incr = '.incr.' n_times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        log(x) / log(2) title "log" with l

# tiempo

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k1
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title ' Búsqueda lineal autoorganizada'."\nGeneración de claves potencial\n".'(incr = '.incr.' n_times = '.n_times.')'."\n".sprintf("Caso medio -> %.4f*logn \n", k1)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'caso medio' with l

#uniforme

n_times = "1"

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada'."\nGeneración de claves uniforme\n".'(incr = '.incr.' n times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*n \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l


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

# potencial

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada (incr = '.incr.' n times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*logn \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l

# uniforme

n_times = "100000"

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_best_avg_worst_ob.png'
set title ' Búsqueda lineal autoorganizada'."\nGeneración de claves uniforme\n".'(incr = '.incr.' n times = '.n_times.')'."\n".sprintf("Caso medio -> %.2f*n \n", k1).sprintf("Peor caso -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'caso medio' with l, \
        'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:4 title 'peor caso' with l, \
        'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:5 title 'mejor caso' with l

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

# N_times = all

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1"
n_perms = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)
f5(x) = k5 * log(x) / log(2)


fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k2
n_times = "100"
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k3
n_times = "1000"
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k4
n_times = "1000000"
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k5
n_times = "1"
set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_all_avg_ob.png'
set title 'Comparación búsqueda binaria y lineal autoorganizada'."\n".' Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search n times = 1 -> %.2f*n \n", k2).sprintf("Lin auto search n times = 100 -> %.2f*logn \n", k3).sprintf("Lin auto search n times = 1000 -> %.2f*logn \n", k4).sprintf("Lin auto search n times = 1000000 -> %.2f*logn \n", k5)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 title 'lin auto search n times = 1000000' with l


# N_times demás

num_min = "1"
num_max = "101"
incr = "1"
n_perms = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
n_times = "1000"
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k2
n_times = "1000000"
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k3
n_times = "100"
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 via k4

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_100-1000000_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".' Caso Medio (incr = '.incr.')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search n times = 100 -> %.2f*logn \n", k4).sprintf("Lin auto search n times = 1000 -> %.2f*logn \n", k2).sprintf("Lin auto search n times = 1000000 -> %.2f*logn \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 title 'lin auto search n times = 1000000' with l

# TAMAÑO 10000

num_min = "1"
num_max = "10001"
incr = "100"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * x
f4(x) = k4 * x
f5(x) = k5 * x
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:3 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:3 via k4
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:3 via k5
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 via k7

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_all_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search n times = 1 -> %.2f*n\n", k2).sprintf("Lin auto search n times = 10 -> %.2f*n\n", k3).sprintf("Lin auto search n times = 100 -> %.2f*n\n", k4).sprintf("Lin auto search n times = 1000 -> %.2f*n\n", k5)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:3 title 'lin auto search n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:3 title 'lin auto search n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:3 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:3 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 title 'lin auto search n times = 100000' with l

# solo del 1000-100000
num_min = "1"
num_max = "10001"
incr = "100"

f1(x) = k1 * log(x) / log(2)
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 via k7

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_1000-100000_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".sprintf("Bin search -> %.2f*logn \n", k1)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 title 'lin auto search n times = 100000' with l

# AHORA CON TIEMPO

num_min = "1"
num_max = "10001"
incr = "100"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * x
f4(x) = k4 * x
f5(x) = k5 * x
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:2 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:2 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:2 via k4
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 via k5
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 via k7

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_all_time.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin auto search n times = 1 -> %.4f*n\n", k2).sprintf("Lin auto search n times = 10 -> %.4f*n\n", k3).sprintf("Lin auto search n times = 100 -> %.4f*n\n", k4).sprintf("Lin auto search n times = 1000 -> %.4f*n\n", k5)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:2 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:2 title 'lin auto search n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:2 title 'lin auto search n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:2 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 title 'lin auto search n times = 100000' with l

# solo del 1000-100000

f1(x) = k1 * log(x) / log(2)
f5(x) = k5 * x
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:2 via k1
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 via k5
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 via k7

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_1000-100000_time.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".sprintf("Bin search -> %.4f*logn \n", k1)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:2 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 title 'lin auto search n times = 100000' with l

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# CUARENTENA!!!!!!!!!!!!!!!
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# N times = todos

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1"
n_perms = "10"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * x

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_'.n_perms.'.log' using 1:3 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_'.n_perms.'.log' using 1:3 via k3

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search n = 1 -> %.2f*n \n", k2).sprintf("Lin auto search n = 10 -> %.2f*n \n", k3)

set xlabel 'Tamaño'
set ylabel 'OB'


plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_'.n_perms.'.log' using 1:3 title 'lin auto search n times = 10' with l

# N times 100 1000

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1"
n_perms = "10"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x

set xrange [int(num_min): int(num_max)]

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_mult_avg_ob.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".'Caso Medio (incr = '.incr.', n times = '.n_times. ')'."\n".sprintf("Bin search -> %.2f*logn \n", k1).sprintf("Lin auto search n times = 1000-> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'


plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_1.log' using 1:3 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'lin auto search n times = 1000' with l

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


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# SE ACABA CUARENTENA!!!!!!!!!!!!!!!
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# TIME

num_min = "1"
num_max = "101"
incr = "1"
n_times = "1"
n_perms = "1000"

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * x
f3(x) = k3 * log(x) / log(2)
f4(x) = k4 * log(x) / log(2)
f5(x) = k5 * log(x) / log(2)


fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:2 via k2
n_times = "100"
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:2 via k3
n_times = "1000"
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:2 via k4
n_times = "1000000"
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k5
n_times = "1"

set terminal png size 1000,1000
set output 'graph/comp_bin_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_all_time.png'
set title "Comparación búsqueda binaria y lineal autoorganizada\n".' Tiempo (incr = '.incr.')'."\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin auto search n times = 1 -> %.4f*n \n", k2).sprintf("Lin auto search n times = 100 -> %.4f*logn \n", k3).sprintf("Lin auto search n times = 1000 -> %.4f*logn \n", k4).sprintf("Lin auto search n times = 1000000 -> %.4f*logn \n", k5)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'bin search' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_n_perms_'.n_perms.'.log' using 1:2 title 'lin auto search n = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_'.n_perms.'.log' using 1:2 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_'.n_perms.'.log' using 1:2 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:2 title 'lin auto search n times = 1000000' with l

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
set title "Comparación busqueda lineal autoorganizada\n".'Caso Medio (incr = '.incr.')'."\n"

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000.log' using 1:3 title 'n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000000.log' using 1:3 title 'n times = 1000000' with l

# Tamaño 10000

num_min = "1"
num_max = "10001"
incr = "100"

f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 via k7

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_1000-100000_avg_ob.png'
set title "Comparación busqueda lineal autoorganizada\n"

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:3 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:3 title 'lin auto search n times = 100000' with l

# AHORA CON TIEMPO

num_min = "1"
num_max = "10001"
incr = "100"

f2(x) = k2 * x
f3(x) = k3 * x
f4(x) = k4 * x
f5(x) = k5 * x
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:2 via k2
fit f3(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:2 via k3
fit f4(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:2 via k4
fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 via k5
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 via k7

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_all_time.png'
set title "Comparación busqueda lineal autoorganizada\n".sprintf("Bin search -> %.4f*logn \n", k1).sprintf("Lin auto search n times = 1 -> %.4f*n\n", k2).sprintf("Lin auto search n times = 10 -> %.4f*n\n", k3).sprintf("Lin auto search n times = 100 -> %.4f*n\n", k4).sprintf("Lin auto search n times = 1000 -> %.4f*n\n", k5).sprintf("Lin auto search n times = 10000 -> %.4f*logn\n", k6).sprintf("Lin auto search n times = 100000 -> %.4f*logn\n", k7)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_1000.log' using 1:2 title 'lin auto search n times = 1' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10_n_perms_500.log' using 1:2 title 'lin auto search n times = 10' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100_n_perms_100.log' using 1:2 title 'lin auto search n times = 100' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 title 'lin auto search n times = 100000' with l

# solo del 1000-100000

f5(x) = k5 * x
f6(x) = k6 * log(x) / log(2)
f7(x) = k7 * log(x) / log(2)

fit f5(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 via k5
fit f6(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 via k6
fit f7(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 via k7

set terminal png size 1000,1000
set output 'graph/comp_lin_auto_search_'.num_min.'-'.num_max.'_incr'.incr.'_n_times_1000-100000_time.png'
set title "Comparación busqueda lineal autoorganizada\n"

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1000_n_perms_50.log' using 1:2 title 'lin auto search n times = 1000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times10000_n_perms_10.log' using 1:2 title 'lin auto search n times = 10000' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000_n_perms_1.log' using 1:2 title 'lin auto search n times = 100000' with l

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

#OBS

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
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*logn \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:3 title 'potencial' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'uniforme' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:3 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:3 title 'potencial' with l
        
# TIEMPO

num_min = "1"
num_max = "101"
incr = "1"
n_times = "100000"

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*logn \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k2).sprintf("Potencial -> %.4f*n \n", k1)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:2 title 'potencial' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'uniforme' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:2 title 'potencial' with l

#OBS

num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1000"

set xrange [int(num_min): int(num_max)]

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 via k1
fit f2(x) 'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*logn \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:3 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*n \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'potencial' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'uniforme' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_avg_ob.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada Caso Medio (incr = '.incr.')'."\n".sprintf("Uniforme -> %.2f*n \n", k1).sprintf("Potencial -> %.2f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:3 title 'potencial' with l
        
# TIEMPO

num_min = "1"
num_max = "101"
incr = "1"
n_times = "100000"

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 via k1
fit f2(x) 'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*logn \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100000.log' using 1:2 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k2).sprintf("Potencial -> %.4f*n \n", k1)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1_n_perms_100.log' using 1:2 title 'potencial' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'uniforme' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'.log' using 1:2 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'0.log' using 1:2 title 'potencial' with l

# TIEMPO


num_min = "1"
num_max = "100001"
incr = "1000"
n_times = "1000"

set xrange [int(num_min): int(num_max)]

#bin search

f1(x) = k1 * log(x) / log(2)
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 via k1
fit f2(x) 'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/bin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda binaria Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*logn \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/bin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times100.log' using 1:2 title 'uniforme' with l, \
        'data/bin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'potencial' with l


#lin search

f1(x) = k1 * x
f2(x) = k2 * x

fit f1(x) 'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k1
fit f2(x) 'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k2).sprintf("Potencial -> %.4f*n \n", k1)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'potencial' with l, \
        'data/lin_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'uniforme' with l

# lin auto search

f1(x) = k1 * x
f2(x) = k2 * log(x) / log(2)

fit f1(x) 'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k1
fit f2(x) 'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 via k2
set terminal png size 1000,1000
set output 'graph/lin_auto_search_comp_unif_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times'.n_times.'_time.png'
set title "Comparación generación de claves uniforme y potencial\n".'Búsqueda lineal autoorganizada Tiempo (incr = '.incr.')'."\n".sprintf("Uniforme -> %.4f*n \n", k1).sprintf("Potencial -> %.4f*logn \n", k2)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/lin_auto_search_key_gen_unif_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'uniforme' with l, \
        'data/lin_auto_search_key_gen_pot_'.num_min.'-'.num_max.'_incr'.incr.'_n_times1.log' using 1:2 title 'potencial' with l
        