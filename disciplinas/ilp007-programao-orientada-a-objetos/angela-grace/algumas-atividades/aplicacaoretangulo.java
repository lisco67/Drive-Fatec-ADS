import java.util.Scanner;

public class AplicacaoRetangulo
{
   public static void main(String args[])
   {
      Retangulo ret = new Retangulo();
      Scanner dado = new Scanner(System.in);
      double base, alt;
      
      System.out.print("Digite a base:");
      base = dado.nextDouble();
      System.out.print("Digite a altura:");
      alt  = dado.nextDouble();
      
      ret.setBase(base);
      ret.setAltura(alt);
      ret.exibirDados();
   }
}
