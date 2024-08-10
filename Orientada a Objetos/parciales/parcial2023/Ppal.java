import java.util.Scanner;
public class Ppal{
    public static void main(String [] args){
        Scanner in = new Scanner(System.in);
        Editorial editorial = new Editorial("LuyFer",20);

        Autor autorCuento = new Autor(44589625,"Lu Fer", "no se sabe");
        Literatura cuento = new Literatura("cuento",false,"jkj456","las aventuras de lu y fer",256,4586,"05/15/2021",autorCuento);

        Autor autorNovela = new Autor(44589625,"Lorenzo Majoros", "Suiza");
        Literatura novela = new Literatura("novela",true,"jkj456","las aventuras de lu y fer",256,4586,"05/18/2021",autorNovela);
        Autor autorPoemario = new Autor (4589625,"Lu Fer", "no se sabe");
        Literatura poemario = new Literatura("poemario",false,"jkj456","las aventuras de lu y fer",256,4586,"05/18/2021",autorPoemario);

        Autor autorDivulgacion = new Autor (4589625,"Lu Fer", "no se sabe");
        Divulgativo divulgacionCientifica = new Divulgativo("divulgacion Cientifica","jkj456","las aventuras de lu y fer",256,4586,"05/18/2021",autorDivulgacion);

        Autor autorBiografia = new Autor (4589625,"Lu Fer", "no se sabe");
        Divulgativo biografia = new Divulgativo("biografia","jkj456","las aventuras de lu y fer",256,4586,"05/18/2021",autorBiografia);

        editorial.agregarLibro(cuento);
        editorial.agregarLibro(novela);
        editorial.agregarLibro(poemario);
        editorial.agregarLibro(divulgacionCientifica);
        editorial.agregarLibro(biografia);
        
        System.out.println("total" + editorial.montoTotal());
        System.out.println(editorial.toString());
    }
}
 