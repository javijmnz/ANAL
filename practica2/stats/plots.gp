# Tamaños 1-101 con incremento de 1 y 100000 permutaciones (OB y TIEMPO)
num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg with l, \
                x title 'n' with l, \
                x * log(x) / log(2) title 'nlog(n)' with l
}

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm. ')'

        set xlabel 'Tamaño'
        set ylabel 'Tiempo (microsegundos)'

        set xrange [int(num_min): int(num_max)]

        f1(x) = k * x

        f2(x) = k * x * log(x) / log(2)
        fit f2(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via k

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title alg with l, \
                f1(x) title 'kn' with l, \
                f2(x) title 'knlog(n)' with l
}       

# Tamaños 1-1001 con incremento de 10 y 1000 permutaciones
num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg with l, \
                x title 'n' with l, \
                x * log(x) / log(2) title 'nlog(n)' with l
}

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'Tiempo (microsegundos)'

        set xrange [int(num_min): int(num_max)]

        f1(x) = k * x

        f2(x) = k * x * log(x) / log(2)
        fit f2(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via k

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title alg with l, \
                f1(x) title 'kn' with l, \
                f2(x) title 'knlog(n)' with l
}

# Tamaños 1-10001 con incremento de 100 y 1000 permutaciones
num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg with l, \
                x title 'n' with l, \
                x * log(x) / log(2) title 'nlog(n)' with l
}

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
        set terminal png size 1000,1000
        set output 'single_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
        set title alg.' Caso Medio (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'Tiempo (microsegundos)'

        set xrange [int(num_min): int(num_max)]

        f1(x) = k * x

        f2(x) = k * x * log(x) / log(2)
        fit f2(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via k

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title alg with l, \
                f1(x) title 'kn' with l, \
                f2(x) title 'knlog(n)' with l
}

#__________________________________________________________________________________________________________________________________________
# COMPARACIÓN OBS
#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title 'Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l, \
        x title 'n' with lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with lw 2

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title 'Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l, \
        x title 'n' with lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with lw 2

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title 'Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'OB'

f2(x) = k * x * log(x) / log(2)
fit f2(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via k


set xrange [int(num_min): int(num_max)]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l, \
        x title 'n' with lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with lw 2

#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN TIEMPOS
#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title 'Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________       

num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title 'Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

f1(x) = k * x
f2(x) = k * x * log(x) / log(2)
fit f2(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via k

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

fm(x) = km * x * log(x) / log(2)
fq1(x) = kq1 * x * log(x) / log(2)
fq2(x) = kq2 * x * log(x) / log(2)
fq3(x) = kq3 * x * log(x) / log(2)
fit fm(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via km
fit fq1(x) 'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq1
fit fq2(x) 'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq2
fit fq3(x) 'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via kq3

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title 'Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mergesort -> %f*nlogn \n", km).sprintf("Quicksort v1 -> %f*nlogn \n", kq1).sprintf("Quicksort v2 -> %f*nlogn \n", kq2).sprintf("Quicksort v3 -> %f*nlogn ", kq3)

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

f1(x) = k * x
f2(x) = k * x * log(x) / log(2)
fit f2(x) 'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 via k

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________
# COMPARACIÓN BEST AVERAGE WORST EMPÍRICOS EN OB y TIEMPO
#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{
        fb(x) = kb * x * log(x) / log(2)
        fm(x) = km * x * log(x) / log(2)
        fw(x) = kw * x * log(x) / log(2)
        
        fit fm(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
        fit fw(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 via kw
        fit fb(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 via kb

        set terminal png size 1000,1000
        set output 'comp_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_best_avg_worst_ob.png'
        set title 'Comparación '.alg.' caso mejor, medio y peor empíricos (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mejor -> %f*nlogn \n", kb).sprintf("Medio -> %f*nlogn \n", km).sprintf("Peor -> %f*nlogn", kw)

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg." avg" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 title alg." worst" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 title alg." best" with l, \
                x title 'n' with lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with lw 2
}

#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{
        fb(x) = kb * x * log(x) / log(2)
        fm(x) = km * x * log(x) / log(2)
        fw(x) = kw * x * log(x) / log(2)
        
        fit fm(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
        fit fw(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 via kw
        fit fb(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 via kb

        set terminal png size 1000,1000
        set output 'comp_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_best_avg_worst_ob.png'
        set title 'Comparación '.alg.' caso mejor, medio y peor empíricos (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mejor -> %f*nlogn \n", kb).sprintf("Medio -> %f*nlogn \n", km).sprintf("Peor -> %f*nlogn", kw)

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    x title 'n' with l lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg." avg" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 title alg." worst" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 title alg." best" with l
}

#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{
        fb(x) = kb * x * log(x) / log(2)
        fm(x) = km * x * log(x) / log(2)
        fw(x) = kw * x * log(x) / log(2)
        
        fit fm(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 via km
        fit fw(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 via kw
        fit fb(x) 'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 via kb

        set terminal png size 1000,1000
        set output 'comp_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_best_avg_worst_ob.png'
        set title 'Comparación '.alg.' caso mejor, medio y peor empíricos (incr = '.incr.', numP = '.perm.')'."\n".sprintf("Mejor -> %f*nlogn \n", kb).sprintf("Medio -> %f*nlogn \n", km).sprintf("Peor -> %f*nlogn", kw)

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    x title 'n' with l lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg." avg" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:4 title alg." worst" with l, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:5 title alg." best" with l
}

#__________________________________________________________________________________________________________________________________________
#WORSTS
#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN ABSOLUTE WORST CASES
#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "10001"
incr = "100"
pot_min = "1"
pot_max = "20"

# OBs
set terminal png size 1000,1000
set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title 'Comparación Caso Peor propio forzado'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v1.log' using 1:3 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v2.log' using 1:3 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v3.log' using 1:3 title "Quicksort_v3" with l

# Tiempo
set terminal png size 1000,1000
set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title 'Comparación Caso Peor propio forzado'

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

f1(x) = k * x
f2(x) = k * x * log(x) / log(2)
fit f2(x) 'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v1.log' using 1:2 via k

plot    f1(x) title 'kn' with l lw 2, \
        f2(x) title 'knlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v1.log' using 1:2 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v2.log' using 1:2 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v3.log' using 1:2 title "Quicksort_v3" with l
#__________________________________________________________________________________________________________________________________________
# COMPARACIÓN WORST CASES QUICKSORT FOR ALL
#__________________________________________________________________________________________________________________________________________
# OBs
do for [alg in "QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{

        set terminal png size 1000,1000
        set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'_avg_ob.png'
        set title ' Comparación Caso Peor forzado de '.alg

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]

        plot    x title 'n' with l lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
                x * x * 0.5 title 'x^2/2' with l lw 2, \
                x * x * 0.25 title 'x^2/4' with l lw 2, \
                'worst_data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "MergeSort" with l, \
                'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v1" with l, \
                'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v2" with l, \
                'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v3" with l
}

# Tiempo
do for [alg in "QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{

        set terminal png size 1000,1000
        set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'_avg_time.png'
        set title ' Comparación Caso Peor forzado de '.alg

        set xlabel 'Tamaño'
        set ylabel 'Tiempo (microsegundos)'

        set xrange [int(num_min): int(num_max)]
        #f1(x) = k * x 
        #f2(x) = k * x * log(x) / log(2)
        #f3(x) = k * x * x * 0.5
        #f4(x) = k * x * x * 0.25
        #fit f4(x) 'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:2 via k

        #plot    f1(x) title 'kn' with l lw 2, \
        #        f2(x) title 'knlog(n)' with l lw 2, \
        #        f3(x) title 'kx^2/2' with l lw 2, \
        #        f4(x) title 'kx^2/4' with l lw 2, \
        plot    'worst_data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:2 title "MergeSort" with l, \
                'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:2 title "Quicksort_v1" with l, \
                'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:2 title "Quicksort_v2" with l, \
                'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:2 title "Quicksort_v3" with l
}
#__________________________________________________________________________________________________________________________________________
# COMPARACIÓN WORST CASE MERGESORT FOR ALL
#__________________________________________________________________________________________________________________________________________
# OBs
set terminal png size 1000,1000
set output 'comp_graph/comp_worst_pot'.pot_min.'-pot'.pot_max.'_incr'.incr.'_with_worst_MergeSort_avg_ob.png'
set title 'Comparación Caso Peor forzado de MergeSort'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v3" with l

# Tiempo
set terminal png size 1000,1000
set output 'comp_graph/comp_worst_pot'.pot_min.'-pot'.pot_max.'_incr'.incr.'_with_worst_MergeSort_avg_time.png'
set title 'Comparación Caso Peor forzado de MergeSort'

set xlabel 'Tamaño'
set ylabel 'Tiempo (microsegundos)'

set xrange [int(num_min): int(num_max)]

f1(x) = k * x
f2(x) = k * x * log(x) / log(2)
fit f2(x) 'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 via k

plot    f1(x) title 'kn' with l lw 2, \
        f2(x) title 'knlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:2 title "Quicksort_v3" with l