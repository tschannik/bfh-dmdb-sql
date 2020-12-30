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
    AND Letzter_Urlaubstag >= NOW;

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
    DATEDIFF(YEAR, Eintrittsdatum, GetDate()) >= 10;

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
    MitarbeiterID,
    COUNT(*)
FROM
    MITARBEITER
    LEFT JOIN PROJEKT_MITARBEITER ON MITARBEITER.PID = PROJEKT_MITARBEITER.MitarbeiterID
GROUP BY
    PROJEKT_MITARBEITER.MitarbeiterID
ORDER BY
    Count(*)
LIMIT
    3;

/* Alle Mitarbeiter einer Gehaltsgrupper sowie das kalkulierte gehalt */