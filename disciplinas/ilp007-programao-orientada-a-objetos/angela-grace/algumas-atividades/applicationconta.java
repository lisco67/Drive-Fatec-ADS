import java.util.Scanner;

public class ApplicationConta {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        do {

            System.out.println("Criando uma conta...");

            System.out.println("Digite o número da conta:");
            int num = input.nextInt();

            input.nextLine();
            System.out.println("Digite o nome do titular da conta:");
            String titular = input.nextLine();

            System.out.println("Digite seu saldo inicial:");
            double saldo = input.nextDouble();

            System.out.println("Você está abrindo uma conta Poupança (P) ou Empresa (E)?");
            String tipoConta = input.next();

            if (tipoConta.toUpperCase().equals("P")) {

                ContaPoupanca contaPoupanca = new ContaPoupanca(num, titular, saldo);

                contaPoupanca.deposito(150);
                contaPoupanca.saque(50);
                System.out.println("\n<<Conta antes do rendimento>>\n" + contaPoupanca.imprime());
                contaPoupanca.atualizaSaldo();
                System.out.println("\n<<Conta depois do rendimento>>\n" + contaPoupanca.imprime());

            } else if (tipoConta.toUpperCase().equals("E")) {

                ContaEmpresa contaEmpresa = new ContaEmpresa(num, titular, saldo);

                contaEmpresa.deposito(1000);
                contaEmpresa.saque(250);
                System.out.println("\n<<Conta antes de pegar empréstimo>>\n" + contaEmpresa.imprime());
                System.out.println(contaEmpresa.emprestimo(500.0) ? "Empréstimo aprovado!" : "Empréstimo negado!");
                System.out.println("\n<<Conta depois de pegar empréstimo>>\n" + contaEmpresa.imprime());
            }

            System.out.println("\nDeseja criar uma nova conta? (S/N)");
            String repetir = input.next();

            if (repetir.toUpperCase().equals("N") || !repetir.toUpperCase().equals("S"))
                break;

        }while(true);

    }

}