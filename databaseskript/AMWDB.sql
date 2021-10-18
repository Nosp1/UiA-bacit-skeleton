create database if not exists AMWDB;
use AMWDB;

CREATE TABLE `VerktoyType` (
                               `VerktoyTypeID` int,
                               `VerktoyTypeNavn` varchar(25) ,
                               PRIMARY KEY (`VerktoyTypeID`)
);

CREATE TABLE `Ansatt` (
                          'AnsattID' integer,
                          `AnsattFornavn` varchar(25),
                          `AnsattEtternavn` varchar(25),
                          `AnsattEmail` varchar(25),
                          `AnsattTlf` varchar(25),
                          `Passord` varchar(25),
                          `AnsattSertifsert` boolean,
                          `Admin` boolean,
                          `AnsattUnion` boolean,
                          PRIMARY KEY (`AnsattID`)
);

CREATE TABLE `Booking` (
                           `VerktoyID` int,
                           `AnsattID` int,
                           `BookingDatoStartID` varchar(25),
                           `BookingDatoSlutt` varchar(25),
                           `Status` int,
                           FOREIGN KEY (`AnsattID`) REFERENCES `Ansatt`(`AnsattID`),
                           KEY `AK` (`BookingDatoStartID`)
);

CREATE TABLE `Verktoy`
(
    `VerktoyID`      int,
    `VerktoyTypeID`  int,
    `Tilgjenglighet` boolean,
    `MaksDager`      int,
    `Gratis`         boolean,
    `Kostnad`        int,
    PRIMARY KEY (`VerktoyID`),
    FOREIGN KEY (`VerktoyTypeID`) REFERENCES `VerktoyType` (`VerktoyTypeID`),
    FOREIGN KEY (`VerktoyID`) REFERENCES `Booking` (`AnsattID`)
);

INSERT INTO Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (1,'Kevin', 'Maksevicius', 'kevinas@lyse.net', '77884503', '12345', TRUE, TRUE, TRUE );

insert into Ansatt (AnsattID,AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (2, 'Simen', 'Kydland', 'simenkydland@gmail.com', '88778709', '54321', TRUE, TRUE, FALSE );

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (3, 'Adrian', 'Skrindo', 'adrianskrindo@gmail.com', '34578901', '44455', TRUE, TRUE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (4, 'Emanuel', 'Eie Larsen', 'emu00@gmail.com', '88333901', '99966', TRUE, TRUE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (5, 'Terje', 'Kydland', 'terjekyd@gmail.com', '56800901', '22233', TRUE, FALSE, FALSE);

insert into Ansatt (AnsattID,AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (6, 'Ola', 'Nordmann', 'olanord@gmail.com', '77777777', '02345', TRUE, FALSE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (7, 'Harald', 'Nilsen', 'Haralad88@gmail.com', '47623904', '19922', TRUE, FALSE, TRUE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (8, 'Torstein', 'Andersen', 'torandersen@gmail.com', '34578901', '19978', TRUE, FALSE, TRUE);

INSERT INTO Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (9,'Kenny', 'Lee', 'Kennylee@gmail.com', '99332244','23725', TRUE, TRUE, FALSE);

insert into Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin, AnsattUnion)
VALUES (10, 'Jakob', 'Varhaug', 'jakobvar@gmail.com', '67800456', '20017', TRUE, FALSE, TRUE);






