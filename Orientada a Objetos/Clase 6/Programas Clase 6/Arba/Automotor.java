public class Automotor extends Vehiculo{
    private String patente;
    private double importeAdicional;
    private String descripcion;

    public Automotor (String patente, String descripcion, int año, double importe,Propietario propietario){
        super(año,importe, propietario);
        this.patente= patente;
        this.descripcion = descripcion;
        this.importeAdicional= super.getaño(); // no especifica la relacion entre el año y el importe
    }
    public double CalcularCostoImpuestos(){
        return (super.getImporte() + this.importeAdicional);
    }
    
    }