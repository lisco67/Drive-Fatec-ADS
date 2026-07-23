mkdir my_out
sol\boleto.py < in\inBoleto1.txt > my_out\outBoleto1.txt
sol\boleto.py < in\inBoleto2.txt > my_out\outBoleto2.txt
sol\boleto.py < in\inBoleto3.txt > my_out\outBoleto3.txt
sol\boleto.py < in\inBoleto4.txt > my_out\outBoleto4.txt
sol\boleto.py < in\inBoleto5.txt > my_out\outBoleto5.txt
sol\boleto.py < in\inBoleto6.txt > my_out\outBoleto6.txt
sol\boleto.py < in\inBoleto7.txt > my_out\outBoleto7.txt
sol\boleto.py < in\inBoleto8.txt > my_out\outBoleto8.txt
sol\boleto.py < in\inBoleto9.txt > my_out\outBoleto9.txt
sol\boleto.py < in\inBoleto10.txt > my_out\outBoleto10.txt
sol\boleto.py < in\inBoleto11.txt > my_out\outBoleto11.txt
pause
fc /L my_out\* out\*
pause
