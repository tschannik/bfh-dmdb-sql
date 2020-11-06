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
    /* Abteilungs ID */
    AID INT NOT NULL,
    /* Gehaltsgruppe ID */
    GID INT NOT NULL,
    StellvertreterID INT,
    PRIMARY KEY (PID),
    CONSTRAINT PID_LENGTH CHECK (
        PID BETWEEN 1000
        AND 9999
    ),
    CONSTRAINT StellvertreterID_LENGTH CHECK (
        StellvertreterID BETWEEN 1000
        AND 9999
    ),
    FOREIGN KEY (GID) REFERENCES GEHALTSGRUPPE(GID),
    FOREIGN KEY (AID) REFERENCES GEHALTSGRUPPE(AID),
    FOREIGN KEY (StellvertreterID) REFERENCES MITARBEITER(GID)
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
    ProjektleiterID,
    Bezeichnung VARCHAR(100),
    Startdatum DATE,
    Enddatum DATE,
    ParentProjektID INT,
    PRIMARY KEY (ProjektID),
    FOREIGN KEY (ParentProjektID) REFERENCES PROJEKT(ProjektID),
    FOREIGN KEY (ProjektleiterID) REFERENCES MITARBEITER(PID)
);

CREATE TABLE PROJEKT_MITARBEITER(
    PMID INT NOT NULL,
    MitarbeiterID,
    Projektbeteiligung INT NOT NULL,
    Start_mitarbeit DATE,
    Ende_mitarbeit DATE,
    PRIMARY KEY (PMID)
);

CREATE TABLE ABTEILUNG(
    AID INT NOT NULL,
    Bezeichnung,
    Kurzbezeichnung,
    Abteilungsleiter,
    PRIMARY KEY (AID)
);

CREATE TABLE FERIEN(
    FID INT NOT NULL,
    Erster_Urlaubstag,
    Letzter_Urlaubstag,
    Mitarbeiter,
    STATUS,
    Genutzte_Ferientage,
    Beantragt_am,
    Genehmigung,
    Genehmigung_am,
    Storniert_am,
    PRIMARY KEY (FID)
);