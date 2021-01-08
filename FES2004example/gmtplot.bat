gmt begin France png,pdf
gmt basemap  -JM15c -R-5/5/42/52 -Baf -BWSen+t"245 GPS stations of Western France"
gmt makecpt -Cglobe -T-8000/8000
gmt grdimage @earth_relief_30s -I+d
gmt colorbar -Bxa2000 -B+l"m"
gmt inset begin -DjBL+w3c/3.6c+o0.1c -F+gwhite+p0.3p
gmt coast -R-10/20/30/60 -JM?  -Glightgreen -Slightblue -N1/0.5p -BWSen -A10000 -W0.5p,black
    echo 2.335 48.836 | gmt plot -Sc0.3c -Gmagenta  -W0.1p,red
    echo 2.335 48.836 France | gmt text  -F+f12p,1,magenta+jTL -D-0.6c/-0.15c
    gmt inset end
gmt plot  103.txt -Baf -BWSen -Sa0.3c -W0.001p,black -Gred 
gmt end show
pause