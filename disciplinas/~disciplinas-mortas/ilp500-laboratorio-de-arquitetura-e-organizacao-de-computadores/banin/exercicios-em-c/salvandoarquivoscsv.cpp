/*
SALVANDO DESGRAÇA
*/
#include<stdio.h>
#include<stdlib.h>
int main(){
	int Cod,Qtde;
	double preco;
	FILE *Arq;
	int N,i;
	printf("Digite N:\n");
	scanf("%d",&N);
	Arq=fopen("gera.txt","w");
	for(i=0;i<N;i++){
		Cod=rand()%1001 + 10000;
		preco=(rand()%10000)/100;
		Qtde= rand()%200;
		fprintf(Arq,"%d;%.2lf;%d\n",Cod,preco,Qtde);
	}
	
	
	
	
	
	
	
	
	
	fclose(Arq);
}
