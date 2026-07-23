public class ContaPoupanca extends Conta{

    private double taxaJuros = 0.5;

    public ContaPoupanca() { }

    public ContaPoupanca(int numero, String titular, double saldo) {
        super(numero, titular, saldo);
    }

    public void atualizaSaldo(){
        super.setSaldo(getSaldo() + (getSaldo() * taxaJuros));
    }

    @Override
    public String imprime() {
            return "Conta Poupança:" +
                    "\nTitular: "+ super.getTitular() +
                    "\nSaldo: R$"+ super.getSaldo() +
                    "\nTaxa de Juros:" + this.taxaJuros +"%";
    }
}