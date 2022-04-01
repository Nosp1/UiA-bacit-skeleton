package models;

public class UserModel {
    private String nickname;
    private int score;
    private int roundsPlayed;
    private int kills;
    private int deaths;
    private int captures;

    //Just a basic start. It still misses many columns that is saved in the database.
    public UserModel(String nickname, int score, int roundsPlayed, int kills, int deaths, int captures) {
        this.nickname = nickname;
        this.score = score;
        this.roundsPlayed = roundsPlayed;
        this.kills = kills;
        this.deaths = deaths;
        this.captures = captures;

    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getRoundsPlayed() {
        return roundsPlayed;
    }

    public void setRoundsPlayed(int roundsPlayed) {
        this.roundsPlayed = roundsPlayed;
    }

    public int getKills() {
        return kills;
    }

    public void setKills(int kills) {
        this.kills = kills;
    }

    public int getDeaths() {
        return deaths;
    }

    public void setDeaths(int deaths) {
        this.deaths = deaths;
    }

    public int getCaptures() {
        return captures;
    }

    public void setCaptures(int captures) {
        this.captures = captures;
    }
}
