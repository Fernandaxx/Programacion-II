public abstract class Libro {
    private String ISBN;
    private String nombre;
    private int cantPaginas;
    private double precio;
    private String fecha;
    private Autor autor;
    
    public Libro(String ISBN,String nombre,int cantPaginas,double precio,String fecha,Autor autor){
        this.ISBN= ISBN;
        this.nombre=nombre;
        this.cantPaginas = cantPaginas;
        this.precio= precio;
        this.fecha= fecha;
        this.autor = autor;
    }
    
    public Libro(){
        
    }
    public double getPrecio(){
        return this.precio;
    }
    public void setPrecio(double precio){
        this.precio = precio;
    }
    public String getFecha(){
        return this.fecha;
    }
    public Autor getAutor(){
        return this.autor;
    }
    public abstract void CalcularDescuento();
    
    public String toString(){
        String aux = "ISBN " + this.ISBN + " precio: " + precio + " fecha " + fecha + " autor" + autor.toString();
        return aux;
    }
}