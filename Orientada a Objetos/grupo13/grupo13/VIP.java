public class VIP extends Localidad {
    private boolean experiencia;
    private double costoExperiencia;
    public VIP(boolean experiencia, double costoExperiencia,int id, int numButaca, int numFila, String platea, String metodoPago, Comprador comprador){
        super(id,numButaca,numFila,platea,metodoPago,comprador);
        this.experiencia =experiencia;
        this.costoExperiencia =costoExperiencia;
    }

    public VIP(){}

    //Getters
    public boolean getExperiencia(){
        return this.experiencia;
    }  

    //Setters

    public double montoTotal(){
        double precioBase = PrecioPorFilayPorPlatea.obtenerPrecioBaseEntrada(super.getFila(), super.getPlatea());
        double total = precioBase;
        
        if(experiencia){
            total+= this.costoExperiencia;}
        if(super.getNumButaca() < 6){
            total+= precioBase*0.15;
        }
        if(super.getMetodoPago().equals("Credito")){
            total+= total * 0.10;
        } else if (super.getMetodoPago().equals("Debito")){
            total-= total * 0.05; 
        }
        return total;
    }  
    
    public String toString (){
        String aux;
        aux = (super.toString() +"\n"+ "VIP"+"\n"+ "Es una experiencia especial : " + this.experiencia + "\n"+ "Costo de la experiencia: " + this.costoExperiencia);
        return aux;
    }
}
