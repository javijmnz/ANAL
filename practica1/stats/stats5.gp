set terminal png size 1000,1000
set title 'Prueba 5'

set xrange [0:1571]
set yrange [0:70000]
set xlabel "Número"
set ylabel "Frecuencia"

plot "log" title "Frecuencia" with boxes