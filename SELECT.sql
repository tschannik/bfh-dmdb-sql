/* Alle Mitarbeiter die in den Ferien sind */
SELECT
    PID,
    Name,
    Vorname,
    Erster_Urlaubstag,
    Letzter_Urlaubstag,
    GenehmigungsStatus
FROM
    Mitarbeiter
    LEFT JOIN FERIEN ON Mitarbeiter.PID = FERIEN.MitarbeiterID
WHERE
    Erster_Urlaubstag <= NOW
    AND Letzter_Urlaubstag >= NOW
    AND GenehmigungsStatus = 2;

/* Alle Mitarbeiter die schon länger als 10 Jahre bei der Firma arbeiten inkl. Bonus */
SELECT
    PID,
    Name,
    Vorname,
    Bonus_Prozent
FROM
    MITARBEITER
    LEFT JOIN BONUS ON MITARBEITER.BonusID = BONUS.BID
WHERE
    DATEDIFF(YEAR, Eintrittsdatum, CURRENT_DATE) >= 10;

/* Minimales und Maximales gehalt der Abteilungsleiter */
SELECT
    Name,
    Vorname,
    GEH
FROM
    MITARBEITER
    LEFT JOIN GEHALTSGRUPPE ON GEHALTSGRUPPE.GID = MITARBEITER.GehaltsgruppeID
    LEFT JOIN ABTEILUNGSLEITER ON ABTEILUNGSLEITER.ATID = MITARBEITER.PID
WHERE
    GEHALTSGRUPPE.GEH IN (
        SELECT
            MIN(GEH)
        FROM
            GEHALTSGRUPPE
    )
    OR GEHALTSGRUPPE.GEH IN (
        SELECT
            MAX(GEH)
        FROM
            GEHALTSGRUPPE
    );

/* Die drei meist durch Projekte ausgelastetsten Mitarbeiter */
SELECT
    PID,
    Name,
    Vorname,
    COUNT(*)
FROM
    MITARBEITER
    LEFT JOIN PROJEKT_MITARBEITER ON MITARBEITER.PID = PROJEKT_MITARBEITER.MitarbeiterID
GROUP BY
    PID,
    Name,
    Vorname
ORDER BY
    Count(*) DESC
LIMIT
    3;

/* Alle Mitarbeiter einer Gehaltsgrupper sowie das kalkulierte gehalt */
SELECT
    PID,
    Name,
    Vorname,
    GEH * (1.00 + (1.00 * Bonus_Prozent / 100.00)) AS Gehalt,
    Bonus_Prozent
FROM
    MITARBEITER
    LEFT JOIN GEHALTSGRUPPE ON MITARBEITER.GehaltsgruppeID = GEHALTSGRUPPE.GID
    LEFT JOIN BONUS ON MITARBEITER.BonusID = BONUS.BID
WHERE
    GID = 20;