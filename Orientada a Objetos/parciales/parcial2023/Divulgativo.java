public class Divulgativo extends Libro {
    private String tipo;

    public Divulgativo (String tipo,String ISBN, String nombre,int cantPaginas,double precio,String fecha,Autor autor){
        super(ISBN,nombre,cantPaginas,precio,fecha,autor);
        this.tipo=tipo;
    }

    public Divulgativo (){

    }

    public void CalcularDescuento (){
        double desc=0;
        double valorFinal;
        if(super.getFecha().compareTo("03/15/2020") > 0 && super.getFecha().compareTo("12/15/2022") < 0){
            desc+=6.5;
        }
        if(this.tipo.equals("divulgacion cientifica") && super.getAutor().getNacionalidad().equals("argentino/a")){
            desc+=10;
        }
        valorFinal=super.getPrecio()*(desc/100);
        super.setPrecio(valorFinal);
    }
    
    public String toString(){
        String aux = super.toString() + " tipo " + this.tipo;
        return aux;
    }
}