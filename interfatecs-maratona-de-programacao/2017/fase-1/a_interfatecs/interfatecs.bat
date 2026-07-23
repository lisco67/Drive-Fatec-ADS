mkdir my_out
sol\interfatecs.py < in\inInterfatecs1.txt > my_out\outInterfatecs1.txt
sol\interfatecs.py < in\inInterfatecs2.txt > my_out\outInterfatecs2.txt
sol\interfatecs.py < in\inInterfatecs3.txt > my_out\outInterfatecs3.txt
sol\interfatecs.py < in\inInterfatecs4.txt > my_out\outInterfatecs4.txt
sol\interfatecs.py < in\inInterfatecs5.txt > my_out\outInterfatecs5.txt
sol\interfatecs.py < in\inInterfatecs6.txt > my_out\outInterfatecs6.txt
sol\interfatecs.py < in\inInterfatecs7.txt > my_out\outInterfatecs7.txt
sol\interfatecs.py < in\inInterfatecs8.txt > my_out\outInterfatecs8.txt
pause
fc /L my_out\* out\*
pause
