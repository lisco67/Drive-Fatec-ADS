import java.util.Scanner;
public class RealDolar
{
   public static void main(String args[])
   {
      Scanner input = new Scanner (System.in);
      double real, dolar, tc=5.17;
      
      System.out.print("Digite um valor em reais:");
      real = input.nextDouble();
      
      dolar = real * tc;
      
      System.out.printf("O valor em dolar e %.2f \n(data da taxa de cambio: 22/08/2022)\n", dolar);

   }
}