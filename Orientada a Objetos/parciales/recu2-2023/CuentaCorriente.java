public class CuentaCorriente extends CuentaBancaria{
    private double limite;
    private int cantCheques;

    public CuentaCorriente(double limite,int cantCheques,int numCuenta,int cbu, String alias, double dinero, Propietario propietario ){
        super(numCuenta,cbu,alias,dinero,propietario);
        this.limite = limite;
        this.cantCheques = cantCheques;
    }

    public CuentaCorriente(){

    }

    public double CalculoCostoMensual(){
        double din= super.getDinero();
        double aux;
        if(din > 10000){
            aux=din*0.05;
            if(this.cantCheques > 10){
                aux+= this.cantCheques* din * 0.005;
            }
            else aux+= this.cantCheques *din * 0.02;
        }
        else {
            aux = this.limite*0.05;
            if(this.cantCheques > 10){
                aux+= this.cantCheques* this.limite * 0.005;
            }
            else aux+= this.cantCheques *this.limite * 0.02;
        }
        return aux;
    }

    public String toString(){
        String aux=  super.toString() +"\n"+ "CUENTA CORRIENTE " +"\n"+ "Limite descubierto: "+ this.limite + "\n"+ "Cantidad de cheques depositados: " + this.cantCheques;
        return aux;
    }
}
