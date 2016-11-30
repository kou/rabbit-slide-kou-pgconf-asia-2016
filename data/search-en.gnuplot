load "style.gnuplot"

set xlabel "Query" font "Sans,14"
set ylabel "Elapsed time (ms)\n(Lower is better)"

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9

set label 1 \
          "Data: English Wikipedia" \
          at first -1,1.35 left
set label 2 \
          "(Many records and large docs)" \
          at first -1,1.25 left
set label 3 \
          "N records: About 5.3millions" \
          at first -1,1.15 left
set label 4 \
          "Average text size: 6.4KiB" \
          at first -1,1.05 left
set xtic font "Sans,14"
set output "search-pgroonga-textsearch.pdf"
plot "search-en.tsv" using ($2/1000):xtic(1) \
       title columnheader \
       linestyle 5, \
     "search-en.tsv" using ($8/1000):xtic(1) \
       title columnheader \
       linestyle 1

set label 5 \
          "Groonga is 30x faster than others" \
          textcolor "#ef2929" \
          at first -1,0.9 left
set output "search-pgroonga-groonga-textsearch.pdf"
plot "search-en.tsv" using ($2/1000):xtic(1) \
       title columnheader \
       linestyle 5, \
     "search-en.tsv" using ($4/1000):xtic(1) \
       title columnheader \
       linestyle 2, \
     "search-en.tsv" using ($8/1000):xtic(1) \
       title columnheader \
       linestyle 1
