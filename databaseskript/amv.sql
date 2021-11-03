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
    `Passord`          varchar(25),
    `AnsattSertifsert` boolean,
    `Admin`            boolean,
    `AnsattUnion`      boolean
);


CREATE TABLE VerktoyType
(
    VerktoyTypeID int PRIMARY KEY auto_increment,
    VerktoyTypeNavn varchar(100)
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

#VerktøyType

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (1, 'Skruautomat');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (2, 'Fein Multimaskin');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (3, 'Eksentersliper 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (4, '9" Vinkelsiper, stein');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (5, 'Flisekutter, kermaiske fliser');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (6, 'Båndsliper 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (7, 'Høvel 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (8, 'Gjære-/kombisag 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (9, 'Vedkløyver (bensin)');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (10, 'Tilhenger boggi, RC9878 (kassemål: L*B: 297*153');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (11, 'Tilhenger liten, RC9878 (kassemål: L*B: 197*153');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (12, 'Spikerpistol liten (luft)');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (13, 'Meislemaskin 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (14, 'Kantsliper (bensin)');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (15, 'Kompressor 230 VAC');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (16, '"Hoppetusse (bensin)');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (17, 'Personløfter 230 VAC (12m), krever sikkerhetsopplæring');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (18, 'FLisekutter for trevirke');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (19, 'Motorisert trillebår');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (20, 'Strømaggregat 3,7 kW');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (21, 'Dekkmaskin');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (22, 'Bildiagnose');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (23, 'Spikerpistol Milwaukee stor');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (24, 'Spikerpistol Milwaukee mellom');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (25, 'Spikerpistol Milwaukee liten');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (26, 'Leirduekaster');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (27, 'Leica snekker laser');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (28, 'Slagdrill Milwaukee');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (29, 'Skap henger');

insert into VerktoyType (VerktoyTypeID, VerktoyTypeNavn)
VALUES (30, 'Bluetooth høyttaler SOUNDBOKS');

#Verktøy
insert into Verktoy (VerktoyID, VerktoyTypeID, Tilgjenglighet, MaksDager, Gratis, Kostnad)
VALUES (1, 1, FALSE, 4, true, 0),
       (2, 2, TRUE, 4, TRUE, 0),
       (3, 3, FALSE, 4, TRUE, 0),
       (4, 4, TRUE, 4, TRUE, 0);

insert into Verktoy (VerktoyID, VerktoyTypeID, Tilgjenglighet, MaksDager, Gratis, Kostnad)
VALUES (5, 5, FALSE, 4, FALSE, 0),
       (6, 6, TRUE, 4, TRUE, 0),
       (7, 7, TRUE, 4, TRUE, 0),
       (8, 8, TRUE, 4, TRUE, 0),
       (9, 9, TRUE, 4, TRUE, 0),
       (10, 10, TRUE, 4, TRUE, 0);


#Booking

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status) values
    (1, 1, '01.01.2021', '04.01.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (2, 1, '01.08.2021', '04.08.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (3, 1, '01.09.2021', '04.09.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (4, 2, '01.10.2021', '04.10.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (5, 2, '01.02.2021', '04.02.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (6, 2, '01.03.2021', '04.03.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (7, 2, '01.04.2021', '04.04.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (8, 3, '01.05.2021', '04.05.2021', 1);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (9, 9, '01.05.2021', '04.05.2021', 0);

insert into Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt, Status)
VALUES (10, 10, '01.05.2021', '04.05.2021', 1);



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


select VerktoyTypeNavn, VerktoyID
from VerktoyType
         inner join Verktoy V on VerktoyType.VerktoyTypeID = V.VerktoyTypeID;

SELECT VerktoyID, VerktoyTypeNavn, Tilgjenglighet
FROM Verktoy
         INNER JOIN VerktoyType ON Verktoy.VerktoyTypeID = VerktoyType.VerktoyTypeID
WHERE Tilgjenglighet = TRUE;


SELECT AnsattFornavn, AnsattEtternavn, count(Booking.AnsattID = A.AnsattID)
from Booking inner join Ansatt A on Booking.AnsattID = A.AnsattID group by A.AnsattID order by count(A.AnsattID) DESC LIMIT 3;

SELECT a.AnsattFornavn, VT.VerktoyTypeNavn, b.BookingDatoStartID
FROM Booking b
         INNER JOIN Ansatt a on b.AnsattID = a.AnsattID
         INNER JOIN Verktoy t on b.VerktoyID = t.VerktoyID
         INNER JOIN VerktoyType VT on t.VerktoyTypeID = VT.VerktoyTypeID
WHERE b.AnsattID  = (
    SELECT AnsattID
    FROM Booking
    GROUP BY AnsattID
    ORDER BY COUNT(AnsattID) DESC LIMIT 1
)
ORDER BY b.BookingDatoStartID;

SELECT VerktoyID, VerktoyTypeNavn, Tilgjenglighet
from Verktoy
         inner join VerktoyType ON Verktoy.VerktoyTypeID = VerktoyType.VerktoyTypeID
where Tilgjenglighet = false;

select booking.VerktoyID,verktoytypenavn, booking.AnsattID, AnsattFornavn, AnsattEtternavn, 'status'
from Booking
         inner join Ansatt A on Booking.AnsattID = A.AnsattID
         inner join Verktoy v on booking.VerktoyID = v.VerktoyID
         inner join VerktoyType VT on VT.VerktoyTypeID = v.VerktoyTypeID

where status = 0 and current_date > BookingDatoSlutt;
