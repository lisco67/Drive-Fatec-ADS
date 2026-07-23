import java.util.Scanner;

public class VetorVogais
{
   public static void main (String args[])
   {      
      Scanner input = new Scanner (System.in);
      String vog[] = new String[5];
      int i;
      
      for(i=0;i<=4;i++)
      {
         System.out.printf("Escreva a %sa vogal: \n", i+1);
         vog[i] = input.nextLine();
      }
      
      System.out.println("Vogais: ");
      for(i=0;i<=4;i++)
      {
         System.out.print(vog[i] + ", ");
      }
   }
}