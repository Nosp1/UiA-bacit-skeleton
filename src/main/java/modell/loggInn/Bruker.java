package modell.loggInn;
//Her har vi laget en modell klasse for Ansatt

import java.sql.Connection;

public class Bruker {
        int AnsattId;
        String AnsattFornavn;
        String AnsattEtternavn;
        String AnsattEmail;
        String AnsattTlf;
        String Passord;
        boolean AnsattSertifsert;
        boolean Admin;
        boolean AnsattUnion;


    public Bruker(int AnsattId, String AnsattFornavn, String AnsattEtternavn, String AnsattEmail, String AnsattTlf, String Passord,
                   boolean AnsattSertifsert, boolean Admin, boolean AnsattUnion) {
        this.AnsattId = AnsattId;
        this.AnsattFornavn = AnsattFornavn;
        this.AnsattEtternavn = AnsattEtternavn;
        this.AnsattEmail = AnsattEmail;
        this.AnsattTlf = AnsattTlf;
        this.Passord = Passord;
        this.AnsattSertifsert = AnsattSertifsert;
        this.Admin = Admin;
        this.AnsattUnion = AnsattUnion;
    }

    public Bruker() {

    }


    public int getAnsattId() {
        return AnsattId;
    }

    public void setAnsattId(int ansattId) {
        AnsattId = ansattId;
    }

    public String getAnsattFornavn() {
        return AnsattFornavn;
    }

    public void setAnsattFornavn(String ansattFornavn) {
        AnsattFornavn = ansattFornavn;
    }

    public String getAnsattEtternavn() {
        return AnsattEtternavn;
    }

    public void setAnsattEtternavn(String ansattEtternavn) {
        AnsattEtternavn = ansattEtternavn;
    }

    public String getAnsattEmail() {
        return AnsattEmail;
    }

    public void setAnsattEmail(String ansattEmail) {
        AnsattEmail = ansattEmail;
    }

    public String getAnsattTlf() {
        return AnsattTlf;
    }

    public void setAnsattTlf(String ansattTlf) {
        AnsattTlf = ansattTlf;
    }

    public String getPassord() {
        return Passord;
    }

    public void setPassord(String passord) {
        Passord = passord;
    }

    public boolean isAnsattSertifsert() {
        return AnsattSertifsert;
    }

    public void setAnsattSertifsert(boolean ansattSertifsert) {
        AnsattSertifsert = ansattSertifsert;
    }

    public boolean isAdmin() {
        return Admin;
    }

    public void setAdmin(boolean admin) {
        Admin = admin;
    }

    public boolean isAnsattUnion() {
        return AnsattUnion;
    }

    public void setAnsattUnion(boolean ansattUnion) {
        AnsattUnion = ansattUnion;
    }
}