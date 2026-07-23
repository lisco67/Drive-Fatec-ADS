import java.util.Scanner;
public class Caixa
{  public static void main (String args[])
   {    Scanner entrada = new Scanner (System.in);
        double v, t, s=0;
        int x;
        do 
        {   System.out.println("Digite o valor da compra em Reais: ");
            v = entrada.nextDouble();
            System.out.println("Deseja entrar com um novo valor? sim(digite 1), nao(digite qualquer tecla)");
            x = entrada.nextInt();
            s = s + v;
        }while(x==1);
      
        System.out.println("Valor Total da compra em Reais: "+s);
        if (s<=50)
        {   t = s-(s*0.05);
            System.out.println("Valor total a pagar com 5% de desconto: "+t);
        }
        else if (s<=100)
        {   t = s-(s*0.1);
            System.out.println("Valor total a pagar com 10% de desconto: "+t);
        }
        else if (s<=200)
        {   t = s-(s*0.15);
            System.out.println("Valor total a pagar com 15% de desconto: "+t);
        }
        else
        {   t = s-(s*0.2);
            System.out.println("Valor total a pagar com 20% de desconto: "+t);
        }
    }
}