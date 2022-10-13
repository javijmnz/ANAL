
set terminal png size 1000,1000
set output ARG2
set title 'Frecuencia de aparición en random\_num\_mal'

set xlabel "Número"
set ylabel "Frecuencia"
set xrange [0:200000000]
set yrange [0:24000000]

plot ARG1 using 1:int(ARG3) title "Frecuencia" with points, 20000000 title "Media esperada" with l lw 2