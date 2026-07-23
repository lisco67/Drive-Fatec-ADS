import java.util.Scanner;

public class Vetor01 
{
   public static void main (String args[])
   {
      Scanner leia = new Scanner(System.in); 
      int i, quant=0, total=0;
      int N[] = new int[10];

      System.out.print("Digite o numero de valores a inserir (<=10):");
      quant = leia.nextInt();

      for (i=0;i<quant;i++)
      {
         System.out.printf("Digite o valor %d:", i+1);
         N[i] = leia.nextInt();
         total += N[i]; //total = total + N[i]
      }
       
      System.out.println("Valores do vetor:");
      for (i=0; i<quant; i++)
         System.out.print(N[i] + ", ");

      System.out.println();
      System.out.println("Somatoria =" + total);
      System.out.printf("A media: %.2f", (double)total/quant);      
   }
}