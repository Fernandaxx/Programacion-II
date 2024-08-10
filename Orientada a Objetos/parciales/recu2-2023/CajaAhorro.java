public class CajaAhorro extends CuentaBancaria{
    private boolean plazoFijo;
    private int cantTarjetas;
    private Transaccion [] transacciones;
    private int diml;
    
    public CajaAhorro(boolean plazoFijo , int cantTarjetas,int numCuenta,int cbu, String alias, double dinero, Propietario propietario ){
        super(numCuenta,cbu,alias,dinero,propietario);
        this.transacciones = new Transaccion[5];
        this.diml =0;
        this.cantTarjetas = cantTarjetas;
    }
    
    public CajaAhorro(){
        
    }
    
    public boolean ingresoTransacciones (String concepto, double monto){
        if(this.diml < transacciones.length){
            this.transacciones[diml] = new Transaccion(concepto,monto);
            diml++;
            return true;
        }
        else return false;
    }
    
    public double CalculoCostoMensual(){
        double aux= 0;;
        if (this.plazoFijo){
            aux=super.getDinero() * 0.02;
        }
        if(this.cantTarjetas == 1){
            aux += 1000;
        }
        if(this.cantTarjetas == 2){
            aux+= 1800;
        }
        for(int i=0; i<transacciones.length; i++){
            if(transacciones[i].getConcepto().equals("DEB.CPRA.VTA")){
                aux += this.transacciones[i].getMonto() * 0.65;
            }
        }
        return aux;
    }
    
        public String toString(){
        String aux = super.toString() +"\n"+ "CAJA DE AHORRO"+"\n"+ "Plazo fijo: " + this.plazoFijo + "\n"+ "Cantidad de tarjetas: " + this.cantTarjetas; 
        for (int i = 0; i<this.transacciones.length; i++){
            aux += "\n"+ "Transaccion " + i +  this.transacciones[i].toString();
        }
        return aux;
    }
}
    
    
