public class Automotor extends Vehiculo{
    private String patente;
    private double importeAdicional;
    private String descripcion;

    public Automotor (String patente, String descripcion, int a�o, double importe,Propietario propietario){
        super(a�o,importe, propietario);
        this.patente= patente;
        this.descripcion = descripcion;
        this.importeAdicional= super.geta�o(); // no especifica la relacion entre el a�o y el importe
    }
    public double CalcularCostoImpuestos(){
        return (super.getImporte() + this.importeAdicional);
    }
    
    }