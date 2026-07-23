function horas() {
     var hoje = new Date();
     var h = hoje.getHours();
     var m = hoje.getMinutes();
     var s = hoje.getSeconds();
     m = checkTime(m);
     s = checkTime(s);
     document.getElementById('txt').innerHTML=h+":"+m+":"+s;
     temporizador = setTimeout('horas()', 500);
 }

 function checkTime(i){
 if (i<10) {
     i = "0" + i;
 }
     return i;
 }
