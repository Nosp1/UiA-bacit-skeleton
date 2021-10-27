create database if not exists Gruppe9;

Use Gruppe9;

CREATE TABLE Brukere (Bruker_ID integer UNIQUE auto_increment,
                      Fult_navn Varchar(255),
                      Telefonnummer Varchar(11),
                      E_post Varchar(30),
                      Fagforbund BOOLEAN,
                      Passord Varchar(50),
                      Bruker_roller Varchar(25),
                      PRIMARY KEY (Bruker_ID));

CREATE INDEX Fult_navn
    ON Brukere (Fult_navn);

ALTER TABLE Brukere
    add CONSTRAINT telefon
    check (Telefonnummer >= 8);

CREATE VIEW bruker_admin AS
    SELECT Fult_navn, Telefonnummer, E_post
    From Brukere
    where Bruker_roller = 'admin';

CREATE TABLE Pris (
                      Pris_ID integer UNIQUE auto_increment,
                      Pris INTEGER,
                      PRIMARY KEY (Pris_ID));
Create table Kurs (
                      Kurs_ID INTEGER UNIQUE AUTO_INCREMENT,
                      Kurs_navn Varchar(25),
                      PRIMARY KEY (Kurs_ID));

CREATE TABLE Kursbevis (
                      Kurs_ID integer UNIQUE auto_increment,
                      Bruker_ID INTEGER,
                      Kurs_dato_fullført DATE,
                      FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID),
                      FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID));

CREATE TABLE Produkter (
                           Produkt_ID integer UNIQUE auto_increment,
                           Produkt_navn VARCHAR(50),
                           Kategori VARCHAR(50),
                           Beskrivelse VARCHAR(500),
                           Bilde blob,
                           Brukes boolean,
                           Kurs_ID INTEGER,
                           PRIS_ID INTEGER,
                           PRIMARY KEY (Produkt_ID),
                           FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID),
                           FOREIGN KEY (PRIS_ID) REFERENCES Pris(Pris_ID));

CREATE INDEX Produkt_index
    ON Produkter (Produkt_navn, Kategori);

CREATE TABLE Reservasjoner (
                               Reservasjon_ID integer UNIQUE auto_increment,
                               Produkt_ID INTEGER,
                               Bruker_ID INTEGER,
                               Reservasjon_dato_fra DATE,
                               Reserasjon_dato_til DATE,
                               PRIMARY KEY (Reservasjon_ID),
                               FOREIGN KEY (Produkt_ID) REFERENCES Produkter(Produkt_ID),
                               FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID));

SELECT (Produkt_navn, Beskrivelse, Bilde) FROM Produkter AS P_info;

SELECT * FROM Brukere, Produkter, Kurs, Pris, Reservasjoner
LIMIT 5;











INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Nora Fure', '+4777366390', 'Nora@Epost.com', 1, '123', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Hernik Roed', '+4789771324', 'Henrik@Epost.com', 0, '1234', 'Admin');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Mads Teland', '+4790001982', 'Mads@Epost.com', 0, '12345', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Emanuel Minak', '+4724524372', 'Emanuel@Epost.com', 1, '123456', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Knut Norwegian', '+4775312387', 'Knut@Epost.com', 1, '654321', 'Admin');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Roald Peroson', '+4783928173', 'Roald@Epost.com', 0, '54321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Frida Karlsen', '+4712763521', 'Frida@Epost.com', 0, '4321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Ingrid Benthus', '+4721379862', 'Ingrid@Epost.com', 1, '321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Roar Klippestad', '+4721875362', 'Roar@Epost.com', 0, 'Passord', 'Admin');

INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES ('Henning Sletner', '+4746897309', 'Henning@Epost.com', 1, '1234567', 'Bruker');

INSERT INTO Gruppe9.Pris (Pris) VALUES (0);

INSERT INTO Gruppe9.Pris (Pris) VALUES (50);

INSERT INTO Gruppe9.Pris (Pris) VALUES (100);

INSERT INTO Gruppe9.Pris (Pris) VALUES (150);

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES ('Førerkort klasse B');

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES ('Tillhengerbevis B96');

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES ('Kranbevis G4');

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES ('Kranbevis G20');

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES ('Krever ikke kurs');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (2, '2014-06-12');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (3, '2017-05-14');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (4, '2019-10-31');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (5, '2014-01-13');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (6, '2010-11-24');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (7, '2019-12-15');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (8, '1990-07-17');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (9, '1998-02-28');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (10, '2017-09-13');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (9, '2019-10-06');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (3, '2018-01-17');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (6, '2018-05-26');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (10, '2017-10-03');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (10, '2014-06-02');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (6, '2018-11-16');

INSERT INTO Gruppe9.Kursbevis (Bruker_ID, Kurs_dato_fullført) VALUES (6, '2013-02-22');

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Liten Drill', 'Liten Drill til hjemmeoppussing', 'Små verktøy', null, 5, 1, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Liten Drill', 'Liten Drill til hjemmeoppussing', 'Små Verktøy', null, 5, 1, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Tilhenger(Liten)', 'Liten tilhenger for transport', 'Transport', null, 2, 2, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Tillhenger (Stor)', 'Stor tilhenger for transport', 'Transport', null, 2, 3, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Lyft', 'Maskiner', 'Lyft 12M høy til utebruk', null, 3, 4, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Dekkskiftemaskin', 'Maskin for dekkskift', 'Maskiner', null, 5, 4, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Slagdrill', 'Små Verktøy', 'Drill for borring i mur', null, 5, 1, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Jekktralle', 'Transport', 'jekk for flytting av paller', null, 5, 2, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Verktøykasse', 'Små Verktøy', 'Verktøykasse med hammer, skrutrekker og bits', null, 5, 1, null);

INSERT INTO Gruppe9.Produkter (Produkt_navn, Kategori, Beskrivelse, Bilde, Kurs_ID, PRIS_ID, Brukes) VALUES ('Sementmikser', 'Maskiner', 'Maskin for miksing av sement', null, 5,  3, null);

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (1, 1, '2021-10-26', '2021-10-29');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (2, 2, '2021-10-05', '2021-10-07');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (5, 7, '2021-11-09', '2021-11-11');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (9, 1, '2021-10-26', '2021-10-29');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (10, 9, '2021-12-27', '2021-12-29');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (4, 2, '2021-10-01', '2021-10-03');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (6, 1, '2021-10-29', '2021-10-31');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (8, 5, '2021-10-27', '2021-10-30');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (8, 7, '2022-01-14', '2022-01-15');

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (4, 3, '2021-06-10', '2021-06-13');


