/*
REFAÇA O PROGRAMA ANTERIOR,LENDO UM ARQUIVO QUE CONTENHA EM CADA LINHA NUMEROS REAIS.use precisao dupla
*/

#include<stdio.h>
#include<stdlib.h>
int main(){
	FILE *Arq;
	double *Valor,X;
	int *Cod,tam,i,C;
	
	Arq=fopen("dados.txt","r");
	if(Arq == NULL){
		printf("Arquivo não localizado.");
		return 1;
	}
	Cod=NULL;
	Valor=NULL;
	tam=0;

	while(fscanf(Arq,"%d;%lf",&C,&X)!=EOF){
		tam++;
		Valor=(double *)realloc(Valor,sizeof(double) * tam);
		Cod=(int *)realloc(Cod,sizeof(int) * tam);
		Cod[tam-1]=C;
		Valor[tam-1]=X;
	}
	for(i=0;i<tam;i++){
		printf("Cod[%d] = %.2lf\n",Cod[i],Valor[i]);
	}
	free(Valor);
	free(Cod);
	fclose(Arq);
	return 0;
}
