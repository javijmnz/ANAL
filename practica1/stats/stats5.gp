
set terminal png size 1000,1000
set output 'stats5.png'
set title 'Prueba 5'

set xlabel "Número"
set ylabel "Frecuencia"

plot ARG1 using 1:int(ARG2) title "Frecuencia" with l