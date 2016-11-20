load "style.gnuplot"

set title "Index creation"

set xlabel "Module"
set ylabel "Elapsed time (hour)\n(Shorter is better)"
set noxtic

set yrange[0:]

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9

set label 1 \
          "Data: English Wikipedia" \
          font "Sans,16" \
          at -1,2.9 left
set label 2 \
          "Size: About 33GiB" \
          font "Sans,16" \
          at -1,2.65 left
set label 3 \
          "Max text size: 1MiB" \
          font "Sans,16" \
          at -1,2.4 left
set label 4 \
          "2x faster\nthan textsearch" \
          font "Sans,16" \
          textcolor "#ef2929" \
          at -0.15,1.8 right
set output "index-creation-en.pdf"
plot "index-creation-en.tsv" using 1 \
       title columnheader \
       linestyle 5, \
     "index-creation-en.tsv" using 2 \
       title columnheader \
       linestyle 1, \
     "index-creation-en.tsv" using 3 \
       title columnheader \
       linestyle 6
