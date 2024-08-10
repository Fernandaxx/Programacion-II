public class Multiples extends Compra{
    private int [] numAsiento;
    private int cantEntradas;

    public Multiples (int cantEntradas,int numeroCompra,int categoria,String nombreEstadio,Fecha fecha,double importe){
        super(numeroCompra,categoria,nombreEstadio,fecha,importe);
        this.numAsiento = new int[20];
        this.cantEntradas= cantEntradas;
    }

    public Multiples(){
        
    }

    public boolean entradasCompletas (){
        boolean exito = false;
        if (this.cantEntradas == numAsiento.length){ 
            exito = true;
        }
        return exito;
    }

    public void agregarEntrada(int asiento){
        if (!entradasCompletas()){
            numAsiento[cantEntradas] = asiento;
        }
    }

    public double promocion (){
        double total=0;
        if(this.cantEntradas <= 6 && (super.getNombreEstadio().equals("Internacional Khalifa") || super.getNombreEstadio().equals("Education City"))){
            total = super.getImporte() - (super.getImporte() * 0.075);
        }
        if (this.cantEntradas > 10) {
            if(super.getFecha().getAño() == 2022 ){
                if(super.getFecha().getMes().equals("Noviembre")){
                    if(super.getFecha().getDia() > 20){
                        this.cantEntradas += 1;
                    }
                }
                else 
                if (super.getFecha().getMes().equals("Diciembre")) {
                    if(super.getFecha().getDia() < 2){
                        this.cantEntradas += 1;
                    }
                }
            }
        }
        return total;
    
    }
    
    public String toString(){
        return super.toString() + "importe total" + super.getImporte() * cantEntradas +" Importe con descuento: "+this.promocion();
    }
}