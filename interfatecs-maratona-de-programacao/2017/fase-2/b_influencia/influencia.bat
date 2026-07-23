mkdir my_out
sol\influencia.py < in\inInfluencia1.txt > my_out\outInfluencia1.txt
sol\influencia.py < in\inInfluencia2.txt > my_out\outInfluencia2.txt
sol\influencia.py < in\inInfluencia3.txt > my_out\outInfluencia3.txt
sol\influencia.py < in\inInfluencia4.txt > my_out\outInfluencia4.txt
sol\influencia.py < in\inInfluencia5.txt > my_out\outInfluencia5.txt
sol\influencia.py < in\inInfluencia6.txt > my_out\outInfluencia6.txt
pause
fc /L my_out\* out\*
pause
