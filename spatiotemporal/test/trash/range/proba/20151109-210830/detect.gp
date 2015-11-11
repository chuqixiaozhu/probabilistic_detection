#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_m_num_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 24"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
#set samples 1000
set style data histogram
set style histogram clustered gap 1
set style fill transparent solid 0.5 border
set output "range_vs_pd.eps"
set xlabel "Deployment Range of Sensors"
set xrange [-1:3]
#set xtics 1
#set mxtics 1
#set ylabel "{/SimSun=20 ：?DD?━?：∴2a：o?┐???：o (%)}"
set ylabel "Detection Probability (%)"
set yrange [0:100]
set ytics 20
#set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at -0.8, 5.8
#set boxwidth 0.5 relative
plot "range-pro_vs_pd" u ($2*100.0):xtic(1) title "PD"#, \
     "flow-greedy_vs_lost.txt" u 2:xtic(1) title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2:xtic(1) title "Righthand", \
     "flow-raw_vs_lost.txt" u 2:xtic(1) title "Raw"
set output