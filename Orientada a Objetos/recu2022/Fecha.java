public class Fecha{
    private int dia;
    private String mes;
    private int año;
    
    public Fecha (int dia, String mes, int año){
        this.dia= dia;
        this.mes= mes;
        this.año= año;
    }
    
    public Fecha(){
        
    }
    
    public int getDia(){
        return dia;
    }
    
    public String getMes(){
        return mes;
    }
    
    public int getAño(){
        return año;
    }
    
    public String toString (){
        return dia+ " de " + mes + " del "+ año;
    }
}