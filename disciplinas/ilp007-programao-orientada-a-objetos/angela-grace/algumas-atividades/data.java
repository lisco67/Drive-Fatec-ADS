public class Data
{
   private int mes, dia, ano;
   public Data (int d, int m, int a)
   {
      setData(d, m, a);
   }
   
   // construtor com mês e ano
	public Data (int m, int a)
	{
		setData(1, m, a);
	}

	// construtor com apenas ano
	public Data (int a)
	{
		setData(1, 1, a);
	}
   
   // método público – obtém dia
   public int getDia ()
	{
		return dia;
	}
   
	// método público – obtém mês
   public int getMes ()
	{
		return mes;
	}
	
   // método público – obtém ano
   public int getAno ()
	{
		return ano;
	}


   public void setData(int d, int m, int a)
   {  
      if (m > 0 && m <=12)
      mes = m;
      else
      {  mes = 1;
         System.out.println("Mes "+ m +" invalido. Configurado mes = 1.");
      }
      ano = a;
      dia = checkDia (d);
   }
   
   public boolean bissexto ()
   {
      if (ano%4 == 0 || ano%400== 0 && ano%100 != 0)
         return true;
      else
         return false;
   } 
   
   private int checkDia (int diaTeste)
   {  
      int diasMes[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
      if (diaTeste > 0 && diaTeste <= diasMes[mes] && diasMes[mes]!=2)
         return diaTeste;
      else if(diaTeste<=29 && mes==2 && bissexto()==true)
         return diaTeste; 
      else if(diaTeste==28 && mes==2 && bissexto()==false)
         return diaTeste;
      else
      {  System.out.println("Dia "+ diaTeste +" invalido. Configurado dia=1");
         return 1;
      }
   }
   
   public String toString()
   {
      return dia + "/" + mes + "/" + ano;
   }
}