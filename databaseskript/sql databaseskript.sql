create database if not exists Gruppe9;

Use Gruppe9;

CREATE TABLE Brukere (Bruker_ID integer UNIQUE auto_increment,
                      Fult_navn Varchar(255),
                      Telefonnummer Varchar(11),
                      E_post Varchar(30),
                      Fagforbund BOOLEAN,
                      Passord Varchar(550),
                      Admin BOOLEAN,
                      PRIMARY KEY (Bruker_ID));

CREATE INDEX Fult_navn
    ON Brukere (Fult_navn);

ALTER TABLE Brukere
    add CONSTRAINT telefon
        check (Telefonnummer >= 8);

CREATE VIEW bruker_admin AS
SELECT Fult_navn, Telefonnummer, E_post
From Brukere
where Admin = 1;

Create table Kurs (
                      Kurs_ID INTEGER UNIQUE AUTO_INCREMENT,
                      Kurs_navn Varchar(25),
                      PRIMARY KEY (Kurs_ID));

CREATE TABLE Kursbevis (
                           Kurs_ID integer,
                           Bruker_ID INTEGER,
                           Kurs_dato DATE,
                           PRIMARY KEY (Kurs_ID, Bruker_ID),
                           FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID),
                           FOREIGN KEY (Bruker_ID) REFERENCES Brukere(Bruker_ID));

CREATE TABLE Produkter (
                           Produkt_ID integer UNIQUE auto_increment,
                           Produkt_navn VARCHAR(50),
                           Kategori VARCHAR(50),
                           Beskrivelse VARCHAR(500),
                           Bilde blob,
                           Brukes BOOLEAN,
                           Kurs_ID INTEGER,
                           Pris INTEGER,
                           PRIMARY KEY (Produkt_ID),
                           FOREIGN KEY (Kurs_ID) REFERENCES Kurs(Kurs_ID));

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

select Produkt_navn from Produkter where brukes = 0;

Select Produkt_navn from Produkter where brukes = 1;

ALTER Table reservasjoner Add column dato_now datetime default now();

Select fult_navn from brukere inner join reservasjoner
                                         on brukere.bruker_id = reservasjoner.bruker_id
                              inner join produkter on Reservasjoner.Produkt_ID = Produkter.Produkt_ID
where reservasjoner.reserasjon_dato_til < reservasjoner.dato_now And brukes = 1;

select Produkt_navn, Kategori from Produkter;

select Fult_navn,
       count(Reservasjon_ID) from Brukere inner join Reservasjoner on Brukere.Bruker_ID=Reservasjoner.Bruker_ID
group by Fult_navn order by count(Reservasjon_ID) desc limit 3;

select * from Reservasjoner
WHERE
        Bruker_ID = (select Brukere.Bruker_ID from Brukere inner join Reservasjoner on Brukere.Bruker_ID=Reservasjoner.Bruker_ID
                     group by Fult_navn order by count(Produkt_ID) desc limit 1)
order by Reservasjon_dato_fra DESC;

Delete from Produkter where Produkt_ID=10001;







INSERT INTO Gruppe9.Brukere (Fult_navn, Telefonnummer, E_post, Fagforbund, Passord, Admin) VALUES
('Nora Fure', '+4777366390', 'Nora@Epost.com', 1, '123', 1),
('Hernik Roed', '+4789771324', 'Henrik@Epost.com', 0, '1234', 1),
('Mads Teland', '+4790001982', 'Mads@Epost.com', 0, '12345', 1),
('Emanuel Minak', '+4724524372', 'Emanuel@Epost.com', 1, '123456', 1),
('Knut Norwegian', '+4775312387', 'Knut@Epost.com', 1, '654321', 1),
('Roald Peroson', '+4783928173', 'Roald@Epost.com', 0, '54321', 0),
('Frida Karlsen', '+4712763521', 'Frida@Epost.com', 0, '4321', 0),
('Ingrid Benthus', '+4721379862', 'Ingrid@Epost.com', 1, '321', 0),
('Roar Klippestad', '+4721875362', 'Roar@Epost.com', 0, 'Passord', 0),
('Henning Sletner', '+4746897309', 'Henning@Epost.com', 1, '1234567', 0);

INSERT INTO Gruppe9.Kurs (Kurs_navn) VALUES
('Førerkort klasse B'),
('Tillhengerbevis B96'),
('Kranbevis G4'),
('Kranbevis G20'),
('Krever ikke kurs');

INSERT INTO Gruppe9.Kursbevis (Kurs_ID, Bruker_ID, Kurs_dato)
VALUES
(1, 2, '2014-06-12'),
(1, 3, '2017-05-14'),
(1, 4, '2019-10-31'),
(1, 5, '2014-01-13'),
(1, 6, '2010-11-24'),
(1, 7, '2019-12-15'),
(1, 8, '1990-07-17'),
(1, 9, '1998-02-28'),
(1, 10, '2017-09-13'),
(2, 9, '2019-10-06'),
(2, 3, '2018-01-17'),
(2, 6, '2018-05-26'),
(3, 10, '2017-10-03'),
(4, 10, '2014-06-02'),
(3, 6, '2018-11-16'),
(4, 6, '2013-02-22');

INSERT INTO Gruppe9.Produkter (Produkt_ID, Produkt_navn, Kategori, Beskrivelse, Bilde, Brukes, Kurs_ID, Pris) VALUES
(10001, 'Liten Drill', 'Små Verktøy', 'Lang text', null, 2, 0,null),
(10002, 'Liten Drill', 'Små Verktøy', 'Lang text', null, 2, 1, null),
(10003, 'Tilhenger(Liten)', 'Transport', 'Lang text', null, 3, 0, null),
(10004, 'Tillhenger (Stor)', 'Transport', 'Lang text', null, 4, 1, null),
(10005, 'Lyft', 'Maskiner', 'Lang text', null, 4, 1, null),
(10006, 'Dekkskiftemaskin', 'Maskiner', 'Lang text', null, 4, 0, null),
(10007, 'Slagdrill', 'Små Verktøy', 'Lang text', null, 2, 1, null),
(10008, 'Jekktralle', 'Transport', 'Lang text', null, 2, 0, null),
(10009, 'Verktøykasse', 'Små Verktøy', 'Lang text', null, 2, 1, null),
(10010, 'Sementmikser', 'Maskiner', 'Lang text', null, 2, 0, null);

INSERT INTO Gruppe9.Reservasjoner (Produkt_ID, Bruker_ID, Reservasjon_dato_fra, Reserasjon_dato_til) VALUES
(10001, 1, '2021-10-26', '2021-10-29'),
(10002, 2, '2021-10-05', '2021-10-07'),
(10005, 7, '2021-11-09', '2021-11-11'),
(10009, 1, '2021-10-26', '2021-10-29'),
(10010, 9, '2021-12-27', '2021-12-29'),
(10004, 2, '2021-10-01', '2021-10-03'),
(10006, 1, '2021-10-29', '2021-10-31'),
(10008, 5, '2021-10-27', '2021-10-30'),
(10008, 7, '2022-01-14', '2022-01-15'),
(10004, 3, '2021-06-10', '2021-06-13');


