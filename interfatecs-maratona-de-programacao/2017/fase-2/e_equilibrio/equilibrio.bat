mkdir my_out
sol\equilibrio.py < in\inEquilibrio1.txt > my_out\outEquilibrio1.txt
sol\equilibrio.py < in\inEquilibrio2.txt > my_out\outEquilibrio2.txt
sol\equilibrio.py < in\inEquilibrio3.txt > my_out\outEquilibrio3.txt
sol\equilibrio.py < in\inEquilibrio4.txt > my_out\outEquilibrio4.txt
sol\equilibrio.py < in\inEquilibrio5.txt > my_out\outEquilibrio5.txt
sol\equilibrio.py < in\inEquilibrio6.txt > my_out\outEquilibrio6.txt
sol\equilibrio.py < in\inEquilibrio7.txt > my_out\outEquilibrio7.txt
sol\equilibrio.py < in\inEquilibrio8.txt > my_out\outEquilibrio8.txt
sol\equilibrio.py < in\inEquilibrio9.txt > my_out\outEquilibrio9.txt
pause
fc /L my_out\* out\*
pause
