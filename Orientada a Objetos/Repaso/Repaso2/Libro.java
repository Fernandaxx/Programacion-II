public class Libro extends Ejemplar{

    private String titulo;
    private int capitulos;
    private boolean bolsillo;

    public Libro (String titulo,int capitulos, boolean bolsillo,int codigo, int paginas,String resumen ,int anio, Responsable editor){
        super (codigo,paginas,resumen,anio,editor);
        this.titulo=titulo;
        this.capitulos=capitulos;
        this.bolsillo=bolsillo;
    }

    public Libro(){

    }

    public String getTitulo (){
        return titulo;
    }

    public int getCapitulos (){
        return capitulos;
    }

    public boolean getBolsillo (){
        return bolsillo;
    }

    public void setTitulo(String tiutlo){
        this.titulo = titulo;
    }

    public void setCapitulos(int capitulos){
        this.capitulos = capitulos;
    }

    public void setBolsillo(boolean bolsillo){
        this.bolsillo = bolsillo;
    }
    
    public String toString(){
        return "codigo del libro " + super.getCodigoId() + " titulo " + titulo + "responsable " + getResponsable().toString()
    }
}