do for [alg in "MergeSort QuickSort_v1 QuickSort_v2 QuickSort_v3"] {
    set terminal png size 1000,1000
    set output alg.'_1-1001_incr10_per1000_avg.png'
    set title alg.'\_1-1001\_incr10\_per1000\_avg.png'

    set xlabel 'tamaño'
    set ylabel 'tiempo'

    #set xrange [0: 10001]
    #set yrange [0: 10000]

    plot    alg.'_1-1001_incr10_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}

do for [alg in "MergeSort QuickSort_v1 QuickSort_v2 QuickSort_v3"] {
    set terminal png size 1000,1000
    set output alg.'_1-100001_incr1000_per1000_avg.png'
    set title alg.'\_1-100001\_incr1000\_per1000\_avg.png'

    set xlabel 'tamaño'
    set ylabel 'tiempo'

    #set xrange [0: 10001]
    #set yrange [0: 10000]

    plot    alg.'_1-100001_incr1000_per1000.log' using 1:3 title alg with l, \
            x title 'n' with l, \
            x * log(x) / log(2) title 'nlog(n)' with l
}
