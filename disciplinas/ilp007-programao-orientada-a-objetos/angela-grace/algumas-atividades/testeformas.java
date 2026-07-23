public class TesteFormas
{
   public static void main(String args[])
   {
      Circulo c = new Circulo(3);
      c.imprime();
      System.out.println();
      
      Retangulo r = new Retangulo (3,4);
      r.imprime();
      System.out.println();
      
      Triangulo t = new Triangulo (2,2);
      t.imprime();
      System.out.println();
   }
}