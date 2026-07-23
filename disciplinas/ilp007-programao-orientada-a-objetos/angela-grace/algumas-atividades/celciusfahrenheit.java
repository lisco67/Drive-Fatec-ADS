import java.util.Scanner;
public class CelciusFahrenheit
{
   public static void main(String args[])
   {
      Scanner input = new Scanner (System.in);
      double fahrenheit, celcius;
      
      System.out.print("Digite um valor da temperatura em Celcius:");
      celcius = input.nextDouble();
      
      fahrenheit = 9.0 / 5 * celcius + 32;
      
      System.out.printf("A temperatura em Fahrenheit e: %.2f \n", fahrenheit);

   }
}