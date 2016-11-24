load "style.gnuplot"

set xlabel "N hits"
set ylabel "Elapsed time (sec)\n(Shorter is better)"

set label 1 \
          "Data: Japanese Wikipedia\n(Many records and large documents)" \
          at first 0,2.875 left
set label 2 \
          "N records: About 0.9millions\nAverage text size: 6.7KiB" \
          at first 0,2.375 left
set label 3 \
          "Slow" \
          textcolor "#ef2929" \
          at first 15306,1.3 left
set label 4 \
          "Slow" \
          textcolor "#ef2929" \
          at first 19889,2.8 right
set output "search-pg-bigm.pdf"
plot [0:20389] \
     "search-ja.tsv" using 7:($6/1000):xtic(7) \
       title columnheader \
       with linespoints \
       linestyle 1

set label 3 \
          "Fast" \
          textcolor "#ef2929" \
          at first 14709,0.25 center
set label 4 \
          "Fast" \
          textcolor "#ef2929" \
          at first 20189,0.25 center
set output "search-pgroonga-pg-bigm.pdf"
plot [0:20389] \
     "search-ja.tsv" using 3:($2/1000) \
       title columnheader \
       with linespoints \
       linestyle 5, \
     "search-ja.tsv" using 7:($6/1000):xtic(7) \
       title columnheader \
       with linespoints \
       linestyle 1

set label 1 \
          at first 200000,2.875 left
set label 2 \
          at first 200000,2.375 left
set label 3 \
          "Slow" \
          textcolor "#ef2929" \
          at first 28306,1.3 left
set label 4 \
          "Slow" \
          textcolor "#ef2929" \
          at first 30889,2.9 left
set label 5 \
          "Fast for many hits!" \
          textcolor "#ef2929" \
          at first 547382,0.25 right
set label 6 \
          "Query: \"日本\"" \
          textcolor "#ef2929" \
          at first 547382,graph -0.1 right
set output "search-pgroonga-pg-bigm-all.pdf"
plot [0:550000] \
     "search-ja.tsv" using 3:($2/1000) \
       title columnheader \
       with linespoints \
       linestyle 5, \
     "search-ja.tsv" using 7:($6/1000) \
       title columnheader \
       with linespoints \
       linestyle 1
