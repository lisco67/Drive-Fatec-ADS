/*
FATEC SÃO PAULO , ADS		
PROJETO DE ILP500 - ENTREGA: 19 de junho de 2019
EXERCÍCIO 1 Cálculo de Médias
*/
#include<stdio.h>
#include<stdlib.h>

int main(void) {
  FILE *Arq;
  int i, Matricula;
  double  MF, P1, P2, Tr;
  char Nome[500];
  Arq = fopen("ALUNOS.TXT", "r");
  if (Arq == NULL){
  	printf("Arquivo nao encontrado\n");
  	return(1);
  }
	printf("Matricula  Nome do Aluno\t\t      Media Final  Situacao\n");
  while(fscanf(Arq, "%d;%lf;%lf;%lf;%[^\n]s", &Matricula, &P1, &P2, &Tr, Nome) != EOF){
	MF=((4*P1)+(4*P2)+(2*Tr))/10.0;
	if(MF>=6)
		printf("%d  %-30s\t %.1lf\t  APROVADO\t\n", Matricula, Nome, MF);
  	else
  	printf("%d  %-30s\t %.1lf\t  REPROVADO\n", Matricula, Nome, MF);
  }  
  
  printf("Fim do programa\n");
  system("pause");
  
  fclose(Arq);
  return(0);
}
