/* Drop foreignkeys first */
-- ALTER TABLE
--     FERIEN DROP INDEX FK_Mitarbeiter_Ferien;
-- ALTER TABLE
--     ABTEILUNG DROP INDEX FK_Abteilungsleiter;
-- ALTER TABLE
--     PROJEKT_MITARBEITER DROP INDEX FK_Projekt;
-- ALTER TABLE
--     PROJEKT_MITARBEITER DROP INDEX FK_Mitarbeiter_Projekt_Mitarbeiter;
-- ALTER TABLE
--     PROJEKT DROP INDEX FK_Projektleiter;
-- ALTER TABLE
--     PROJEKT DROP INDEX FK_ParentProjekt;
-- ALTER TABLE
--     MITARBEITER DROP INDEX FK_Stellvertreter;
-- ALTER TABLE
--     MITARBEITER DROP INDEX FK_Abteilung;
-- ALTER TABLE
--     MITARBEITER DROP INDEX FK_Gehaltsgruppe;
/* Drop existing tables*/
SET
    foreign_key_checks = 0;

DROP TABLE IF EXISTS MITARBEITER;

DROP TABLE IF EXISTS PROJEKT;

DROP TABLE IF EXISTS ABTEILUNG;

DROP TABLE IF EXISTS GEHALTSGRUPPE;

DROP TABLE IF EXISTS FERIEN;

DROP TABLE IF EXISTS PROJEKT_MITARBEITER;

DROP TABLE IF EXISTS MITARBEITER_BONUS;

SET
    foreign_key_checks = 1;

CREATE TABLE MITARBEITER(
    PID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Eintrittsdatum DATE NOT NULL,
    AbteilungsID INT NOT NULL,
    GehaltsgruppeID INT NOT NULL,
    StellvertreterID INT,
    PRIMARY KEY (PID),
    CONSTRAINT PID_LENGTH CHECK (
        PID BETWEEN 1000
        AND 9999
    )
);

CREATE TABLE MITARBEITER_BONUS(
    MBID INT NOT NULL,
    MitarbeiterID INT NOT NULL,
    Kalenderjahr DATE NOT NULL,
    Bonus INT DEFAULT 0,
    PRIMARY KEY (MBID),
    CONSTRAINT Bonus_LENGTH CHECK (
        Bonus BETWEEN - 10
        AND 10
    )
);

CREATE TABLE GEHALTSGRUPPE(
    GID INT NOT NULL,
    /* Standardgehalt */
    GEH VARCHAR(20) NOT NULL,
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
    UNIQUE (MitarbeiterID, ProjektID),
    CONSTRAINT Projektbeteiligung_LENGTH CHECK (
        Projektbeteiligung BETWEEN 0
        AND 100
    )
);

CREATE TABLE ABTEILUNG(
    AID INT NOT NULL,
    Bezeichnung VARCHAR(50),
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
    CONSTRAINT FK_Gehaltsgruppe FOREIGN KEY (GehaltsgruppeID) REFERENCES GEHALTSGRUPPE(GID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    MITARBEITER
ADD
    CONSTRAINT FK_Abteilung FOREIGN KEY (AbteilungsID) REFERENCES ABTEILUNG(AID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    MITARBEITER
ADD
    CONSTRAINT FK_Stellvertreter FOREIGN KEY (StellvertreterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    MITARBEITER_BONUS
ADD
    CONSTRAINT FK_Mitarbeiter_ID_Bonus FOREIGN KEY (MitarbeiterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    PROJEKT
ADD
    CONSTRAINT FK_ParentProjekt FOREIGN KEY (ParentProjektID) REFERENCES PROJEKT(ProjektID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    PROJEKT
ADD
    CONSTRAINT FK_Projektleiter FOREIGN KEY (ProjektleiterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    PROJEKT_MITARBEITER
ADD
    CONSTRAINT FK_Mitarbeiter_Projekt_Mitarbeiter FOREIGN KEY (MitarbeiterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    PROJEKT_MITARBEITER
ADD
    CONSTRAINT FK_Projekt FOREIGN KEY (ProjektID) REFERENCES PROJEKT(ProjektID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    ABTEILUNG
ADD
    CONSTRAINT FK_Abteilungsleiter FOREIGN KEY (AbteilungsleiterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    FERIEN
ADD
    CONSTRAINT FK_Mitarbeiter_Ferien FOREIGN KEY (MitarbeiterID) REFERENCES MITARBEITER(PID) ON DELETE NO ACTION ON UPDATE NO ACTION;