create database if not exists Gruppe9;

Use Gruppe9;

CREATE TABLE Brukere (Bruker_ID integer UNIQUE auto_increment,
                      Fult_navn Varchar(255),
                      Telefonnummer Varchar(8),
                      E_post Varchar(30),
                      Fagforbund BOOLEAN,
                      Brukernavn VARCHAR(30),
                      Passord Varchar(50)
);

Alter table Brukere add primary key (Bruker_ID);

Alter table Brukere Add column Bruker_roller Varchar(25);

CREATE INDEX Fult_navn
    ON Brukere (Fult_navn);

ALTER TABLE Brukere
    add CONSTRAINT telefon
        check (Telefonnummer >= 8);

CREATE VIEW bruker_admin AS
SELECT Fult_navn, Telefonnummer, E_post
From Brukere
where Bruker_roller = 'admin';

CREATE TABLE Admin
(
    Admin_ID  integer UNIQUE auto_increment,
    Bruker_ID integer,
    PRIMARY KEY (Admin_ID),
    FOREIGN KEY (Bruker_ID) REFERENCES Brukere (Bruker_ID)
);

CREATE TABLE Pris (
                      Pris_ID integer UNIQUE auto_increment,
                      Pris INTEGER,
                      PRIMARY KEY (Pris_ID)
);

CREATE TABLE Kurs (
                      Kurs_ID integer UNIQUE auto_increment,
                      Bruker_ID INTEGER,
                      Kurs_navn VARCHAR(50),
                      Kurs_dato_fullført DATE,
                      PRIMARY KEY (Kurs_ID),
                      FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID)
);
CREATE TABLE Produkter (
                           Produkt_ID integer UNIQUE auto_increment,
                           Produkt_navn VARCHAR(50),
                           Kategori VARCHAR(50),
                           Kurs_ID INTEGER,
                           PRIS_ID INTEGER,
                           PRIMARY KEY (Produkt_ID),
                           FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID),
                           FOREIGN KEY (PRIS_ID) REFERENCES Pris(Pris_ID)
);

CREATE TABLE Reservasjoner (
                               Reservasjon_ID integer UNIQUE auto_increment,
                               Produkt_ID INTEGER,
                               Bruker_ID INTEGER,
                               Reservasjon_dato_fra DATE,
                               Reserasjon_dato_til DATE,
                               PRIMARY KEY (Reservasjon_ID),
                               FOREIGN KEY (Produkt_ID) REFERENCES Produkter(Produkt_ID),
                               FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID)
);

ALTER TABLE Brukere MODIFY COLUMN Telefonnummer VARCHAR(11);

ALTER TABLE Brukere DROP COLUMN Brukernavn;

Alter TABLE Produkter ADD COLUMN Reservert BOOLEAN;

