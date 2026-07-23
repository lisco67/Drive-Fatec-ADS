public class Programador extends Funcionario
{
   private String linguagem, sistOper;
   
   public Programador(String nome,String email,String linguagem)
   {
      super(nome, email);
      setLinguagem(linguagem);
   }
   
   public void setLinguagem(String linguagem)
   {
      this.linguagem = linguagem;
   }
   
   public String getLinguagem()
   {
      return linguagem;
   }
   
   public void setSO (String sistOper)
   {
      this.sistOper = sistOper;
   }

   public String getSO()
   {
      return sistOper;
   }
   
   public String exibeDados()
   {
      return super.exibeDados()+"\nLinguagem : " + getLinguagem();
   }
}