import java.util.Scanner;

class AplicacaoConta 
{  
	public static void main(String args[])
	{   
		double saque, deposito;
      int x;
		
      Scanner entrada = new Scanner(System.in);  

		Conta cont = new Conta();
      cont.setSaldo(0);
      
      System.out.println("Conta Bancaria - opcoes: "); 
      System.out.println("Digite 1 para consultar saldo.");
      System.out.println("Digite 2 para fazer um deposito.");
      System.out.println("Digite 3 para fazer um saque.");
      System.out.println("Digite 4 sair.");
      x = entrada.nextInt();
      
      while(x!=4)
      {  switch(x)
         {  case 1: System.out.printf( "Saldo atual: %.2f\n\n", cont.getSaldo() );
               break;
            case 2: System.out.print("Digite o valor do deposito.. ");  
   	         deposito = entrada.nextDouble();  
   		      cont.deposito( deposito );
               System.out.printf( "Saldo atual: %.2f\n\n", cont.getSaldo() );
               break;
            case 3: System.out.print("Digite o valor do saque: ");  
   		      saque = entrada.nextDouble();
               if(saque>cont.getSaldo())
                   System.out.println("Saldo insuficiente");
               else
   		         cont.saque( saque );
               System.out.printf( "Saldo atual: %.2f\n\n", cont.getSaldo() );
               break;
         }
         System.out.println("Conta Bancaria - opcoes: "); 
         System.out.println("Digite 1 para consultar saldo.");
         System.out.println("Digite 2 para fazer um deposito.");
         System.out.println("Digite 3 para fazer um saque.");
         System.out.println("Digite 4 sair.");
         x = entrada.nextInt();
      }
	}  
}