public class Simple extends Compra{
    private int dni;
    private String nombreApellido;
    private int numeroAsiento;
    
    public Simple (int dni, String nombreApellido, int numeroAsiento,int numeroCompra,int categoria,String nombreEstadio,Fecha fecha,double importe){
        super(numeroCompra,categoria,nombreEstadio,fecha,importe);
        this.dni= dni;
        this.nombreApellido =nombreApellido;
        this.numeroAsiento = numeroAsiento;
    }
    
    public Simple(){
        
    }
    
    public double promocion (){
        double total=0;
        if (super.getNombreEstadio().equals("Lusail") && super.getCategoria() == 4){
            total = super.getImporte() - (super.getImporte() * 0.01);
        }
        return total;
    }
    
    public void Promocion(){
        double importe= super.getImporte();
        if(super.getNombreDelEstadio().equals("Lusail") && super.getCategoria() == 4){
            double descuento= (importe *10)/100;
            importe-= descuento;
            super.setImporte(importe);
        }
    }
    
      public String toString(){
        String x= "DNI: "+dni+"\n Nombre y apellido: "+nombreApellido+ "\n Numero de Asiento: "+ numeroAsiento;
        return x;
    }
}