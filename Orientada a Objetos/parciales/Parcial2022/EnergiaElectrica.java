public class EnergiaElectrica extends Solicitud{
    private int NIS;
    private int cantElectrodomesticos;

    public EnergiaElectrica(int NIS, int cantElectrodomesticos,String numGestion,String fecha,double ingresosMensuales,int cantIntegrantesFam,String region,Persona persona){
        super(numGestion,fecha,ingresosMensuales,cantIntegrantesFam,region,persona);
        this.NIS=NIS;
        this.cantElectrodomesticos=cantElectrodomesticos;
    }

    public EnergiaElectrica(){
        super();
    }

    public double ValorTarifaSubsidiada(){
        if (AccesoSubsidio()){
        if(super.getIngresosMensuales() > 300000){
            return (500*cantElectrodomesticos);
        } else if( super.getIngresosMensuales() >  150000){
            return (100*(cantElectrodomesticos/2)+ super.getIngresosMensuales() * 0.02) ;
        } else return (super.getIngresosMensuales()*0.015+400*super.getCantIntegrantesFam());
    }else return super.TarifaPlena();
}

    public boolean AccesoSubsidio(){
        boolean acceso= false;
        if(super.getIngresosMensuales() / super.getCantIntegrantesFam() <= super.getIngresosMensuales()* 0.45 && 
        TarifasNacionalesPorRegion.puedeAccederAlSubsidio(super.getIngresosMensuales(), super.getRegion())){
            acceso =true;
        }
        return acceso;
    }
    
    public String toString (){
        return super.toString() + "numero de identificacion de Suministro " + NIS + "Cantidad de electrodomesticos " + cantElectrodomesticos;
    }
}