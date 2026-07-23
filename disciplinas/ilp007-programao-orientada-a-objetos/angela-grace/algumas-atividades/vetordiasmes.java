import java.util.Scanner;
public class VetorDiasMes
{
   public static void main (String args[])
   {
   Scanner input = new Scanner(System.in);
   int i;
   int diasMes[] = new int[12];
   
   for (i=0; i<12; i++)
   {
      System.out.printf("digite o numero de dias do %so mes: ",i+1);
      diasMes[i] = input.nextInt();
   }
   System.out.println("Numero de dias do");
   for (i=0; i<12; i++)
       System.out.print(i+1+"o mes: "+diasMes[i] + ", ");
   }


}