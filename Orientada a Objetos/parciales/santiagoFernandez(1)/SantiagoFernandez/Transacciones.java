public class Transacciones{
    private String concepto;
    private double monto;
    
    public Transacciones(String concepto, double monto){
        this.concepto = concepto;
        this.monto = monto;
    }
    
    public Transacciones(){}
    
    public String getConcepto(){
        return this.concepto;
    }
    
    public double getMonto(){
        return this.monto;
    }

    public String toString(){
        return ("\n"+ "Concepto: "+ this.concepto + "\n"+ "Monto: "+ this.monto);
    }
}