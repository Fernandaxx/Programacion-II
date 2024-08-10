public class Embarcaciones extends Vehiculo{
    private int REY;
    private String nombre;
    private String tipo;
    private double eslora;
    private double tonelaje;
    private int valor;

    public Embarcaciones(int REY,String nombre,String tipo,double eslora,double tonelaje,int valor,int año,double importe,Propietario propietario){
        super(año,importe,propietario);
        this.REY=REY;
        this.nombre = nombre;
        this.tipo=tipo;
        this.eslora =eslora;
        this.tonelaje =tonelaje;
        this.valor =valor;
    }

    public double CalcularCostoImpuestos(){
        if(valor > 180000){
            return valor*0.05;
        }else if(valor > 6000){
            return valor*0.02;
        }else return valor*0.04;
    }
}

