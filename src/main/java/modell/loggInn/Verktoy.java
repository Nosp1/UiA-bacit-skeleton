package modell.loggInn;

public class Verktoy {
    private int ID;
    private String bildePath;
    private String navn;
    private int kostnad;
    private int maksDager;
    private boolean gratis;
    private boolean tilgjengelig;


    public Verktoy(int ID, String bildePath, String navn, int kostnad, int maksDager, boolean gratis, boolean tilgjengelig) {
        this.ID = ID;
        this.bildePath = bildePath;
        this.navn = navn;
        this.kostnad = kostnad;
        this.maksDager = maksDager;
        this.gratis = gratis;
        this.tilgjengelig = tilgjengelig;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getBildePath() {
        return bildePath;
    }

    public void setBildePath(String bildePath) {
        this.bildePath = bildePath;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public int getKostnad() {
        return kostnad;
    }

    public void setKostnad(int kostnad) {
        this.kostnad = kostnad;
    }

    public int getMaksDager() {
        return maksDager;
    }

    public void setMaksDager(int maksDager) {
        this.maksDager = maksDager;
    }

    public boolean isGratis() {
        return gratis;
    }

    public void setGratis(boolean gratis) {
        this.gratis = gratis;
    }

    public boolean isTilgjengelig() {
        return tilgjengelig;
    }

    public void setTilgjengelig(boolean tilgjengelig) {
        this.tilgjengelig = tilgjengelig;
    }
}
