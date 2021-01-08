gmt begin ���� png
  gmt coast -R-5/5/42/52 -JM12c -W0.2p -Glightgreen -Slightblue -BWSen+t"149 GPS stations of  western France"  --FORMAT_GEO_MAP=dddF
  rem gmt grdimage earth_relief_30s.grd -JM12c -R-5/5/42/52 -BWSEN -Baf -I+d
  gmt inset begin -DjBL+w3c/3.6c+o0.1c -F+gwhite+p0.3p
    gmt coast -R-10/20/30/60 -JM?  -Glightgreen -Slightblue -N1/0.5p -BWSen -A10000 -W0.5p,black
    echo 2.335 48.836 | gmt plot -Sc0.3c -Gmagenta  -W0.1p,red
    echo 2.335 48.836 France | gmt text  -F+f12p,1,red+jTL -D-0.6c/-0.15c
    gmt inset end
   gmt plot  long_lat.txt -Baf -BWSen -St0.2c -W0.001p,black -Gmagenta 
gmt end show
pause
