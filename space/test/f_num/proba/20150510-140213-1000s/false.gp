#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_hole_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 20"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
set output "100_f_num_vs_pfalse.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 空洞数量}"
set xlabel "Number of Nodes"
set xrange [1:9]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "False Alarm Probability (%)"
set yrange [0:0.01]
set ytics 0.002
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at 41, 0.595
plot "f_num-pro_vs_pf" u 1:($2*100) w lp lt 1 lw 2 pt 5 ps 2 title "PD", \
     "f_num-maj_vs_pf" u 1:($2*100) w lp lt 2 lw 2 pt 2 ps 2 title "MD", \
     "f_num-cls_vs_pf" u 1:($2*100) w lp lt 3 lw 2 pt 3 ps 2 title "CD"
set output
#!pdftops -eps 20_hole_vs_vt.pdf