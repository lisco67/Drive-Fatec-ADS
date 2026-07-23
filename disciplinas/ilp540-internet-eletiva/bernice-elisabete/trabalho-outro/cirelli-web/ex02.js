function calculaIMC(peso, altura){
  var peso = document.getElementById('peso').value;
  var altura = document.getElementById('altura').value;
  let imc = peso/altura**2;
  
  switch(true){
    case (imc <= 18.5):
      document.write(imc.toFixed(2));
      document.write( "<br> Abaixo do peso");
      break;
      
    case (imc <= 24.9):
      document.write(imc.toFixed(2));
      document.write( "<br> Peso ideal (parabéns)");
      break;

    case (imc <= 29.9):
      document.write(imc.toFixed(2));
      document.write( "<br> Levemente acima do peso");
      break;
      
    case (imc <= 34.9):
      document.write(imc.toFixed(2));
      document.write( "<br> Obesidade grau I");
      break;
      
    case (imc <= 39.9):
      document.write(imc.toFixed(2));
      document.write( "<br> Obesidade grau II (severa)");
      break;
      
    case (imc >= 40):
      document.write(imc.toFixed(2));
      document.write( "<br> Obesidade III");
      break;
  }
}
