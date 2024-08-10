public abstract class Solicitud{
    private String numGestion;
    private String fecha;
    private double ingresosMensuales;
    private int cantIntegrantesFam;
    private String region;
    private Persona persona;

    public Solicitud(String numGestion,String fecha,double ingresosMensuales,int cantIntegrantesFam,String region,Persona persona){
        this.numGestion=numGestion;
        this.fecha=fecha;
        this.ingresosMensuales=ingresosMensuales;
        this.cantIntegrantesFam= cantIntegrantesFam;
        this.region=region;
        this.persona= persona;
    }

    public Solicitud(){

    }

    public double getIngresosMensuales(){
        return ingresosMensuales;
    }

    public int getCantIntegrantesFam(){
        return cantIntegrantesFam;
    }
    
    public String getRegion(){
        return region;
    }
    public double TarifaPlena(){
        return ingresosMensuales*0.05;
    }
    public abstract double ValorTarifaSubsidiada();

    public abstract boolean AccesoSubsidio();
    
    public String toString(){
        return "numero de Gestion: " + numGestion+" fecha: " +fecha+
        " ingresos mensuales " +ingresosMensuales+ " Cantidad de integrantes del grupo familiar: " 
        +cantIntegrantesFam+  " region " + persona.toString();
    }
}