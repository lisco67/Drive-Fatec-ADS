/*
FATEC SÃO PAULO , ADS		
PROJETO DE ILP500 - ENTREGA: 19 de junho de 2019
EXERCÍCIO - 3 Gerador de Senhas
*/
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
void gerar_senha(char *senha,int tam,char tipo);
int main()
{
	int matricula,tam,i;
	char *senha,tiposenha;
	srand(time(NULL));
	FILE *entrada,*saida;
	entrada = fopen("matr.txt", "r");
	if (entrada == NULL) {
    	printf("Arquivo não localizado");
    	return(1);
  	}
	saida = fopen("senha.txt","w");
	
	printf("1.Escreva o tipo de senha\na-Numerica\nb- Alfabetica\nc- Alfanumerica1\nd- Alfanumerica2 \ne- Geral\n");	scanf("%c",&tiposenha);
	while(tiposenha<97||tiposenha>101){
		printf("TIPO INVALIDO, DIGITE UM TIPO ESPECIFICADO ACIMA\n");scanf("%c",&tiposenha);
	}
	
	printf("2.Escreva o tamanho da senha:");scanf("%d",&tam);
	while(tam<1){
		printf("\n TAMANHO INVALIDO, DIGITE UM TAMANHO MAIOR QUE 0:");scanf("%d",&tam);
	}
	
	senha = (char *)malloc(sizeof(char) * (tam+1));
	senha[tam]='\0';

		switch(tiposenha){
			case 'a':
					while (fscanf(entrada, "%d", &matricula) != EOF){
						for(i=0;i<tam;i++){
							senha[i]=rand()%10+48;
						}
						fprintf(saida,("%d;%s;\n"),matricula,senha);
					}	
			break;
			case 'b':
					while (fscanf(entrada, "%d", &matricula) != EOF){
						for(i=0;i<tam;i++){
							if(rand()%2)
							senha[i]=rand()%25+65;
						else
							senha[i]=rand()%25+97;
						}
						fprintf(saida,("%d;%s;\n"),matricula,senha);
					}	
			break;
			case 'c':
					while (fscanf(entrada, "%d", &matricula) != EOF){
						for(i=0;i<tam;i++){
							if(rand()%2)
								senha[i]=rand()%10+48;
							else
								senha[i]=rand()%25+65;
						}
						fprintf(saida,("%d;%s;\n"),matricula,senha);
					}	
			break;
			case 'd':
					while (fscanf(entrada, "%d", &matricula) != EOF){
						for(i=0;i<tam;i++){
							if(rand()%2)
								senha[i]=rand()%10+48;
							else
								senha[i]=rand()%25+97;
						}
						fprintf(saida,("%d;%s;\n"),matricula,senha);
					}	
			break;
			case 'e':
					while (fscanf(entrada, "%d", &matricula) != EOF){
						for(i=0;i<tam;i++){
							if(rand()%3==2)
								senha[i]=rand()%14+32;
							else if(rand()%3==1)
								senha[i]=rand()%42+48;
							else
								senha[i]=rand()%25+97;
						}
						fprintf(saida,("%d;%s;\n"),matricula,senha);
					}	
			break;
		}	
	
	printf("\n Senhas geradas com sucesso.");
	printf("\nFim do programa\n");
	system("pause");
	fclose(entrada);
	fclose(saida);
	free(senha);
	return(0);
}
