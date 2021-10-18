create database if not exists MytestDB;
use AMWDB;

CREATE TABLE `VerktoyType` (
                               `VerktoyTypeID` int,
                               `VerktoyTypeNavn` varchar(25) ,
                               PRIMARY KEY (`VerktoyTypeID`)
);

CREATE TABLE `Ansatt` (
                          `AnsattID` int,
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

