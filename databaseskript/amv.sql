drop database if exists amv;
create database amv;
use amv;

CREATE TABLE Ansatt
(
    `AnsattID`         int PRIMARY KEY auto_increment,
    `AnsattFornavn`    varchar(25),
    `AnsattEtternavn`  varchar(25),
    `AnsattEmail`      varchar(25),
    `AnsattTlf`        varchar(25),
    `Passord`          varchar(200),
    `AnsattSertifsert` boolean,
    `Admin`            boolean,
    `AnsattUnion`      boolean
);


CREATE TABLE VerktoyType
(
    VerktoyTypeID int PRIMARY KEY auto_increment,
    VerktoyTypeNavn varchar(100),
    VerktoyBilde varchar(100)
);


CREATE TABLE Verktoy
(
    `VerktoyID`      int primary key auto_increment,
    `VerktoyTypeID`  int,
    `Tilgjenglighet` boolean,
    `MaksDager`      int,
    `Gratis`         boolean,
    `Kostnad`        int,
    FOREIGN KEY (`VerktoyTypeID`) REFERENCES VerktoyType (`VerktoyTypeID`) ON DELETE CASCADE
);

CREATE TABLE Booking
(
    `BookingID`          int PRIMARY KEY auto_increment,
    `VerktoyID`          int,
    `AnsattID`           int,
    `BookingDatoStartID` varchar(25),
    `BookingDatoSlutt`   varchar(25),
    `Status`             int,
    FOREIGN KEY (`AnsattID`) REFERENCES Ansatt (`AnsattID`) ON DELETE CASCADE,
    FOREIGN KEY (`VerktoyID`) REFERENCES Verktoy (`VerktoyID`) ON DELETE CASCADE);

#Ansatt

INSERT INTO Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (1, 'Kevin', 'Maksevicius', 'kevinas@lyse.net', '77884503', '827ccb0eea8a706c4c34a16891f84e7b', TRUE, TRUE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (2, 'Simen', 'Kydland', 'simenkydland@gmail.com', '88778709', '54321', TRUE, TRUE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (3, 'Adrian', 'Skrindo', 'adrianskrindo@gmail.com', '34578901', '44455', TRUE, TRUE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (4, 'Emanuel', 'Eie Larsen', 'emu00@gmail.com', '88333901', '99966', TRUE, TRUE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (5, 'Terje', 'Kydland', 'terjekyd@gmail.com', '56800901', '22233', TRUE, FALSE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (6, 'Ola', 'Nordmann', 'olanord@gmail.com', '77777777', '02345', TRUE, FALSE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (7, 'Harald', 'Nilsen', 'Haralad88@gmail.com', '47623904', '19922', TRUE, FALSE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (8, 'Torstein', 'Andersen', 'torandersen@gmail.com', '34578901', '19978', TRUE, FALSE, TRUE);

INSERT INTO Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (9, 'Kenny', 'Lee', 'Kennylee@gmail.com', '99332244', '23725', TRUE, TRUE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (10, 'Jakob', 'Varhaug', 'jakobvar@gmail.com', '67800456', '20017', TRUE, FALSE, TRUE);

#VerktøyType

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (1, 'Skruautomat', 'Skruemaskin.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (2, 'Fein Multimaskin', 'FeinMultimaskin.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (3, 'Eksentersliper 230 VAC', 'Eksentersliper230V.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (4, '9" Vinkelsiper, stein', '9VinkelsliperStein.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (5, 'Flisekutter, kermaiske fliser', 'FlisekutterKeramikk.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (6, 'Båndsliper 230 VAC', 'Bandsliper230v.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (7, 'Høvel 230 VAC', 'Hovel230v.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (8, 'Gjære-/kombisag 230 VAC', 'GjereKombisag.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (9, 'Vedkløyver (bensin)', 'VedkloyverBensin.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (10, 'Tilhenger boggi, RC9878 (kassemål: L*B: 297*153', 'TilhengerBoggi.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (11, 'Tilhenger liten, RC9878 (kassemål: L*B: 197*153', 'TilhengerLiten.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (12, 'Spikerpistol liten (luft)', 'SpikerpistolLitenLuft.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (13, 'Meislemaskin 230 VAC', 'Meiselmaskin230v.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (14, 'Kantsliper (bensin)', 'KantklipperBensin.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (15, 'Kompressor 230 VAC', '');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (16, '"Hoppetusse (bensin)', 'HoppetusseBensin.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (17, 'Personløfter 230 VAC (12m), krever sikkerhetsopplæring', 'PersonloftNiftylift.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (18, 'Flisekutter for trevirke', 'FlisekutterTrevirke.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (19, 'Motorisert trillebår', 'MotorisertTrillebår.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (20, 'Strømaggregat 3,7 kW', 'Stromaggregat37kw.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (21, 'Dekkmaskin', '');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (22, 'Bildiagnose', 'Bildiagnose.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (23, 'Spikerpistol Milwaukee stor', 'SpikerpistolMilwaukeeSpikerStor.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (24, 'Spikerpistol Milwaukee mellom', 'SpikerpistolMilwaukeeKrampeMellom.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (25, 'Spikerpistol Milwaukee liten', 'SpikerpistolMilwaukeeDykkLiten.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (26, 'Leirduekaster', 'Leirduekaster.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (27, 'Leica snekker laser', 'LeicaSnekkerlaser.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (28, 'Slagdrill Milwaukee', 'MilwaukeeSlagdrill.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (29, 'Skap henger', 'SkapHenger.PNG');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn, VerktoyBilde)
VALUES (30, 'Bluetooth høyttaler SOUNDBOKS', 'BluetoothHoytalerSOUNDBOKS.PNG');

#Verktøy
insert into Verktoy (VerktoyID, VerktoyTypeID, Tilgjenglighet, MaksDager, Gratis, Kostnad)
VALUES (1, 1, TRUE, 4, TRUE, 20),
       (2, 2, TRUE, 4, TRUE, 20),
       (3, 3, TRUE, 4, TRUE, 20),
       (4, 4, TRUE, 4, TRUE, 20),
       (5, 5, TRUE, 4, TRUE, 20),
       (6, 6, TRUE, 4, TRUE, 20),
       (7, 7, TRUE, 4, TRUE, 20),
       (8, 8, TRUE, 4, TRUE, 20),
       (9, 9, TRUE, 4, TRUE, 50),
       (10, 10, TRUE, 4, TRUE, 50),
       (11, 11, TRUE, 4, TRUE, 20),
       (12, 12, TRUE, 4, TRUE, 20),
       (13, 13, TRUE, 4, TRUE, 20),
       (14, 14, TRUE, 4, TRUE, 20),
       (15, 15, TRUE, 4, TRUE, 20),
       (16, 16, TRUE, 4, TRUE, 50),
       (17, 17, TRUE, 4, FALSE, 100),
       (18, 18, TRUE, 4, TRUE, 50),
       (19, 19, TRUE, 4, TRUE, 50),
       (20, 20, TRUE, 4, TRUE, 50),
       (21, 21, TRUE, 4, FALSE, 50),
       (22, 22, TRUE, 4, TRUE, 50),
       (23, 23, TRUE, 4, TRUE, 20),
       (24, 24, TRUE, 4, TRUE, 20),
       (25, 25, TRUE, 4, TRUE, 20),
       (26, 26, TRUE, 4, TRUE, 20),
       (27, 27, TRUE, 4, TRUE, 20),
       (28, 28, TRUE, 4, TRUE, 20),
       (29, 29, TRUE, 4, TRUE, 50),
       (30, 30, TRUE, 4, TRUE, 20);


#Booking

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status) values
    (1, 1, '01.01.2021', '04.01.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (2, 1, '01.08.2021', '04.08.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (3, 1, '01.09.2021', '04.09.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (4, 2, '01.10.2021', '04.10.2021', 1);

