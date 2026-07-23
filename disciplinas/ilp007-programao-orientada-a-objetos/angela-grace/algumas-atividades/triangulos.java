import java.util.Scanner;
public class Triangulos
{
   public static void main (String args[])
   {
      double a, b, c;
      Scanner entrada = new Scanner (System.in);
      
      System.out.print("Digite o lado A: ");
      a = entrada.nextDouble();
      System.out.print("Digite o lado B: ");
      b = entrada.nextDouble();
      System.out.print("Digite o lado C: ");
      c = entrada.nextDouble();
      if (a<b+c && b<a+c && c<a+b)
      {    if (a*a == b*b + c*c || b*b == a*a + c*c || c*c == b*b + a*a)
               System.out.println("E um triangulo retangulo");
           else
               System.out.println("Nao e um triangulo retangulo");
           
           if(a == b && b == c)
               System.out.println("E um triangulo equilatero");
           else if (a!=b && b!=c && c!=a)
               System.out.println("E um triangulo escaleno");
           else
               System.out.println("E um tiangulo isosceles");
      }
      else
         System.out.print("Nao e um triangulo");
   }
}