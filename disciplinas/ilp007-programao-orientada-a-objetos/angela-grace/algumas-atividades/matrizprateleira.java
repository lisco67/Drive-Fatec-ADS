import java.util.Scanner;

public class Matrizprateleira
{	
   public static void main (String args[])
   {  
      Scanner leia = new Scanner(System.in);
      int mat[][] = {{5, 6, 4}, {7, 9, 3}, {2, 11, 15}, {8, 3, 30}};
   	int l, c;
   	
   	for(l=0; l<4; l++)
   	{   System.out.printf("\nPrateleira: %d\n ", l+1);
          for(c=0; c<3; c++)
   	    {   
   	       System.out.printf("Compartimento %d: %d pecas\n", c+1, mat[l][c]);     
   	    }
   	}
      System.out.print("\nEntre com a prateleira e o compartimento procurado:");
      l = leia.nextInt();
      c = leia.nextInt();
      if (l<5 && l>0 && c<4 && c>0)
         System.out.printf("Compartimento %d: %d pecas\n", c+1, mat[l-1][c-1]);
      else
         System.out.printf("Preteleira / compartimento não encontrado.");
   }
}