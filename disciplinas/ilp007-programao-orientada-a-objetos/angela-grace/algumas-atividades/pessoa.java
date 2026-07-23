public class Pessoa
{
   private String nome;
   private String sobrenome;
   private String cpf;
   
   public Pessoa (String n, String s, String ncpf)
   {
      nome = n;
      sobrenome = s;
      cpf = ncpf;
   }
   
   public void setNome (String n)
   {
      nome = n;
   }
   
   public String getNome()
   {
      return nome;
   }
   
   public void setSobrenome (String s)
   {
      sobrenome = s;
   }
   
   public String getSobrenome()
   {
      return sobrenome;
   }
   
   public void setCpf (String ncpf)
   {
      cpf = ncpf;
   }
   
   public String getCpf ()
   {
      return cpf;
   }
}