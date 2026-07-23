import java.util.Scanner;
public class ContaBancaria
{  public static void main (String args[])
   {    Scanner entrada = new Scanner (System.in);
        int ncont=0, d=0, aux=0;
        String num;
        
        do
        {   System.out.println("Digite o numero da conta: ");
            ncont = entrada.nextInt();
            aux = ncont;
        }while (ncont==0);
        
        while(aux!=0)
        {   d +=  aux%10;
            aux = aux/10;
        }
        d = d%10;
        num =  String.format("%06d",ncont);
        System.out.println("Conta: "+num+"-"+d);
    }
}