
public abstract class Vehiculo
{
    private int a�o;
    private double importe;
    private Propietario propietario;
    public Vehiculo(int a�o,double importe,Propietario propietario){
        this.a�o = a�o;
        this.importe= importe;
        this.propietario=propietario;
    }

    public void setPropietario(Propietario propietario){
        this.propietario=propietario;
    }

    public void setA�o(int a�o){
        this.a�o=a�o;
    }

    public void setImporte(double importe){
        this.importe=importe;
    }

    public int geta�o(){
        return a�o;
    }

    public double getImporte(){
        return importe;
    }

    public Propietario getPropietario(){
        return propietario;
    }   

    public abstract double CalcularCostoImpuestos();
}
