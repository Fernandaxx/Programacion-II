public class CuentaCorriente extends CuentaBancaria
{
    private double limite;
    private int cheques;
    
    public CuentaCorriente(){
    }

    public CuentaCorriente(double limite,int cheques,int nroCuenta,int CBU,String alias,double dinero,Propietario propietario){
        super(nroCuenta,CBU,alias,dinero,propietario);
        this.limite=limite;
        this.cheques=cheques;
    }
    
    public double Impuestos(){
        double total;
        double impuesto;
        if (super.getDinero() > 10000) {
            total=super.getDinero();
        }
        else {total=limite;
        }
        impuesto=total*0.05;
        if (this.cheques > 10){
            impuesto += total*0.005;
        }
        else {impuesto += total*0.002;
        }
        return impuesto;
        }
    
    public String toString(){
        String aux;
        aux=(super.toString()+"  limite: "+this.limite+ " cheques: "+this.cheques);
        aux+=("  impuestos: "+this.Impuestos());
        return aux;
    }
    
}
