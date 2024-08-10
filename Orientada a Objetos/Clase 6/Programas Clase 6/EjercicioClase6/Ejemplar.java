public abstract class Ejemplar{
    private int codigo;
    private int paginas;
    private String resumen;
    private int anio;
    private Responsable editor;
    
    public Ejemplar (int codigo, int paginas,String resumen ,int anio, Responsable editor){
        this.codigo=codigo;
        this.paginas=paginas;
        this.resumen = resumen;
        this.anio=anio;
        this.editor = editor;
    }
    
    public Ejemplar(){

    }
        
    public int getCodigo (){
        return codigo;
    }
    
    public int getPaginas (){
        return paginas;
    }
    
    public String getResumen (){
        return resumen;
    }
    
    public int getAnio(){
        return anio;
    }
    
    public void setCodigo(int codigo){
        this.codigo = codigo;
    }
    
    public void setPaginas(int paginas){
        this.paginas = paginas;
    }
    
    public void setResumen(String resumen){
        this.resumen = resumen;
    }
    
    public void setAnio(int anio){
        this.anio=anio;
    }
    
    public void setEditor(Responsable editor){
        this.editor = editor;
    }
    
    public Responsable getEditor(){
        return editor;
    }
    
    public  void Publicar(){
        anio=2023;
    }
}