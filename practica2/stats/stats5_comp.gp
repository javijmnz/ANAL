set terminal png size 1000,1000
set output "stats5_comp_65000.png"
set title 'Operaciones básicas de SelectSort vs SelectSortInv'

set xlabel "Tamaño"
set ylabel "OB"

plot "stats5_selectsort_65000.txt" using 1:3 title "OB SelectSort" with l lw 2,\
     "stats5_selectsortinv_65000.txt" using 1:3 title "OB SelectSortInv" with l