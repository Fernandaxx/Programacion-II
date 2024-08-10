public abstract class Localidad {
    private int id;
    private int numButaca;
    private int numFila;
    private String platea;
    private String metodoPago;
    private Comprador comprador;
    
    public Localidad(int id, int numButaca, int numFila, String platea, String metodoPago, Comprador comprador){
        this.id = id;
        this.numButaca = numButaca;
        this.numFila = numFila;
        this.metodoPago = metodoPago;
        this.comprador = comprador;
    }
    
    public Localidad(){}
    
    public String getMetodoPago(){
        return this.metodoPago;
    }   
    
    public int getNumButaca(){
        return this.numButaca;
    }  
    
    public int getFila(){
        return this.numFila;
    }  
    
    public String getPlatea(){
        return this.platea;
    }  
    
    public abstract double montoTotal();
    
    public String toString(){
        return ("Localidad"+"\n"+"id: "+ this.id + "\n"+ "numero butaca:" + this.numButaca +"\n"+ "numero fila: " + this.numFila+ "numero platea: " + this.platea+ "metodo de pago: " + this.metodoPago + comprador.toString()); 
    }
}