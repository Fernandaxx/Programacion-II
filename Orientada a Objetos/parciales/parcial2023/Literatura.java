public class Literatura extends Libro{
    private String genero;
    private boolean deBolsillo;
    
    public Literatura(String genero, boolean deBolsillo,String ISBN,String nombre,int cantPaginas,double precio,String fecha,Autor autor){
        super(ISBN,nombre,cantPaginas,precio,fecha,autor);
        this.genero= genero;
        this.deBolsillo = deBolsillo;
    }
    
    public Literatura(){
        super();
    }
    
    public void CalcularDescuento(){
        int desc=0;
        double valorFinal=super.getPrecio();
        if(this.deBolsillo){
            desc+=15;
        }
        if (this.genero.equals("novela") || this.genero.equals("cuento")){
            desc=desc+5;
        }
        
        valorFinal -= super.getPrecio()*(desc/100);
        super.setPrecio(valorFinal);
    }
    
    public String toString(){
        String aux = super.toString() + " genero " + this.genero;
        return aux;
    }
}