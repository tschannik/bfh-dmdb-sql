/* Gehaltsgruppen */
INSERT INTO
    GEHALTSGRUPPE (GID, GEH)
VALUES
    (10, 3500),
    (11, 3750),
    (12, 4000),
    (13, 4250),
    (14, 4500),
    (15, 4750),
    (16, 5000),
    (17, 5250),
    (18, 5500),
    (19, 5750),
    (20, 6000);

/* Abteilungen */
INSERT INTO
    ABTEILUNG (
        AID,
        Bezeichnung,
        Kurzbezeichnung
    )
VALUES
    (1, 'Human Resources', 'HR'),
    (2, 'Information Technologies', 'IT'),
    (3, 'Mitarbeiter', 'MA'),
    (4, 'Konzernleitung', 'KL'),
    (5, 'Extern', 'EXT');

/* Bonus */
INSERT INTO
    BONUS (
        BID,
        Bonus_Prozent,
        ErhaltAbAnstellungszeit
    )
VALUES
    (1, -10, 1),
    (2, -5, 2),
    (3, 0, 3),
    (4, 5, 5),
    (5, 10, 7);

/* Mitarbeiter */
INSERT INTO
    MITARBEITER (
        PNR,
        Name,
        Vorname,
        Eintrittsdatum,
        AbteilungsID,
        GehaltsgruppeID,
        StellvertreterID,
        BonusID
    )
VALUES
    (
        1000,
        'Radi',
        'Karl',
        '2006-05-31',
        1,
        10,
        1001,
        3
    ),
    (
        1001,
        'Lette',
        'Adi',
        '2009-10-01',
        1,
        20,
        NULL,
        1
    ),
    (
        1002,
        'Theke',
        'Andi',
        '2020-10-01',
        2,
        11,
        1001,
        2
    ),
    (
        1003,
        'Nass',
        'Anna',
        '2004-10-01',
        3,
        13,
        NULL,
        3
    ),
    (
        1004,
        'Gator',
        'Alli',
        '2020-10-01',
        2,
        19,
        NULL,
        4
    ),
    (
        1005,
        'Schweis',
        'Axel',
        '2020-10-01',
        3,
        14,
        NULL,
        4
    ),
    (
        1006,
        'Silie',
        'Peter',
        '2020-10-01',
        4,
        20,
        NULL,
        5
    ),
    (
        1007,
        'Uhr',
        'Klaus',
        '2020-10-01',
        5,
        15,
        NULL,
        3
    ),
    (
        1008,
        'Steinfeger',
        'Shawn',
        '2020-10-01',
        3,
        10,
        NULL,
        4
    ),
    (
        1009,
        'Lung',
        'Sam',
        '2020-10-01',
        1,
        20,
        NULL,
        4
    );

/* Projekte */
INSERT INTO
    PROJEKT (
        ProjektID,
        Bezeichnung,
        Startdatum,
        Enddatum,
        ParentProjektID,
        ProjektleiterID
    )
VALUES
    (
        1,
        'Backup des Internets erstellen',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1000
    ),
    (
        2,
        'Neuinstallation Heizungsanlagen aufgrund von Explosion nach Verwendung des falschen Schmiermittels',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1001
    ),
    (
        3,
        'KI welche aufgrund der aktuellen Gefühlslage die perfekte Netflix-Serie vorschlägt',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1000
    ),
    (
        4,
        'Einführung weltweit einheitlicher Steckdosen',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1002
    ),
    (
        5,
        'Definition des Standards für neue Steckdosen',
        '2020-10-20',
        '2021-10-20',
        4,
        1002
    ),
    (
        6,
        'Verlohrene Nadeln im Heuhaufen suchen',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1003
    ),
    (
        7,
        'Schäfchen zählen',
        '2020-10-20',
        '2021-10-20',
        NULL,
        1004
    );

/* Projekt Mitarbeiter */
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
    (1001, 2, 100, '2020-10-01', '2020-11-01'),
    (1002, 2, 100, '2020-10-01', '2020-11-01'),
    (1003, 2, 100, '2020-10-01', '2020-11-01'),
    (1004, 3, 100, '2020-10-01', '2020-11-01'),
    (1005, 4, 100, '2020-10-01', '2020-11-01'),
    (1005, 1, 100, '2020-10-01', '2020-11-01'),
    (1005, 2, 100, '2020-10-01', '2020-11-01'),
    (1005, 3, 100, '2020-10-01', '2020-11-01'),
    (1005, 5, 100, '2020-10-01', '2020-11-01'),
    (1006, 5, 100, '2020-10-01', '2020-11-01'),
    (1007, 6, 100, '2020-10-01', '2020-11-01'),
    (1008, 6, 100, '2020-10-01', '2020-11-01'),
    (1009, 3, 100, '2020-10-01', '2020-11-01'),
    (1009, 4, 100, '2020-10-01', '2020-11-01'),
    (1009, 2, 100, '2020-10-01', '2020-11-01'),
    (1009, 1, 100, '2020-10-01', '2020-11-01');

/* Abteilungsleiter */
INSERT INTO
    ABTEILUNGSLEITER(ATID, MitarbeiterID, AbteilungsID)
VALUES
    (1, 1000, 1),
    (2, 1002, 2),
    (3, 1003, 3),
    (4, 1004, 4),
    (5, 1005, 5);

INSERT INTO
    FERIEN(
        FID,
        Erster_Urlaubstag,
        Letzter_Urlaubstag,
        MitarbeiterID,
        GenehmigungsStatus,
        Genutzte_Ferientage,
        Beantragt_am,
        Genehmigung_am,
        Storniert_am
    )
VALUES
    (
        1,
        '2021-01-04',
        '2021-01-15',
        1008,
        2,
        10,
        '2020-12-01',
        '2020-12-03',
        NULL
    ),
    (
        2,
        '2020-12-29',
        '2021-01-15',
        1009,
        2,
        13,
        '2020-12-01',
        '2020-12-03',
        NULL
    ),
    (
        3,
        '2021-01-05',
        '2021-01-15',
        1007,
        2,
        9,
        '2020-12-01',
        '2020-12-03',
        NULL
    ),
    (
        4,
        '2021-01-05',
        '2021-01-15',
        1002,
        1,
        9,
        '2020-12-01',
        NULL,
        NULL
    ),
    (
        5,
        '2020-01-05',
        '2020-01-15',
        1001,
        1,
        9,
        '2020-12-01',
        NULL,
        NULL
    );