public class Comunes extends Localidad {
    private String tipo;
    private double costoImpresion;

    public Comunes( String tipo, double costoImpresion,int id, int numButaca, int numFila, String platea, String metodoPago, Comprador comprador){
super(id,numButaca,numFila,platea,metodoPago,comprador);
        this.tipo =tipo;
        this.costoImpresion =costoImpresion;
    }

    public Comunes(){}

    //Getters
    public double getCostoImpresion(){
        return this.costoImpresion;
    }   

    public double montoTotal(){
        double precioBase = PrecioPorFilayPorPlatea.obtenerPrecioBaseEntrada(super.getFila(), super.getPlatea());
        double total = precioBase;
        if(this.tipo.equals("Fisica")){
            total += this.costoImpresion;
        }else if(this.tipo.equals("Digital")){
            total += 2400;}
        if(super.getMetodoPago().equals("Credito")){
            total+= total * 0.08;
        } else if (super.getMetodoPago().equals("Debito")){
            total-= total * 0.025; 
        }
        return total;
    } 

    public String toString (){
        String aux;
        aux = super.toString() +"\n"+ "COMUNES"+"\n"+ "tipo: " + this.tipo + "\n"+ "Costo de impresion : " + this.costoImpresion; 
        return aux;}
}
