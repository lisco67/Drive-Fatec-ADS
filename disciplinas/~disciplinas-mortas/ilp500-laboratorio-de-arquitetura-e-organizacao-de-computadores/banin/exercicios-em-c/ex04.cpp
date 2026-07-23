#include<stdio.h>
#include<stdlib.h>
/*
FATEC SÃO PAULO , ADS		
PROJETO DE ILP500 - ENTREGA: 19 de junho de 2019
EXERCÍCIO 4 Programa de ordenação de vetor
*/
void ordenar_menor(int *v, int tamanho, FILE *saida);
void ordenar_maior(int *v, int tamanho, FILE *saida);
int main()
{
	char modo;
    int numero,i=0,*v;
    FILE *entrada,*saida;
    entrada = fopen("ENTRADA.txt", "r");
    if (entrada == NULL) {
        printf("Arquivo nao localizado");
        return(1);
    }
    saida = fopen("SAIDA.txt","w");
    while (fscanf(entrada, "%d", &numero) != EOF){
    	i++;
    	v = (int *)realloc(v, sizeof(int) * i);
        v[i-1] = numero;
        
    }
    printf("DIGITE \nC - para ordenar em ordem crescente\nD - para ordenar em ordem decrescente\n");scanf("%c",&modo);
    while(modo!='C'&& modo!='D'){
    	printf("\nMODO INVALIDO DIGITE: \nC - para ordenar em ordem crescente\nD - para ordenar em ordem decrescente\n");scanf("%c",&modo);
	}
	if(modo=='C')
		ordenar_menor(v, i, saida);
	else
		ordenar_maior(v, i, saida);
    
    printf("\n Numeros ordenados com sucesso.");
    printf("\n Fim do programa.\n");
    system("PAUSE");
    fclose(entrada);
    fclose(saida);
    free(v);
    return(0);
}
void ordenar_menor(int *v, int tamanho, FILE *saida){
	int aux,i,j;
	for(i=0;i<tamanho;i++){
		for (j=i;j<tamanho;j++){
			if(v[i]>v[j]){
				aux=v[i];
				v[i]=v[j];
				v[j]=aux;
			}	
		}
		fprintf(saida,("%d\n"),v[i]);
	}
}
void ordenar_maior(int *v, int tamanho, FILE *saida){
	int aux,i,j;
	for(i=0;i<tamanho;i++){
		for (j=i;j<tamanho;j++){
			if(v[i]<v[j]){
				aux=v[i];
				v[i]=v[j];
				v[j]=aux;
			}	
		}
		fprintf(saida,("%d\n"),v[i]);
	}
}


