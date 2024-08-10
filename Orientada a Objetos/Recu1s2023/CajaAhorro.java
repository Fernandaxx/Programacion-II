public class CajaAhorro extends CuentaBancaria
{
    private boolean plazoFijo;
    private int tarjetaCredito;
    private Transacciones transacciones [];
    private int posTransaccion=0;
    
    public CajaAhorro(){ 
     }
    
    public CajaAhorro(int tarjetaCredito,int nroCuenta,int CBU,String alias,double dinero,Propietario propietario){
        super(nroCuenta,CBU,alias,dinero,propietario);
        this.transacciones = new Transacciones[2];
        this.tarjetaCredito= tarjetaCredito;
    }
    
    public void agregarTransaccion(Transacciones transaccion){
        if(posTransaccion == 4) { 
            posTransaccion=0;
        }
        transacciones[posTransaccion]=transaccion;
        posTransaccion++;
    }
    
    public double Impuestos(){
        double impuesto=0;;
        if (this.plazoFijo){
            impuesto=getDinero()*0.02;
        }
        if (tarjetaCredito == 1){
            impuesto+=1000;
        }
        if (tarjetaCredito == 2){
            impuesto+=1800;
        }
        for (int i=0; i< transacciones.length; i++){
            if (transacciones[i].getConcepto().equals("DEB.CPRA.VTA")){
                impuesto+= transacciones[i].getMonto()*0.65;
            }
        }
        return impuesto;
        }
    
    public String toString(){
        String aux;
        aux=(super.toString()+"  Tarjetas de credito: "+this.tarjetaCredito);
        for (int i=0; i<transacciones.length; i++){
            aux+=("  Transaccion: "+ transacciones[i].toString() ) ;
        }
        aux+=("  impuestos: "+this.Impuestos());
        return aux;
    }
}
