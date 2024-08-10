public class Transacciones
{
    private String concepto;
    private double monto;
    
    public Transacciones(){
    }
    
    public Transacciones(String concepto, double monto){
        this.concepto=concepto;
        this.monto=monto;
    }
    
    public String getConcepto(){
        return this.concepto;
    }
    
    public double getMonto(){
        return this.monto;
    }
    
    public String toString(){
        String aux;
        aux=("concepto: "+this.concepto+" monto: "+this.monto);
        return aux;
    }
}
