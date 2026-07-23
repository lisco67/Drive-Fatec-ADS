public class ContaEmpresa extends Conta{

    private double limiteEmprestimo = 20000.0;

    public ContaEmpresa() { }

    public ContaEmpresa(int numero, String titular, double saldo) {
        super(numero, titular, saldo);
    }

    public boolean emprestimo(double x) {
        if (x <= limiteEmprestimo && x > 0){
            super.setSaldo(super.getSaldo() + x);
            return true;
        }
        return false;
    }

    @Override
    public String imprime() {
        return "Conta Poupança:" +
                "\nTitular: "+ super.getTitular() +
                "\nSaldo: R$"+ super.getSaldo() +
                "\nLimite de empréstimo: R$" + this.limiteEmprestimo;
    }
}