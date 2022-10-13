set terminal png size 1000,1000
set output "stats5_comp_65000_time.png"
set title 'Tiempo de SelectSort vs SelectSortInv'

set xlabel "Tamaño"
set ylabel "Time"

plot "stats5_selectsort_65000.txt" using 1:2 title "OB SelectSort" with l lw 2 linecolor 2,\
     "stats5_selectsortinv_65000.txt" using 1:2 title "OB SelectSortInv" with l lw 2 linecolor 1