set terminal png size 1000,1000
set output 'stats/stats1_bien.png'
set title 'Frecuencia de aparición en random\_num (buena)'
set style fill solid 0.5

set xrange [0:100]
set yrange [0:120000]
set xlabel "Número"
set ylabel "Frecuencia"

plot "stats/stats1_bien.txt" title "Frecuencia" with boxes

