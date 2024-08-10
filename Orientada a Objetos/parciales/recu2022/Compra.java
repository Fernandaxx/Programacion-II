public abstract class Compra{
    private int numeroCompra;
    private int categoria;
    private String nombreEstadio;
    private Fecha fecha;
    private double importe;
    
    public Compra ( int numeroCompra,int categoria,String nombreEstadio,Fecha fecha,double importe){
        this.numeroCompra = numeroCompra;
        this.categoria= categoria;
        this.nombreEstadio =nombreEstadio;
        this.fecha= fecha;
        this.importe=importe;
    }
    
    public Compra(){
        
    }
    
    public String getNombreEstadio (){
        return this.nombreEstadio;
    }
    
    public int getCategoria(){
        return this.categoria;
    }
    
    public double getImporte(){
        return this.importe;
    }
    
    public Fecha getFecha(){
        return fecha;
    }
    
    public void setImporte(double importe){
        this.importe = importe;
    }
    
    public String toString(){
        String x= "Numero de compra: "+numeroCompra+"\n Categoria: "+ categoria+"\n Nombre del estadio: "+ nombreEstadio+"\n"+ fecha.toString()+"\n Importe: "+importe;
        return x;
    }
    public abstract double promocion ();
    
}