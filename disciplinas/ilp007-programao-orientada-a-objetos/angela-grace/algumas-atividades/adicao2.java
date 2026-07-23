import java.util.Scanner;
public class Adicao2
{
   public static void main(String args[])
   {
      Scanner input = new Scanner (System.in);
      double num1;
      double num2;
      double soma;
      
      System.out.print("Digite o primeiro numero:");
      num1 = input.nextDouble();
      
      System.out.print("Digite o segundo numero:");
      num2 = input.nextDouble();
      
      soma = num1 + num2;
      
      System.out.printf("A soma e %.2f\n", soma);

   }
}
