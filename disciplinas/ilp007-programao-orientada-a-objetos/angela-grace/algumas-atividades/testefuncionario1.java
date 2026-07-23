import java.util.Scanner;
public class TesteFuncionario1
{
   public static void main (String args[])
   {
      
      Programador f1 = new Programador("Joao Silva","joaosilva234@gmail.com","PHYTON");
      Programador f2 = new Programador("Joao Silva","joaosilva234@gmail.com","PHYTON");
      Programador f3 = new Programador("Joao Silva","joaosilva234@gmail.com","PHYTON");
      Programador f4 = new Programador("Joao Silva","joaosilva234@gmail.com","PHYTON");
      Instrutor f5 = new Instrutor("Carlos Menezes","menezescarlosprof@gmail.com","ILP7");
      int i;
     
      Funcionario func[] = {f1,f2,f3,f4,f5};
      
      for(i=0;i<6;i++)
         System.out.println(func[i].exibeDados());
 
   }
}