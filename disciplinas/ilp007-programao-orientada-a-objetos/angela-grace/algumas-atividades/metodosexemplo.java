public class MetodosExemplo
{
	public static void main(String[] args) 
	
	{
	    //Metodo charAt: retorna apenas um caractere em determinada posição de uma String
		String valor = "String teste";
        System.out.println(valor.charAt(3));
        
        //Metodo compareTo: comparação de duas Strings
        System.out.println(valor.compareTo("String teste") == 0 ? true : false);
        System.out.println(valor.compareTo("String teste2") == 0 ? true : false);
        System.out.println(valor.compareToIgnoreCase ("STRING TESTE") == 0 ? true : false);
        
        //método endsWith verifica se a String termina com o valor especificado 
        //e o startsWith verifica se a String começa com o valor especificado
        System.out.println(valor.endsWith("teste"));
        System.out.println(valor.startsWith("Str"));
        System.out.println(valor.startsWith("ing", 3));

	}
}