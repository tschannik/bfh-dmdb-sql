/* Drop foreignkeys first */
/* Drop existing tables*/
DROP TABLE IF EXISTS MITARBEITER;

DROP TABLE IF EXISTS PROJEKT;

DROP TABLE IF EXISTS ABTEILUNG;

DROP TABLE IF EXISTS GEHALTSGRUPPE;

DROP TABLE IF EXISTS FERIEN;

DROP TABLE IF EXISTS PROJEKT_MITARBEITER;

CREATE TABLE MITARBEITER(
    PID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Eintrittsdatum DATE NOT NULL,
    Bonus INT DEFAULT(0),
    AbteilungsID INT NOT NULL,
    GehaltsgruppeID INT NOT NULL,
    StellvertreterID INT,
    PRIMARY KEY (PID),
    CONSTRAINT PID_LENGTH CHECK (
        PID BETWEEN 1000
        AND 9999
    )
);

CREATE TABLE GEHALTSGRUPPE(
    GID INT NOT NULL,
    /* Standardgehalt */
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
    PRIMARY KEY (MitarbeiterID, ProjektID)
);

CREATE TABLE ABTEILUNG(
    AID INT NOT NULL,
    Bezeichnung VARCHAR(100),
    Kurzbezeichnung VARCHAR(10),
    AbteilungsleiterID INT NOT NULL,
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
    Genehmigung BOOLEAN,
    Genehmigung_am DATE,
    Storniert_am DATE,
    PRIMARY KEY (FID),
    CONSTRAINT GenehmigungsStatus_Check CHECK (
        GenehmigungsStatus BETWEEN 1
        AND 4
    )
);

ALTER TABLE
    MITARBEITER
ADD
    FOREIGN KEY (GehaltsgruppeID) REFERENCES GEHALTSGRUPPE(GID);

ALTER TABLE
    MITARBEITER
ADD
    FOREIGN KEY (AbteilungsID) REFERENCES ABTEILUNG(AID);

ALTER TABLE
    MITARBEITER
ADD
    FOREIGN KEY (StellvertreterID) REFERENCES MITARBEITER(PID);

ALTER TABLE
    PROJEKT
ADD
    FOREIGN KEY (ParentProjektID) REFERENCES PROJEKT(ProjektID);

ALTER TABLE
    PROJEKT
ADD
    FOREIGN KEY (ProjektleiterID) REFERENCES MITARBEITER(PID);

ALTER TABLE
    PROJEKT_MITARBEITER
ADD
    FOREIGN KEY (MitarbeiterID) REFERENCES MITARBEITER(PID);

ALTER TABLE
    PROJEKT_MITARBEITER
ADD
    FOREIGN KEY (ProjektID) REFERENCES PROJEKT(ProjektID);

ALTER TABLE
    ABTEILUNG
ADD
    FOREIGN KEY (AbteilungsleiterID) REFERENCES MITARBEITER(PID);

ALTER TABLE
    FERIEN
ADD
    FOREIGN KEY (MitarbeiterID) REFERENCES MITARBEITER(PID);