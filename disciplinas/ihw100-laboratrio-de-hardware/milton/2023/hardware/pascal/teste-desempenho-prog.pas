{Program Teste;
uses sysutils;
var
year, month, day, hr, min, sec, ms: Word;

begin


   
   DecodeTime(Time,hr, min, sec, ms);
   writeln (format('Hour: %d:',[hr]));
   writeln (format('Minutes: %d:',[min]));
   writeln (format('Seconds: %d:',[sec]));
   writeln (format('Milliseconds: %d:',[ms]));
end.}

program Teste;
uses sysutils;
var
Tinicial, Tfinal, DT, ms: Word;
C: Extended;
i, j, k: integer;
ni, nj, nk: word;
begin
ni:= 200;
nj:= ni;
nk:= ni;
Tinicial := ms;
	For i:= 1 to ni do 
	For j:= 1 to nj do 
	For k:= 1 to nk do 
	C:=2*sin(1.2);
	Tfinal := ms;
	//Dt := Tfinal – Tinicial
end.
