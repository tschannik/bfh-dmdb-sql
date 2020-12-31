/* Drop existing tables*/
DROP TABLE IF EXISTS ABTEILUNGSLEITER;

DROP TABLE IF EXISTS PROJEKT_MITARBEITER;

DROP TABLE IF EXISTS FERIEN;

DROP TABLE IF EXISTS PROJEKT;

DROP TABLE IF EXISTS MITARBEITER;

DROP TABLE IF EXISTS BONUS;

DROP TABLE IF EXISTS ABTEILUNG;

DROP TABLE IF EXISTS GEHALTSGRUPPE;

/* Create tables */
CREATE TABLE MITARBEITER(
    PID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Eintrittsdatum DATE NOT NULL,
    AbteilungsID INT NOT NULL,
    GehaltsgruppeID INT NOT NULL,
    BonusID INT NOT NULL,
    StellvertreterID INT,
    PRIMARY KEY (PID),
    CONSTRAINT PID_LENGTH CHECK (
        PID BETWEEN 1000
        AND 9999
    )
);

CREATE TABLE BONUS(
    BID INT NOT NULL,
    Bonus_Prozent INT NOT NULL,
    ErhaltAbAnstellungszeit INT NOT NULL,
    PRIMARY KEY (BID),
    CONSTRAINT Bonus_Prozent CHECK (
        Bonus_Prozent BETWEEN - 10
        AND 10
    )
);

CREATE TABLE GEHALTSGRUPPE(
    GID INT NOT NULL,
    GEH INT NOT NULL,
    PRIMARY KEY (GID),
    CONSTRAINT ID_LENGTH CHECK (
        GID BETWEEN 10
        AND 99
    )
);

CREATE TABLE PROJEKT(
    ProjektID INT NOT NULL,
    ProjektleiterID INT NOT NULL,
    Bezeichnung VARCHAR(100) NOT NULL,
    Startdatum DATE NOT NULL,
    Enddatum DATE NOT NULL,
    ParentProjektID INT,
    PRIMARY KEY (ProjektID)
);

CREATE TABLE PROJEKT_MITARBEITER(
    MitarbeiterID INT NOT NULL,
    ProjektID INT NOT NULL,
    Projektbeteiligung INT NOT NULL,
    Start_mitarbeit DATE NOT NULL,
    Ende_mitarbeit DATE NOT NULL,
    PRIMARY KEY (MitarbeiterID, ProjektID),
    CONSTRAINT Projektbeteiligung_LENGTH CHECK (
        Projektbeteiligung BETWEEN 0
        AND 100
    )
);

CREATE TABLE ABTEILUNG(
    AID INT NOT NULL,
    Bezeichnung VARCHAR(50),
    Kurzbezeichnung VARCHAR(10),
    PRIMARY KEY (AID)
);

CREATE TABLE FERIEN(
    FID INT NOT NULL,
    Erster_Urlaubstag DATE NOT NULL,
    Letzter_Urlaubstag DATE NOT NULL,
    MitarbeiterID INT NOT NULL,
    GenehmigungsStatus INT NOT NULL,
    Genutzte_Ferientage INT,
    Beantragt_am DATE,
    Genehmigung_am DATE,
    Storniert_am DATE,
    PRIMARY KEY (FID),
    CONSTRAINT GenehmigungsStatus_Check CHECK (
        GenehmigungsStatus BETWEEN 1
        AND 4
    )
);

CREATE TABLE ABTEILUNGSLEITER(
    ATID INT NOT NULL,
    MitarbeiterID INT NOT NULL,
    AbteilungsID INT NOT NULL,
    PRIMARY KEY (ATID),
    UNIQUE(MitarbeiterID, AbteilungsID)
);