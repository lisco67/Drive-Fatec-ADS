function carregar(){
	let opcao = document.getElementById("opc").value; 
	
	switch(opcao){
		case 'A' :window.location= "http://www.fatecsp.br"; break;
		case 'B' :window.location= "https://www.google.com"; break;
		case 'C' :window.location= "https://www.w3schools.com"; break;
		default: alert('ERROR');
	}
}

var user = 'Jane';
function cumprimento(nome){
	alert('Bom dia, ' + nome);
	var user = 'Matheus';
}
cumprimento(user)
cumprimento(user)

for (i in navigator){
	document.write('Propriedade: ' + i + '<br />');
	document.write('Valor: ' + navigator[i] + '<hr />');
}

function impar_par(){
	for(let i = 0; i <= 10; i++){
		if (i % 2 == 0) continue;
		document.write(i + '<br />');
	}
}
