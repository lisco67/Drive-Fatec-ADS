function media_notas(x, y){

  var nota1 = parseInt(document.getElementById('nota1').value);
  var nota2 = parseInt(document.getElementById('nota2').value);
  var media = (nota1+nota2)/2;

  switch(true){
    case(media >= 9):
    document.write("Média: " + media + "<br>Conceito: E");
    break;

    case(media >= 7.5):
    document.write("Média: " + media + "<br>Conceito: A");
    break;

    case(media >= 6.5):
    document.write("Média: " + media + "<br>Conceito: B");
    break;

    case(media < 6.5):
    document.write("Média: " + media + "<br>Conceito: C");
    break;
  }
}