public class Revista extends Ejemplar{
    
    private String nombre;
    private int volumen;
    private int articulos;
    
    public Revista (int codigo,int paginas,String resumen ,int anio, Responsable editor,String nombre, int articulos){
        super (codigo,paginas,resumen,anio,editor);
        this.nombre=nombre;
        this.articulos=articulos;
        //this.volumen = volumen;
    }
    
    public Revista(){
        
    }
    
    public String getNombre (){
        return nombre;
    }
    
    public int getVolumen (){
        return volumen;
    }
    
    public int getArticulos (){
        return articulos;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void PublicarRevista(){
        super.Publicar();
        this.volumen=Generador.getNroVolumen();
    }
    
    public void setVolumen(int volumen){
        this.volumen= volumen;
    }
    
    public void setArticulos(int articulos){
        this.articulos = articulos;
    }
    
    public String toString(){
        String aux;
        aux= "Nombre: "+ this.nombre + " volumen: " + this.volumen;
        return aux;
    }
    
  
}