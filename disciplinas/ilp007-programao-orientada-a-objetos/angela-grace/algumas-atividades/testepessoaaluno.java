import javax.swing.JOptionPane;
import java.util.Scanner;

public class TestePessoaAluno 
{
   public static void main( String args[] ) 
   {
    Scanner dado = new Scanner(System.in);
    int curso;
    System.out.print("Digite o codigo do curso, sendo: \n1 - Direito\n2 - Medicina\n3 - TI\n4 - Engenharia\n");
    curso  = dado.nextInt();
    
    String str;
    Aluno al = new Aluno( "Lucas", "Marques", "12345689712",curso);      
      
    str = al.getCurso();
           
    JOptionPane.showMessageDialog(null, str);
    System.exit( 0 );
   }
}
