SELECT Deelnamevorm, COUNT(DeelnemerCode) AS TotaalGebruikt
FROM platte_registratie
GROUP BY Deelnamevorm;
