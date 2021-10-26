create database if not exists Gruppe9;

Use Gruppe9;

CREATE TABLE Brukere (Bruker_ID integer UNIQUE auto_increment,
                      Fult_navn Varchar(255),
                      Telefonnummer Varchar(15),
                      E_post Varchar(30),
                      Fagforbund BOOLEAN,
                      Brukernavn VARCHAR(30),
                      Passord Varchar(50)

);

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

Alter table Brukere add primary key (Bruker_ID);

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
                           Beskrivelse VARCHAR(500),
                           Bilde blob,
                           Brukes boolean,
                           Kurs_ID INTEGER,
                           PRIS_ID INTEGER,
                           PRIMARY KEY (Produkt_ID),
                           FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID),
                           FOREIGN KEY (PRIS_ID) REFERENCES Pris(Pris_ID)
);

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
                               FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID)
);

ALTER TABLE Brukere MODIFY COLUMN Telefonnummer VARCHAR(11);

ALTER TABLE Brukere DROP COLUMN Brukernavn;

SELECT (Produkt_navn, Beskrivelse, Bilde) FROM Produkter AS P_info;

SELECT * FROM Brukere, Produkter, Kurs, Pris, Reservasjoner
LIMIT 5;











INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (2, 'Nora Fure', '+4777366390', 'Nora@Epost.com', 1, '123', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (3, 'Hernik Roed', '+4789771324', 'Henrik@Epost.com', 0, '1234', 'Admin');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (4, 'Mads Teland', '+4790001982', 'Mads@Epost.com', 0, '12345', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (5, 'Emanuel Minak', '+4724524372', 'Emanuel@Epost.com', 1, '123456', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (6, 'Knut Norwegian', '+4775312387', 'Knut@Epost.com', 1, '654321', 'Admin');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (7, 'Roald Peroson', '+4783928173', 'Roald@Epost.com', 0, '54321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (8, 'Frida Karlsen', '+4712763521', 'Frida@Epost.com', 0, '4321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (9, 'Ingrid Benthus', '+4721379862', 'Ingrid@Epost.com', 1, '321', 'Bruker');

INSERT INTO Gruppe9.Brukere (Bruker_ID, Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Bruker_roller) VALUES (10, 'Roar Klippestad', '+4721875362', 'Roar@Epost.com', 0, 'Passord', 'Admin');

INSERT INTO Gruppe9.Pris (Pris_ID, Pris) VALUES (10, 0);

INSERT INTO Gruppe9.Pris (Pris_ID, Pris) VALUES (20, 50);

INSERT INTO Gruppe9.Pris (Pris_ID, Pris) VALUES (30, 100);

INSERT INTO Gruppe9.Pris (Pris_ID, Pris) VALUES (40, 150);

INSERT INTO Gruppe9.Admin (Admin_ID, Bruker_ID) VALUES (100, 3);

INSERT INTO Gruppe9.Admin (Admin_ID, Bruker_ID) VALUES (200, 6);

INSERT INTO Gruppe9.Admin (Admin_ID, Bruker_ID) VALUES (300, 10);

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1000, 1, 'Førerkort Klasse B', '1997-01-17');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1001, 2, 'Førerkort Klasse B', '1982-06-14');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1002, 3, 'Førerkort Klasse B', '1998-11-10');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1003, 4, 'Førerkort Klasse B', '2000-06-01');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1004, 5, 'Førerkort Klasse B', '1994-02-21');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1005, 6, 'Førerkort Klasse B', '1996-09-20');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1006, 7, 'Førerkort Klasse B', '1985-04-16');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1007, 8, 'Førerkort Klasse B', '1979-12-12');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (1008, 9, 'Førerkort Klasse B', '1991-09-13');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (2000, 2, 'Tilhenger B96', '2001-12-11');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (2001, 4, 'Tilhenger B96', '2015-08-15');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (2002, 5, 'Tilhenger B96', '2016-06-15');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (2003, 8, 'Tilhenger B96', '2008-10-10');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (3000, 1, 'KranFører G4', '2005-02-01');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (3001, 4, 'KranFører G4', '2012-08-15');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (3002, 7, 'KranFører G4', '2013-10-11');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (4000, 8, 'ranfører G20', '2008-09-11');

INSERT INTO Gruppe9.Kurs (Kurs_ID, Bruker_ID, Kurs_navn, Kurs_dato_fullført) VALUES (4001, 4, 'ranfører G20', '2018-03-12');

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10001, 'Liten Drill', 'Små verktøy', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10002, 'Liten Drill', 'Små Verktøy', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10003, 'Tilhenger(Liten)', 'Transport', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10004, 'Tillhenger (Stor)', 'Transport', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10005, 'Lyft', 'Maskiner', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10006, 'Dekkskiftemaskin', 'Maskiner', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10007, 'Slagdrill', 'Små Verktøy', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10008, 'Jekktralle', 'Transport', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10009, 'Verktøykasse', 'Små Verktøy', null, 10, null);

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Kurs_ID, PRIS_ID, Brukes) VALUES (10010, 'Sementmikser', 'Maskiner', null, 10, null);

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (11, 10001, 1, '2021-10-26', '2021-10-29');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (12, 10002, 2, '2021-10-05', '2021-10-07');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (13, 10005, 7, '2021-11-09', '2021-11-11');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (14, 10009, 1, '2021-10-26', '2021-10-29');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (15, 10010, 9, '2021-12-27', '2021-12-29');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (16, 10004, 2, '2021-10-01', '2021-10-03');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (17, 10006, 1, '2021-10-29', '2021-10-31');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (18, 10008, 5, '2021-10-27', '2021-10-30');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (19, 10008, 7, '2022-01-14', '2022-01-15');

INSERT INTO Gruppe9.Reservasjoner (Reservasjon_ID, Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES (21, 10004, 3, '2021-06-10', '2021-06-13');


