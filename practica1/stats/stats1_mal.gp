set terminal png size 1000,1000
set output 'stats/stats1_mal.png'
set title 'Frecuencia de aparición en random\_num (mala)'
set style fill solid 0.5

set xrange [0:100]
set yrange [0:150000]
set xlabel "Número"
set ylabel "Frecuencia"

plot "stats/stats1_mal.txt" title "Frecuencia" with boxes