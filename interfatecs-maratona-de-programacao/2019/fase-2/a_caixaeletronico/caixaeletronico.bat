@echo off
set cont=0
for %%A in (in\*) do set /a cont+=1

mkdir my_out
@echo on
for /l %%x in (1, 1, %cont%) do (
    sol\caixaeletronico.py < in\inCaixaeletronico%%x.txt > my_out\outCaixaeletronico%%x.txt
)
pause
fc /L my_out\* out\*
pause
