create database if not exists AMWWDB;
use AMWWDB;

CREATE TABLE `Ansatt`
(
    `AnsattID`         int,
    `AnsattFornavn`    varchar(25),
    `AnsattEtternavn`  varchar(25),
    `AnsattEmail`      varchar(25),
    `AnsattTlf`        varchar(25),
    `Passord`          varchar(25),
    `AnsattSertifsert` boolean,
    `Admin`            boolean,
    `AnsattUnion`      boolean,
    PRIMARY KEY (`AnsattID`)
);

CREATE TABLE `Booking`
(
    `VerktoyID`          int,
    `AnsattID`           int,
    `BookingDatoStartID` varchar(25),
    `BookingDatoSlutt`   varchar(25),
    `Status`             int,
    FOREIGN KEY (`AnsattID`) REFERENCES `Ansatt` (`AnsattID`),
    PRIMARY KEY (VerktoyID, AnsattID, BookingDatoStartID)

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

#Ansatt

INSERT INTO Ansatt (AnsattID, AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord, AnsattSertifsert, Admin,
                    AnsattUnion)
VALUES (1, 'Kevin', 'Maksevicius', 'kevinas@lyse.net', '77884503', '12345', TRUE, TRUE, TRUE);

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


#Booking

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (1, 1, '01.01.2021', '04.01.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (2, 2, '01.08.2021', '04.08.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (3, 3, '01.09.2021', '04.09.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (4, 4, '01.10.2021', '04.10.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (5, 5, '01.02.2021', '04.02.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (6, 6, '01.03.2021', '04.03.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (7, 7, '01.04.2021', '04.04.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (8, 8, '01.05.2021', '04.05.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (9, 9, '01.05.2021', '04.05.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (10, 10, '01.05.2021', '04.05.2021', 1);


#VerktøyType

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (1, 'Screw driver');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (2, 'Tire machine');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (3, 'Surface plate vibrator');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (4, 'Nail gun, small,');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (5, 'Nail gun, large');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (6, 'Nail gun, large');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (7, 'Car trailer, small');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (8, 'Car trailer, big');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (9, 'Personal lift');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (10, 'Motorized wheelbarrow');


#Verktøy
insert into Verktoy (VerktoyID, VerktoyTypeID, Tilgjenglighet, MaksDager, Gratis, Kostnad)
VALUES (1, 1, true, 4, true, 0),
       (2, 2, TRUE, 4, TRUE, 0),
       (3, 3, TRUE, 4, TRUE, 0),
       (4, 4, TRUE, 4, TRUE, 0);

insert into Verktoy (VerktoyID, VerktoyTypeID, Tilgjenglighet, MaksDager, Gratis, Kostnad)
VALUES (5, 5, TRUE, 4, TRUE, 0),
       (6, 6, TRUE, 4, TRUE, 0),
       (7, 6, TRUE, 4, TRUE, 0),
       (8, 8, TRUE, 4, TRUE, 0),
       (9, 9, TRUE, 4, TRUE, 0),
       (10, 10, TRUE, 4, TRUE, 0);

SELECT AnsattEmail
FROM Ansatt
WHERE AnsattID
LIMIT 5;

SELECT Passord
FROM Ansatt
WHERE AnsattID
LIMIT 5;

SELECT BookingDatoStartID
FROM Booking
WHERE AnsattID
LIMIT 5;

SELECT BookingDatoSlutt
FROM Booking
WHERE AnsattID
LIMIT 5;

SELECT VerktoyTypeNavn
FROM VerktoyType
WHERE VerktoyTypeID
LIMIT 5;













