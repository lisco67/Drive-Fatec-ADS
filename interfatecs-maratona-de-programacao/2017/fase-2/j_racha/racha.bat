mkdir my_out
sol\racha.py < in\inRacha0.txt > my_out\outRacha0.txt
sol\racha.py < in\inRacha1.txt > my_out\outRacha1.txt
sol\racha.py < in\inRacha2.txt > my_out\outRacha2.txt
sol\racha.py < in\inRacha3.txt > my_out\outRacha3.txt
sol\racha.py < in\inRacha4.txt > my_out\outRacha4.txt
sol\racha.py < in\inRacha5.txt > my_out\outRacha5.txt
sol\racha.py < in\inRacha6.txt > my_out\outRacha6.txt
sol\racha.py < in\inRacha7.txt > my_out\outRacha7.txt
sol\racha.py < in\inRacha8.txt > my_out\outRacha8.txt
sol\racha.py < in\inRacha9.txt > my_out\outRacha9.txt
pause
fc /L my_out\* out\*
pause
