public class Conta
{  
   private double saldo;
   
   public Conta()
   {
   }
   
   public Conta (double s)
   {
      setSaldo(s);
   }
   
   public void setSaldo(double s)
   {
      saldo = s;
   }
   
   public double getSaldo()
   {
      return saldo;
   }
   
   public void saque (double saq)
   {
      saldo = saldo - saq;
   }
   
   public void deposito (double dep)
   {
      saldo = saldo + dep;
   }
}