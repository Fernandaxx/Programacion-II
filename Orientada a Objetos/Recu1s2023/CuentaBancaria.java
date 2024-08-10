public abstract class CuentaBancaria
{
    private int nroCuenta;
    private int CBU;
    private String alias;
    private double dinero;
    private Propietario propietario;
    
    public CuentaBancaria()
    {       
    }
    
    public CuentaBancaria(int nroCuenta,int CBU,String alias,double dinero,Propietario propietario){
        this.nroCuenta = nroCuenta;
        this.CBU=CBU;
        this.alias=alias;
        this.dinero=dinero;
        this.propietario=propietario;
     }
    
    public double getDinero(){
        return this.dinero;
    }
     
    public String toString(){
        String aux;
        aux=("Nro cuenta: "+this.nroCuenta +"  CBU: " +this.CBU);
        return aux;
    }
    
    public abstract double Impuestos();
}