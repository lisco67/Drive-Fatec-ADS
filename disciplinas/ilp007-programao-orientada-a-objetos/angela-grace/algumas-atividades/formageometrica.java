public abstract class FormaGeometrica
{
   protected int lados;
   
   public void setLados(int lados)
   {
      if(lados<0) 
         this.lados = 0;
      else
         this.lados = lados;
   }
   public abstract double area();
   
   public void imprime()
   {
      System.out.println("Numero de lados: "+lados);
      System.out.printf("Area: %.2f\n", area());
   }
}