SELECT ActiviteitTitel, SUM(Prijs) AS TotaleOmzet
FROM platte_registratie
GROUP BY ActiviteitTitel
HAVING SUM(Prijs) > 50;
