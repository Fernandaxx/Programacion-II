public class GasNatural extends Solicitud{
    private int numMedidor;
    private double tamañoHogar;
    private int cantCalefactores;

    public GasNatural(int numMedidor,double tamañoHogar,int cantCalefactores,String numGestion,String fecha,double ingresosMensuales,int cantIntegrantesFam,String region,Persona persona){
        super(numGestion,fecha,ingresosMensuales,cantIntegrantesFam,region,persona);
        this.numMedidor = numMedidor;
        this.tamañoHogar=tamañoHogar;
        this.cantCalefactores =cantCalefactores;
    }

    public GasNatural(){
        super();
    }

    public double getTamañoHogar (){
        return tamañoHogar;
    }

    public double ValorTarifaSubsidiada(){
        if (AccesoSubsidio()){
            if(super.getIngresosMensuales() > 300000){
                return (250*(tamañoHogar/2)+750*cantCalefactores);
            } else if( super.getIngresosMensuales() >  150000){
                return (100*(tamañoHogar/3) + 500*cantCalefactores);
            } else return (super.getIngresosMensuales()*0.02+ 1000);
        }else return super.TarifaPlena();
    }

    public boolean AccesoSubsidio(){
        boolean acceso= false;
        if(super.getIngresosMensuales()/super.getCantIntegrantesFam() + cantCalefactores < super.getIngresosMensuales()*0.4 && 
        TarifasNacionalesPorRegion.puedeAccederAlSubsidio(super.getIngresosMensuales(), super.getRegion())){
            acceso =true;
        }
        return acceso;
    }

    public String toString(){
        return super.toString() + "numero de medidor " + numMedidor + " cantidad de calefactores " + cantCalefactores + "metros cuadrados "+ tamañoHogar;
    }
}
