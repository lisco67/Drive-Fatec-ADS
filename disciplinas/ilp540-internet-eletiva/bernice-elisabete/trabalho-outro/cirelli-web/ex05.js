function data_corr(){
  let lista = ["Bom dia!","Boa tarde!","Boa noite!"];
  let data = ["domingo","segunda-feira","terça-feira","quarta-feira","quinta-feira","sexta-feira","sábado"];
  let mes = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"];

  let data_total = new Date();
  let dia_mes = ("0" + data_total.getDate()).slice(-2);
  let semana = data_total.getDay();
  let num_mes = data_total.getMonth();
  let ano = data_total.getFullYear();

  let hora = data_total.getHours();
  let minutos = data_total.getMinutes();
  let opcao = 0;

  switch(true){
    case(hora >= 0 && hora < 12.00):
      opcao = 0;
      break;

    case(hora >= 12.00 && hora < 18.00):
      opcao = 1;
      break;

    case(hora >= 18.00 && hora < 24.00):
      opcao = 2;
      break;
  }

  document.write(lista[opcao] + " Hoje é " + data[semana] + ", " + dia_mes + " de " + mes[num_mes] + " de " + ano + " - ");
  document.write(hora + ":" + minutos + "hs.");
}
