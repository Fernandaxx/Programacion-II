public abstract   class Ejemplar {
    private int codigoId;
    private int cantPaginas;
    private String resumen;
    private int añoPublicacion;
    private Responsable responsable;
    
    public Ejemplar(int codigoId, int cantPaginas, String resumen,int añoPublicacion , Responsable responsable){
        this.codigoId = codigoId;
        this.cantPaginas =cantPaginas;
        this.resumen = resumen;
        this.añoPublicacion = añoPublicacion;
        this.responsable = responsable;
    }
    
    public Ejemplar(){
        
    }
    
       
    public int getCodigoId (){
        return this.codigoId;
    }
    
    public int getCantPaginas (){
        return this.cantPaginas;
    }
    
    public String getResumen (){
        return this.resumen;
    }
    
    public int getAñoPublicacion(){
        return this.añoPublicacion;
    }
    
      public Responsable getResponsable(){
        return this.responsable;
    }
    
    public void setCodigoID(int codigoId){
        this.codigoId = codigoId;
    }
    
    public void setCantPaginas(int cantPaginas){
        this.cantPaginas = cantPaginas;
    }
    
    public void setResumen(String resumen){
        this.resumen = resumen;
    }
    
    public void setAñoPublicacion(int añoPublicacion){
        this.añoPublicacion = añoPublicacion;
    }
    
    public void setResponsable(Responsable responsable){
        this.responsable = responsable;
    }
    
    public String toString(){
        return 
    }
    
}