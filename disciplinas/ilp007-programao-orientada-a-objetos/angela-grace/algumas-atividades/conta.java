public abstract class Conta {

    private int numero;
    private String titular;
    private double saldo;

    public Conta() {}

    public Conta(int numero, String titular, double saldo) {
        this.numero = numero;
        this.titular = titular;
        this.saldo = saldo;
    }

    public void saque(double x) {
        if (this.saldo >= x)
            this.saldo -= x;
    }

    public void deposito(double x) {
        this.saldo += x;
    }

    public abstract String imprime();

    public String getTitular() {
        return titular;
    }

    public void setTitular(String t) {
        this.titular = t;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double s) {
        this.saldo = s;
    }
}