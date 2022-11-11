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

#comparación ob
# Tamaños 1-100001 con incremento de 1000 y 1000 permutaciones
set terminal png size 1000,1000
set output 'comp_graph/_1-100001_incr1000_per1000_avg_ob.png'
set title alg.' Caso Medio (incr = 1000, numP = 1000)'

set xlabel 'Tamaño'
set ylabel 'OB'

set xrange [0: 100001]
#set yrange [0: 10000]

do for [alg in "MergeSort QuickSort\_v1 QuickSort\_v2 QuickSort\_v3"]
plot    'single_data/'.alg.'_1-100001_incr1000_per1000.log' using 1:3 title alg with l, \
        x title 'n' with l, \
        x * log(x) / log(2) title 'nlog(n)' with l

