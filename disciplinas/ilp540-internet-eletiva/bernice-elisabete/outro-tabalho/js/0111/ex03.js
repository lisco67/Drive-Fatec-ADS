function nome_asc(n){
  let lista = [];
  let charcode = 65;
  let nome = document.getElementById('n').value;

  for (let i = 0; i < nome; i++){
    nome1 = prompt ("Informe um nome ");
    lista.push(nome1);
  }

  lista.sort();

  for (let i = 0; i < nome; i++){
    let letra = String.fromCharCode(charcode);
    document.write(letra +". "+ lista[i].toUpperCase() + "<br>");
    charcode++;
  }
}
