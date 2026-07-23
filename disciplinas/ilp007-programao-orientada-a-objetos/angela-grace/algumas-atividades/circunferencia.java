public class Circunferencia
{  
   private double raio;
   
   public Circunferencia()
   {  
   }
   
   public Circunferencia (double r)
   {
      setRaio(r);
   }
   
   public void setRaio(double r)
   {
      if(r<0)
         System.out.println("O raio não pode ser negativo.");
      else
         raio = r;
   }
   
   public double getRaio()
   {
      return raio;
   }
   
   public double getDiametro()
   {
      return 2 * raio;
   }
   
   public double getPerimetro()
   {
      return 2 * 3.1415 * raio;
   }
   
   public double getArea()
   {
      return (raio * raio) * 3.1415;
   }  
}