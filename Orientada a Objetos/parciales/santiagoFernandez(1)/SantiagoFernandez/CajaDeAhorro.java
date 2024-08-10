public class CajaDeAhorro extends CuentaBancaria {
    private boolean plazoFijo;
    private int tarjetas;
    private Transacciones [] transacciones;
    private int dimF;
    private int dimL;
    public CajaDeAhorro(int numCuenta, int cbu, String alias, double dinero, Propietario propietario, boolean plazoFijo, int tarjetas){
        super(numCuenta, cbu, alias, dinero, propietario);
        this.plazoFijo = plazoFijo;
        this.tarjetas = tarjetas;
        this.dimF = 5; //ya que me pide que ingrese las ultimas 5 transacciones
        this.dimL = 0;
        this.transacciones= new Transacciones [dimF];
    }
    
    public CajaDeAhorro(){}
    
    public boolean ingresoTransacciones(String concepto, double monto){ //este modulo retornara falso cuando la dimL sea igual a la dimF y por ende ya no se puedan cargar transacciones
        if (this.dimL < this.dimF) {
            this.transacciones[dimL] = new Transacciones (concepto,monto);
            dimL++;
            return true;
        } else return false;
    }
    
    public double impuestos() {
        double aux = 0; //en esta variable voy a ir acumulando el valor del impuesto final
        if (this.plazoFijo) {
            aux = super.getDinero() * 0.02;
        }
        if (this.tarjetas>0){ //primero me aseguro que la cantidad de tarjetas sea mayor a 0 para no entrar al case sin sentido
            switch (this.tarjetas) {
                case 1: aux += 1000;
                        break;
                case 2: aux += 1800;
                        break;
            }
        }
        for (int i = 0; i<this.dimF; i++) {
            if (this.transacciones[i].getConcepto().equals("DEB.CPRA.VTA")){
                aux += this.transacciones[i].getMonto()*0.65; //sumo los porcentajes del impuesto PAIS y ganancias 
            }
        }
        return aux;
    }
    
    public String toString (){
        String aux;
        aux = (super.toString() +"\n"+ "CAJA DE AHORRO"+"\n"+ "Plazo fijo: " + this.plazoFijo + "\n"+ "Cantidad de tarjetas: " + this.tarjetas); 
        for (int i = 0; i<this.transacciones.length; i++){
            aux += "\n"+ "Transaccion " + i +  this.transacciones[i].toString();
        }
        return aux;
    }
}