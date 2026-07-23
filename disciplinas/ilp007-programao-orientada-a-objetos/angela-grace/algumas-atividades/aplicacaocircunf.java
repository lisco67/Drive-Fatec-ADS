import java.util.Scanner;
public class AplicacaoCircunf
{
   public static void main(String args[])
   {
      Circunferencia circ = new Circunferencia();
      Scanner dado = new Scanner (System.in);
      double raio;
      
      System.out.print("Digite o raio: ");
      raio = dado.nextDouble();
      
      circ.setRaio(raio);
      
      System.out.printf("\nO Diametro da Circunferencia e: %.2f", circ.getDiametro());
      System.out.printf("\nA Area da Circunferencia e: %.2f", circ.getArea());
      System.out.printf("\nO Perimetro da Circunferencia e: %.2f", circ.getPerimetro());
   }
}
