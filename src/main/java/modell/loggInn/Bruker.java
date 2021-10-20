package modell.loggInn;
//Her har vi laget en modell klasse for Ansatt

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    public Bruker (int id, String navn, String email, String telefon, String passord,
                   boolean sertifisert, boolean union){
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
        Connection con ;
        //Lager en Bruker DB med en tilkobling til DB
        public BrukerDB(Connection con) {
            this.con = con;
        }

        //Metode for å registrere ny bruker
        public boolean registrerBruker(Bruker bruker){
            boolean bool = false;
            try{
                //Her lager vi en spørring
                String query = "INSERT INTO Brukere(Epost,Passord,Rettigheter) VALUES(?,?,?)";
                //Pst er en måte å samle inn informasjon til query
                PreparedStatement pst = this.con.prepareStatement(query);
                //Vi setter string til query med data fra bruker modell metodene
                pst.setString(1, bruker.getEpost());
                pst.setString(2, bruker.getPassord());
                pst.setString(3, bruker.getRettigheter());
                //Vi kjører så SQL query en
                pst.executeUpdate();
                //Ved suksess får man en bool = true slik vi kan vite det har fungert
                bool = true;
            }catch(Exception e){
                e.printStackTrace();
            }
            //Om det har oppstått en feil vil man få false bool
            return bool;
        }

        //Dette er metoden web app bruker for å logge inn en bruker, sjekker opp mot epost og passord i DB
        public Bruker logBruker(String epost, String passord){
            //Lager en tom brukermodell for å kunne utnytte metodene senere
            Bruker bruker=null;
            try{
                //Setter opp en spørring for å få ut resultater fra DB i hendhold til gitte parametre
                String query ="SELECT * FROM Brukere WHERE Epost=? AND Passord=?";
                //Vi har så en PreperedStatement som håndterer spørringens knyttning til DB
                PreparedStatement pt = this.con.prepareStatement(query);
                //Under setter finner man våre to parametere og setter dem ved hjelp fra pt
                pt.setString(1, epost);
                pt.setString(2, passord);
                //Her utnytter vi ResultSet som lar oss holde og utføre handlinger med resultatene
                ResultSet rs = pt.executeQuery();

                if(rs.next()){
                    //Denne if setningen gjelder så lenge som det er mer å hente fra rs
                    //Vi lager en ny tom bruker modell, som vi så fyller ut med de underliggende kolonnene.
                    bruker = new Bruker();
                    bruker.setId(rs.getInt("BrukerID"));
                    bruker.setEpost(rs.getString("Epost"));
                    bruker.setPassord(rs.getString("Passord"));
                    bruker.setRettigheter(rs.getString("Rettigheter"));

                }

            }catch(Exception e){
                e.printStackTrace();
            }
            //Tilslutt returneres en bruker modell. Denne representerere en bruker som kan logge inn
            return bruker;
        }

    }
}