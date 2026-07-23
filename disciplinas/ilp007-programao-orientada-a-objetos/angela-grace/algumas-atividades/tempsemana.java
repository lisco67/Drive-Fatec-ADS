import java.util.Scanner;

public class tempSemana
{	
   public static void main (String args[])
   {  
      Scanner input = new Scanner(System.in);
      String sem[][] = {{"Segunda","",""}, {"Terca","",""}, {"Quarta","",""}, {"Quinta","",""},{"Sexta","",""},{"Sabado","",""},{"Domingo","",""}};
   	int l, c=0;
   	
   	for(l=0; l<7; l++)
   	{   
   	    {   
   	       System.out.println("Digite a temperatura maxima e minima de "+sem[l][0]+": "); 
             sem[l][c+1] = input.nextLine();
             sem[l][c+2] = input.nextLine();   
   	    }
   	}
      
      for(l=0; l<7; l++)
   	{   
   	    {   
   	       System.out.println(sem[l][0]+"\n Temperatura maxima:"+sem[l][c+1]+" e minima: "+sem[l][c+2]+"\n");   
   	    }
   	}
    
   }
}