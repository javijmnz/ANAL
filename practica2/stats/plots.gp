# Tamaños 1-100 con incremento de 1 y 10000 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-100_incr1_per10000_avg_ob.png'
    set title alg.' Caso Medio (incr = 1, numP = 10000)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 100]
    #set yrange [0: 1000]

    plot    'single_data/'.alg.'_1-100_incr1_per10000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

# Tamaños 1-1000 con incremento de 1 y 1000 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-1000_incr1_per1000_avg_ob.png'
    set title alg.' Caso Medio (incr = 1, numP = 1000)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 1000]
    #set yrange [0: 1000]

    plot    'single_data/'.alg.'_1-1000_incr1_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

# Tamaños 1-1001 con incremento de 10 y 1000 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-1001_incr10_per1000_avg_ob.png'
    set title alg.' Caso Medio (incr = 10, numP = 1000)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 1001]
    #set yrange [0: 1000]

    plot    'single_data/'.alg.'_1-1001_incr10_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

# Tamaños 1-10001 con incremento de 100 y 1000 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-10001_incr100_per1000_avg_ob.png'
    set title alg.' Caso Medio (incr = 100, numP = 1000)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 10001]
    #set yrange [0: 10000]

    plot    'single_data/'.alg.'_1-10001_incr100_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

# Tamaños 1-100001 con incremento de 1000 y 100 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-100001_incr1000_per100_avg_ob.png'
    set title alg.' Caso Medio (incr = 1000, numP = 100)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 100001]
    #set yrange [0: 10000]

    plot    'single_data/'.alg.'_1-100001_incr1000_per100.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

# Tamaños 1-100001 con incremento de 1000 y 1000 permutaciones
do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"] {
    set terminal png size 1000,1000
    set output 'single_graph/'.alg.'_1-100001_incr1000_per1000_avg_ob.png'
    set title alg.' Caso Medio (incr = 1000, numP = 1000)'

    set xlabel 'Tamaño'
    set ylabel 'OB'

    set xrange [0: 100001]
    #set yrange [0: 10000]

    plot    'single_data/'.alg.'_1-100001_incr1000_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}
#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN OBS
#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title ' Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title ' Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title ' Comparación Caso Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN TIEMPOS
#__________________________________________________________________________________________________________________________________________
num_min = "1"
num_max = "101"
incr = "1"
perm = "100000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title ' Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'Tiempo'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________       

num_min = "1"
num_max = "1001"
incr = "10"
perm = "1000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title ' Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'Tiempo'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________

num_min = "1"
num_max = "10001"
incr = "100"
perm = "1000"

set terminal png size 1000,1000
set output 'comp_graph/comp_rand_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_time.png'
set title ' Comparación Tiempo Medio (incr = '.incr.', numP = '.perm.')'

set xlabel 'Tamaño'
set ylabel 'Tiempo'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    'data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "MergeSort" with l, \
        'data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v1" with l, \
        'data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v2" with l, \
        'data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:2 title "Quicksort_v3" with l

#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN BEST AVERAGE WORST 1-100 INCR 1 PERMS 100000
#__________________________________________________________________________________________________________________________________________

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{
        num_min = "1"
        num_max = "101"
        incr = "1"
        perm = "100000"

        set terminal png size 1000,1000
        set output 'comp_graph/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_best_avg_worst_ob.png'
        set title ' Comparación '.alg.' caso mejor, medio y peor (incr = '.incr.', numP = '.perm.')'

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]
        #set yrange [0: 10000]

        plot    x title 'n' with l lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
                'data/'.alg.'_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'.log' using 1:3 title alg."avg" with l, \
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

set terminal png size 1000,1000
set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_avg_ob.png'
set title ' Comparación peor caso absoluto'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v1.log' using 1:3 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v2.log' using 1:3 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_Quicksort_v3.log' using 1:3 title "Quicksort_v3" with l
#__________________________________________________________________________________________________________________________________________
#COMPARACIÓN WORST CASES EACH ONE
#__________________________________________________________________________________________________________________________________________
do for [alg in "QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]{

        set terminal png size 1000,1000
        set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_with_worst_'.alg.'_avg_ob.png'
        set title ' Comparación peor caso absoluto de '.alg

        set xlabel 'Tamaño'
        set ylabel 'OB'

        set xrange [int(num_min): int(num_max)]
        #set yrange [0: 10000]

        plot    x title 'n' with l lw 2, \
                x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
                x * x *0.5 title 'xx' with l lw 2, \
                'worst_data/MergeSort_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "MergeSort" with l, \
                'worst_data/Quicksort_v1_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v1" with l, \
                'worst_data/Quicksort_v2_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v2" with l, \
                'worst_data/Quicksort_v3_'.num_min.'-'.num_max.'_incr'.incr.'_with_worst_'.alg.'.log' using 1:3 title "Quicksort_v3" with l
}

set terminal png size 1000,1000
set output 'comp_graph/comp_worst_'.num_min.'-'.num_max.'_incr'.incr.'_per'.perm.'_with_worst_MergeSort_avg_ob.png'
set title ' Comparación peor caso absoluto de MergeSort'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [int(num_min): int(num_max)]
#set yrange [0: 10000]

plot    x title 'n' with l lw 2, \
        x * log(x) / log(2) title 'nlog(n)' with l lw 2, \
        'worst_data/MergeSort_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "MergeSort" with l, \
        'worst_data/Quicksort_v1_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v1" with l, \
        'worst_data/Quicksort_v2_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v2" with l, \
        'worst_data/Quicksort_v3_pot'.pot_min.'-pot'.pot_max.'_with_worst_Mergesort.log' using 1:3 title "Quicksort_v3" with l