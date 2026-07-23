mkdir my_out
sol\camadas.py < in\inCamadas1.txt > my_out\outCamadas1.txt
sol\camadas.py < in\inCamadas2.txt > my_out\outCamadas2.txt
sol\camadas.py < in\inCamadas3.txt > my_out\outCamadas3.txt
sol\camadas.py < in\inCamadas4.txt > my_out\outCamadas4.txt
sol\camadas.py < in\inCamadas5.txt > my_out\outCamadas5.txt
sol\camadas.py < in\inCamadas6.txt > my_out\outCamadas6.txt
pause
fc /L my_out\* out\*
pause
