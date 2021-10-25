package modell.loggInn;
//Her har vi laget en modell klasse for Ansatt

import java.sql.Connection;

public class Bruker {
        int id;
        String navn;
        String email;
        String telefon;
        String passord;
        boolean sertifisert;
        boolean union;

    public Bruker(){
    }

    public Bruker(int id, String navn, String email, String telefon, String passord,
                   boolean sertifisert, boolean union) {
        this.id = id;
        this.navn = navn;
        this.email = email;
        this.telefon = telefon;
        this.passord = passord;
        this.sertifisert = sertifisert;
        this.union = union;
    }

    //gettere og settere

    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }

    public String getNavn(){
        return navn;
    }
    public void setNavn(String navn){
        this.navn = navn;
    }

    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }

    public String getTelefon(){
        return telefon;
    }
    public void setTelefon(String telefon){
        this.telefon = telefon;
    }

    public String getPassord(){
        return passord;
    }
    public void setPassord(String passord){
        this.passord = passord;
    }

    public boolean getSertifisert(){
        return sertifisert;
    }
    public void setSertifisert(boolean sertifisert){
        this.sertifisert = sertifisert;
    }

    public boolean getUnion(){
        return union;
    }
    public void setUniont(){
        this.union = union;
    }


    public static class BrukerDB {
        //Con er for tilknyttning til DB
        Connection con;

        //Lager en Bruker DB med en tilkobling til DB
        public BrukerDB(Connection con) {
            this.con = con;
        }

    }
}