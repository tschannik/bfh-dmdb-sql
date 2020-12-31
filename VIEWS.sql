/* Creates Views for predefined selects */
CREATE VIEW MITARBEITER_IN_FERIEN AS
SELECT
    PNR,
    Name,
    Vorname,
    Erster_Urlaubstag,
    Letzter_Urlaubstag,
    GenehmigungsStatus,
    Genutzte_Ferientage
FROM
    Mitarbeiter
    LEFT JOIN FERIEN ON Mitarbeiter.PNR = FERIEN.MitarbeiterID
WHERE
    Erster_Urlaubstag <= NOW
    AND Letzter_Urlaubstag >= NOW
    AND GenehmigungsStatus = 2;

/* Alle Mitarbeiter die schon länger als 10 Jahre bei der Firma arbeiten inkl. Bonus */
CREATE VIEW MITARBEITER_10_JAHRE_ANGESTELLT AS
SELECT
    PNR,
    Name,
    Vorname,
    Bonus_Prozent,
    GEH * (1.00 + (1.00 * Bonus_Prozent / 100.00)) AS Gehalt
FROM
    MITARBEITER
    LEFT JOIN BONUS ON MITARBEITER.BonusID = BONUS.BID
    LEFT JOIN GEHALTSGRUPPE ON MITARBEITER.GehaltsgruppeID = GEHALTSGRUPPE.GID
WHERE
    DATEDIFF(YEAR, Eintrittsdatum, CURRENT_DATE) >= 10;

/* Minimales und Maximales gehalt der Abteilungsleiter */
CREATE VIEW MIN_MAX_GEHALT_ABTEILUNGSLEITER AS
SELECT
    ABTEILUNG.Kurzbezeichnung,
    ABTEILUNG.Bezeichnung,
    MITARBEITER.Name,
    MITARBEITER.Vorname,
    GEHALTSGRUPPE.GEH,
    GEHALTSGRUPPE.GID
FROM
    MITARBEITER
    LEFT JOIN GEHALTSGRUPPE ON GEHALTSGRUPPE.GID = MITARBEITER.GehaltsgruppeID
    LEFT JOIN ABTEILUNG ON ABTEILUNG.AID = MITARBEITER.AbteilungsID
    LEFT JOIN ABTEILUNGSLEITER ON ABTEILUNGSLEITER.MitarbeiterID = MITARBEITER.PNR
WHERE
    (
        GEHALTSGRUPPE.GEH IN (
            SELECT
                MIN(GEH)
            FROM
                GEHALTSGRUPPE
                INNER JOIN MITARBEITER ON MITARBEITER.GehaltsgruppeID = GEHALTSGRUPPE.GID
                INNER JOIN ABTEILUNGSLEITER ON MITARBEITER.PNR = ABTEILUNGSLEITER.MitarbeiterID
        )
        OR GEHALTSGRUPPE.GEH IN (
            SELECT
                MAX(GEH)
            FROM
                GEHALTSGRUPPE
                INNER JOIN MITARBEITER ON MITARBEITER.GehaltsgruppeID = GEHALTSGRUPPE.GID
                INNER JOIN ABTEILUNGSLEITER ON MITARBEITER.PNR = ABTEILUNGSLEITER.MitarbeiterID
        )
    )
    AND ABTEILUNGSLEITER.MitarbeiterID = MITARBEITER.PNR;

/* Die drei meist durch Projekte ausgelastetsten Mitarbeiter */
CREATE VIEW MITARBEITER_MEISTE_PROJEKTE AS
SELECT
    PNR,
    Name,
    Vorname,
    COUNT(*) AS Anzahl_Projekte
FROM
    MITARBEITER
    LEFT JOIN PROJEKT_MITARBEITER ON MITARBEITER.PNR = PROJEKT_MITARBEITER.MitarbeiterID
GROUP BY
    PNR,
    Name,
    Vorname
ORDER BY
    Count(*) DESC
LIMIT
    3;

/* Alle Mitarbeiter einer Gehaltsgrupper sowie das kalkulierte gehalt */
CREATE VIEW GEHALTSGRUPPE_20_UND_GEHALT AS
SELECT
    PNR,
    Name,
    Vorname,
    GEH * (1.00 + (1.00 * Bonus_Prozent / 100.00)) AS Kalkuliertes_Gehalt,
    Bonus_Prozent
FROM
    MITARBEITER
    LEFT JOIN GEHALTSGRUPPE ON MITARBEITER.GehaltsgruppeID = GEHALTSGRUPPE.GID
    LEFT JOIN BONUS ON MITARBEITER.BonusID = BONUS.BID
WHERE
    GID = 20;