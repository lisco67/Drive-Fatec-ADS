import java.util.Scanner;
public class Perfil
{
   public static void main(String args[])
   {
      Scanner entrada = new Scanner (System.in);
      int d, m, a, dma, p;
      
      System.out.print("Digite o dia de nascimento:");
      d = entrada.nextInt();
      System.out.print("Digite o mes de nascimento:");
      m = entrada.nextInt();
      System.out.print("Digite o ano de nascimento:");
      a = entrada.nextInt();
      
      dma = ((d * 100)+ m)+ a;
      
      p = ((dma / 100) + (dma % 100)) % 5;
      
      switch(p)
      {    case 0: System.out.println("Timido");
               break;
           case 1: System.out.println("Sonhador");
               break;
           case 2: System.out.println("Paquerador");
               break;
           case 3: System.out.println("Atraente");
               break;
           default: System.out.println("Irresistivel");
               break;
      }
   }
}