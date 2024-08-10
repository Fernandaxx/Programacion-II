public abstract class CuentaBancaria{
    private int numCuenta;
    private int cbu;
    private String alias;
    private double dinero;
    private Propietario propietario;
    
    public CuentaBancaria(int numCuenta, int cbu, String alias, double dinero, Propietario propietario){
        this.numCuenta = numCuenta;
        this.cbu = cbu;
        this.alias = alias;
        this.dinero = dinero;
        this.propietario = propietario;
    }
    
    public CuentaBancaria(){}
    
    public double getDinero(){
        return this.dinero;
    }    
    
    public abstract double impuestos();
    
    public String toString(){
        return (this.propietario.toString() + "\n"+ "Numero de Cuenta: "+ this.numCuenta +"\n" + "CBU: " + this.cbu +"\n"+ "Alias: " + this.alias +"\n"+ "Dinero en cuenta: "+ this.dinero);
    }
}