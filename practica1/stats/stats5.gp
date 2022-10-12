
set terminal png size 1000,1000
set output ARG2
set title 'Prueba 5'

set xlabel "Número"
set ylabel "Frecuencia"

plot ARG1 using 1:int(ARG3) title "Time" with l