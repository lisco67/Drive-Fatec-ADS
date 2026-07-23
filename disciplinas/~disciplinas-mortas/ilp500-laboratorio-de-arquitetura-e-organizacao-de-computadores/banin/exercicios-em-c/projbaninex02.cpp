/*
FATEC SÃO PAULO , ADS		
PROJETO DE ILP500 - ENTREGA: 19 de junho de 2019
EXERCÍCIO 2 -Totalização Simples de Vendas de Produtos
*/
#include <stdio.h>
#include <stdlib.h>
#include <locale.h> //biblioteca usad p/ permitir acentuação
int main (void){
	
	int *vCod, cod; //declara ponteiro p/ vetor código
	int *vQtd, qtd; //declara ponteiro p/ vetor quantidade
	double *vValUnit, valUnit; //declara ponteiro p/ vetor unitário
	FILE *arq; //declara ponteiro p/ arquivo
	int tamV, i, codP; //tamV = tamanho do vetor
	double valT;
	
	
	arq = fopen("vendas.txt","r"); //abre o arquivo p/ leitura
	if (arq == NULL){ //testa se a abertura do arquivo foi bem sucedida ou não
		printf("Arquivo não localizado");
    	return(0);
	}
	vCod = NULL;
	vQtd = NULL;
	vValUnit = NULL;
	tamV = 0;
	while (fscanf(arq, "%d;%d;%lf\n", & cod, & qtd,& valUnit) != EOF) { //enquanto não atingir o final do arquivo
    	tamV++;
    	vCod = (int *)realloc(vCod, sizeof(int) * tamV);//realoca tamanho do vetor
    	vCod[tamV-1] = cod;  //atribui o valor da variável à posição do vetor
    	vQtd = (int *)realloc(vQtd, sizeof(int) * tamV); 
    	vQtd[tamV-1] = qtd;
    	vValUnit = (double *)realloc(vValUnit, sizeof(double) * tamV);
    	vValUnit[tamV-1] = valUnit; 
    	printf("Codigo = %d\n",vCod[tamV-1]);
    	printf("qtd = %d\n",vQtd[tamV-1]);
    	printf("valor = %lf\n",vValUnit[tamV-1]);
  	}
  	fclose(arq);//fecha o arquivo
  	/*Arquivo lido e os dados, copiados para os respectivos vetores */
  	//Programa solicita inserção de códigos dos produtos e calcula o total vendido
	setlocale(LC_ALL, "Portuguese");//configura o idioma do programa para português	
	printf("\nDigite o código: ");
	scanf("%d", & codP);
	while (codP != 0){		
		if ((codP > 10000)  && (codP < 21000) ) {
			printf("Código válido");
			for (i = 0; i < tamV; i++){
				if (vCod[i] == codP){
					printf("\ncódigo = %d", vCod[i]);
					printf("\nqtd = %d\n", vQtd[i]);
					printf("valor = %lf\n", vValUnit[i]);
					valT = vQtd[i]*vValUnit[i]; 
					printf("total venda = %.2lf\n----", valT);
				}
			}
			printf("Total vendido do produto %d = R$ %.2lf", codP, valT);
		}
		else{
			printf("%d Código inválido (deve ser entre 10000 e 21000)", codP);
		}
	printf("\nDigite o código: ");
	scanf("%d", & codP);
	valT = 0;
	}
	
	printf("\nFim do programa\n");
	free(vCod);
	free(vQtd);
	free(vValUnit);
	system("PAUSE");
	return (0);
}

