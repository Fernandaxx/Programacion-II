public class CuentaCorriente extends CuentaBancaria{
    private double limiteDescubierto;
    private int cheques;
    
    public CuentaCorriente(int numCuenta, int cbu, String alias, double dinero, Propietario propietario, double limiteDescubierto, int cheques){
        super(numCuenta, cbu, alias, dinero, propietario);
        this.limiteDescubierto = limiteDescubierto;
        this.cheques = cheques;
    }
    
    public CuentaCorriente(){}
    
    public double impuestos(){
        double aux = 0;
        double din = super.getDinero(); //uso esta variable ya que se utilizara el dinero total de la cuenta en mas de 1 condicion
        if (din>10000){ //ya que las percepciones seran tomadas del dinero si y solo si el dinero en cuenta es mayor a 10000
            aux = din*0.05; //ya que el banco cobrara este impuesto solo por ser este tipo de cuenta
            if (this.cheques >= 10) {
                aux+= din*0.05*this.cheques;
            } else { //no pongo condicion ya que si no es mayor a 10, se confirma que es menor, y en el caso de que sea 0 no se sumara nada al auxiliar
                aux+= din*0.02*this.cheques;
            }
        } else {
            aux = this.limiteDescubierto*0.05; 
            if (this.cheques >= 10) {
                aux+= this.limiteDescubierto*0.05*this.cheques;
            } else { 
                aux+= this.limiteDescubierto*0.02*this.cheques;
            } 
        }
        return aux;
    }
    
    public String toString (){
        return (super.toString() +"\n"+ "CUENTA CORRIENTE " +"\n"+ "Limite descubierto: "+ this.limiteDescubierto + "\n"+ "Cantidad de cheques depositados: " + this.cheques);
    }
}