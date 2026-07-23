public class Instrutor extends Funcionario
{
   private String disciplina;
   
   public Instrutor(String nome,String email,String disciplina)
   {
      super(nome, email);
      setDisciplina(disciplina);
   }
   
   public void setDisciplina(String disciplina)
   {
      this.disciplina = disciplina;
   }
   
   public String getDisciplina()
   {
      return disciplina;
   }
   
   public String exibeDados()
   {
      return super.exibeDados() +"\nDisciplina: " + getDisciplina();
   }
}