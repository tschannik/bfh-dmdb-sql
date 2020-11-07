/* Gehaltsgruppen */
INSERT INTO
    GEHALTSGRUPPE (GID, GEH)
VALUES
    (1, 'Lohngruppe 1'),
    (2, 'Lohngruppe 2'),
    (3, 'Lohngruppe 3'),
    (4, 'Lohngruppe 4'),
    (5, 'Lohngruppe 5'),
    (6, 'Lohngruppe 6'),
    (7, 'Lohngruppe 7'),
    (8, 'Lohngruppe 8'),
    (9, 'Lohngruppe 9'),
    (10, 'Lohngruppe 10');

/* Abteilungen */
INSERT INTO
    ABTEULUNG (AID, Bezeichnung, Kurzbezeichnung)
VALUES
    (1, 'Human Resources', 'HR'),
    (2, 'Information Technologies', 'IT'),
    (3, 'Mitarbeiter', 'MA'),
    (4, 'Konzernleitung', 'KL'),
    (5, 'Extern', 'EXT');

/* Projekte */
INSERT INTO
    PROJEKT (
        ProjektID,
        Bezeichnung,
        Startdatum,
        Enddatum,
        ParentProjektID
    )
VALUES
    (
        1,
        'Backup des Internets erstellen',
        '2020-10-20',
        '2021-10-20',
        NULL
    ),
    (
        2,
        'Neuinstallation Heizungsanlagen aufgrund von Explosion nach Verwendung des falschen Schmiermittels',
        '2020-10-20',
        '2021-10-20',
        NULL
    ),
    (
        3,
        'KI welche aufgrund der aktuellen Gefühlslage die perfekte Netflix-Serie vorschlägt',
        '2020-10-20',
        '2021-10-20',
        NULL
    ),
    (
        4,
        'Einführung weltweit einheitlicher Steckdosen',
        '2020-10-20',
        '2021-10-20',
        NULL
    ),
    (
        5,
        'Verlohrene Nadeln im Heuhaufen suchen',
        '2020-10-20',
        '2021-10-20',
        NULL
    ),
    (
        6,
        'Schäfchen zählen',
        '2020-10-20',
        '2021-10-20',
        NULL
    );

/* Mitarbeiter */
INSERT INTO
    MITARBEITER (PID, Name, Vorname, Eintrittsdatum, Bonus)
VALUES
    (1000, 'Radi', 'Karl', '2020-10-01', 0),
    (1001, 'Lette', 'Adi', '2020-10-01', 0),
    (1002, 'Theke', 'Andi', '2020-10-01', 0),
    (1003, 'Nass', 'Anna', '2020-10-01', 0),
    (1004, 'Gator', 'Alli', '2020-10-01', 0),
    (1005, 'Schweis', 'Axel', '2020-10-01', 0),
    (1006, 'Silie', 'Peter', '2020-10-01', 0),
    (1007, 'Uhr', 'Klaus', '2020-10-01', 0),
    (1008, 'Steinfeger', 'Shawn', '2020-10-01', 0),
    (1009, 'Lung', 'Sam', '2020-10-01', 0);

/* Mitarbeiter */
INSERT INTO
    PROJEKT_MITARBEITER (
        MitarbeiterID,
        ProjektID,
        Projektbeteiligung,
        Start_mitarbeit,
        Ende_mitarbeit
    )
VALUES
    (1000, 1, 100, '2020-10-01', '2020-11-01'),
    (1001, 1, 100, '2020-10-01', '2020-11-01'),
    (1002, 2, 100, '2020-10-01', '2020-11-01'),
    (1003, 2, 100, '2020-10-01', '2020-11-01'),
    (1004, 3, 100, '2020-10-01', '2020-11-01'),
    (1005, 4, 100, '2020-10-01', '2020-11-01'),
    (1006, 5, 100, '2020-10-01', '2020-11-01'),
    (1007, 6, 100, '2020-10-01', '2020-11-01'),
    (1008, 6, 100, '2020-10-01', '2020-11-01'),
    (1009, 7, 100, '2020-10-01', '2020-11-01');

-- INSERT INTO
--     MITARBEITER (PID, Name, Vorname, Eintrittsdatum, Bonus)
-- VALUES
--     (1000, 'Radi', 'Karl', '2020-10-01', 0),
--     (1001, 'Lette', 'Adi', '2020-10-01', 0),
--     (1002, 'Theke', 'Andi', '2020-10-01', 0),
--     (1003, 'Nass', 'Anna', '2020-10-01', 0),
--     (1004, 'Gator', 'Alli', '2020-10-01', 0),
--     (1005, 'Schweis', 'Axel', '2020-10-01', 0),
--     (1006, 'Silie', 'Peter', '2020-10-01', 0),
--     (1007, 'Uhr', 'Klaus', '2020-10-01', 0),
--     (1008, 'Steinfeger', 'Shawn', '2020-10-01', 0),
--     (1009, 'Lung', 'Sam', '2020-10-01', 0);
--     CREATE TABLE FERIEN(
--     FID INT NOT NULL,
--     Erster_Urlaubstag DATE NOT NULL,
--     Letzter_Urlaubstag DATE NOT NULL,
--     MitarbeiterID INT NOT NULL,
--     GenehmigungsStatus INT NOT NULL,
--     Genutzte_Ferientage INT,
--     Beantragt_am DATE,
--     Genehmigung BOOLEAN,
--     Genehmigung_am DATE,
--     Storniert_am DATE,
--     PRIMARY KEY (FID),
--     CONSTRAINT GenehmigungsStatus_Check CHECK (
--         GenehmigungsStatus BETWEEN 1
--         AND 4
--     )
-- );