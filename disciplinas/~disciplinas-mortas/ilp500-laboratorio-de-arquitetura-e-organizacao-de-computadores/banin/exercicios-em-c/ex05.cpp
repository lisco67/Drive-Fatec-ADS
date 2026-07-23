/*
FATEC SÃO PAULO , ADS		
PROJETO DE ILP500 - ENTREGA: 19 de junho de 2019
EXERCÍCIO 5 Gerador de dados de vendas – Este é o Desafio!!!
OBS, ESSE MODO É GERANDO VENDA ALEATORIA
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int buscar_codigo(int *vet,int tam,int quem);
int quantos_dias_tem_o_mes(int mes,int ano);
int DiaSemana(int dd, int mm, int aa);
int main(){
	srand(time(NULL));
	int mes,ano,dias,QtdeVendasDia,*cod,CODIGO,Tam=0,i,j,indice,estoque,mesf,anof,diaf,dia,ajd=0,patrick;
	char *modo,MODOESTOQUE;
	char SIGLAS[27][3]={"AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO"};
	int aliquota[27]={7,7,7,0,7,7,7,12,7,7,7,7,12,7,7,12,7,7,12,7,12,7,7,12,18,7,7};
	double *qtdinicial,QTDINI,*precouni,PRECOUN,*margemlucro,MARGEMLUC,preco,qtdvendida;
	cod=NULL;modo=NULL;qtdinicial=NULL;precouni=NULL;margemlucro=NULL;
	FILE *entrada,*saida;
	entrada = fopen("PRODUTOS.txt", "r");
	if (entrada == NULL) {
    	printf("Arquivo não localizado");
    	return(1);
  	}
  	//COLOCANDO DADOS DO ARQUIVO NOS VETORES
  	while (fscanf(entrada,"%d;%c;%lf;%lf;%lf;\n", &CODIGO,&MODOESTOQUE,&QTDINI,&PRECOUN,&MARGEMLUC) != EOF)
	{
	Tam++;
    cod = (int *)realloc(cod, sizeof(int) * Tam);
    modo = (char *)realloc(modo, sizeof(char) * Tam);
    qtdinicial = (double *)realloc(qtdinicial, sizeof(double) * Tam);
    precouni = (double *)realloc(precouni, sizeof(double) * Tam);
    margemlucro = (double *)realloc(margemlucro, sizeof(double) * Tam);
    cod[Tam-1] = CODIGO;modo[Tam-1] = MODOESTOQUE;qtdinicial[Tam-1] = QTDINI;precouni[Tam-1] = PRECOUN;margemlucro[Tam-1] = MARGEMLUC;       
	}
	saida = fopen("VENDAS.txt","w");
	//IMPRESSÃO TESTE
	for(i = 0;i<Tam;i++)
		printf("%d;%c;%.3lf;%.3lf;%.3lf\n",cod[i],modo[i],qtdinicial[i],precouni[i],margemlucro[i]);
	//FIM DA IMPRESSÃO TESTE	
	
	printf("\nDigite a QtdeVendasDia:");scanf("%d",&QtdeVendasDia);
	while(QtdeVendasDia<1){
		printf("\nDigite a QtdeVendasDia MAIOR QUE 0: ");scanf("%d",&QtdeVendasDia);
	}//QtdeVendas>0
	
	//BRINCANDO E DANÇANDO COM DATAS
	
	printf("\nDigite o ano incial:");scanf("%d",&ano);
	while(ano<2016){
		printf("\nDigite o ano maior que 2015:");scanf("%d",&ano);
	}//ano maior que 2016
	printf("\nDigite o mes inicial:");scanf("%d",&mes);
	while(mes<1 || mes>12){
		printf("\nDigite um mes entre 01 e 12:");scanf("%d",&mes);
	}//mes entre 1 e 12
	printf("\n Digite o dia inicial:");scanf("%d",&dia);
	while(dia<1 || dia>quantos_dias_tem_o_mes(mes,ano)){
		printf("\nDigite um dia valido e menor que %d :",quantos_dias_tem_o_mes(mes,ano));scanf("%d",&dia);
	}//mes entre 1 e 12
	printf("\nDigite ano mes e dia de termino:");scanf("%d%d%d",&anof,&mesf,&diaf);
	while(anof-ano<0){
		printf("\nDIGITE UM ANO MAIOR OU IGUAL AO INICIAL");scanf("%d",&anof);
	}
	
		while(anof-ano==0 && mesf-mes<0){
		printf("\nDIGITE UM MES MAIOR OU IGUAL AO INICIAL");scanf("%d",&mesf);
	}
	
		while(anof-ano==0 && mesf-mes==0 && diaf-dia<1){
		printf("\nDIGITE UM DIA MAIOR QUE INICIAL");scanf("%d",&diaf);
	}

	dias=(365*(anof-ano))+diaf-dia;
	for(int k=mes;k<mesf;k++)
		dias=dias+quantos_dias_tem_o_mes(mes,ano);
	printf("O NUMERO DE DIAS E %d:",dias);
	
	//ACABO A BRINCADEIRA
	
	for(i=0;i<dias;i++){
		if(DiaSemana(dia+ajd,mes,ano)==0 ||DiaSemana(dia+ajd,mes,ano)==6){
			i=i+2;
			dia=dia+2;
		}
		if ((dia+ajd)>quantos_dias_tem_o_mes(mes,ano)){
			dia=(dia+ajd)-quantos_dias_tem_o_mes(mes,ano);
			ajd=0;
			mes++;
			if (mes==13){
				mes=1;
				ano++;
			}
		}
		for(j=0;j<QtdeVendasDia;j++){
			indice=rand()%(Tam);
			estoque=qtdinicial[indice];
			qtdvendida=(rand()%(estoque-1))+1;//GERAR QTD VENDIDA ALEATORIA MAS ABAIXO DO ESTOQUE E ACIMA DE 0
			if((rand()%100)<35){
				preco=precouni[indice]*(margemlucro[indice]/10)*(((rand()%17-8)*0.001)+1);
			}
			else{
				preco=precouni[indice]*(margemlucro[indice]/10);
			}
			patrick=rand()%27;
			fprintf(saida,("%d;%02d;%02d;%d;%.3lf;%.3lf;%s;%d\n"),ano,mes,dia+ajd,cod[indice],qtdvendida,preco,SIGLAS[patrick],aliquota[patrick]);
			ajd++;
		}
		printf("\n DIA %d ",i);
	}
	printf("FIM DO PROGRAMA");
	fclose(entrada);fclose(saida);
	free(cod);free(modo);free(qtdinicial);free(precouni);free(margemlucro);
	return(0);
}
int buscar_codigo(int *vet,int tam,int quem)
{
	int i;
	for(i=0;i<tam;i++){
		if(quem==vet[i]){
			return i;	
		}
	}
	return -1;
}
int quantos_dias_tem_o_mes(int mes,int ano){
	switch (mes){
		case 1:return 31;
		case 2:
		if ( ( ano % 4 == 0 && ano % 100 != 0 ) || ano % 400 == 0 )//VE SE O ANO É BISSEXTO
			return 29;
		return 28;
		case 3:return 31;
		case 4:return 30;
		case 5:return 31;
		case 6:return 30;
		case 7:return 31;
		case 8:return 31;
		case 9:return 30;
		case 10:return 31;
		case 11:return 30;
		case 12:return 31;
	}
	
}
int DiaSemana(int dd, int mm, int aa) {
 time_t hora;
 struct tm *phora;
 time(&hora);
 phora = localtime(&hora);
 phora->tm_year = aa - 1900;
 phora->tm_mon = mm - 1;
 phora->tm_mday = dd;
 mktime(phora);
 return phora->tm_wday;
}


