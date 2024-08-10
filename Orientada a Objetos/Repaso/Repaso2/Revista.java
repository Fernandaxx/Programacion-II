public class Revista extends Ejemplar{

    private String nombre;
    private int volumen = 0;
    private int articulos;

    public Revista (String nombre, int articulos,int codigo,int paginas,String resumen ,int anio, Responsable editor){
        super (codigo,paginas,resumen,anio,editor);
        this.nombre=nombre;
        this.articulos=articulos;
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
        return "nombre de la revista" + nombre + " volumen " + volumen;
    }

}