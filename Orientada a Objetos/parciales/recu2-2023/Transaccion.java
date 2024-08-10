public class Transaccion{
    private String concepto;
    private double monto;
    
    public Transaccion(String concepto, double monto){
        this.concepto = concepto;
        this.monto = monto;
    }
    
    public Transaccion (){
        
    }
    public String getConcepto(){
        return this.concepto;
    }
    public double getMonto(){
        return this.monto;
    }
    public String toString(){
        String aux = "\n"+ "Concepto: "+ this.concepto + "\n"+ "Monto: "+ this.monto;
        return aux;
    }
}