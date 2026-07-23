Program Teste;
uses sysutils;
var
year, month, day, hr, min, sec, ms: Word;

begin


   
   DecodeTime(Time,hr, min, sec, ms);
   writeln (format('Hour: %d:',[hr]));
   writeln (format('Minutes: %d:',[min]));
   writeln (format('Seconds: %d:',[sec]));
   writeln (format('Milliseconds: %d:',[ms]));
end.