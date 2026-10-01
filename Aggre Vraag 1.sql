SELECT ActiviteitTitel, COUNT(DeelnemerCode) AS AantalAanmeldingen
FROM platte_registratie
GROUP BY ActiviteitTitel;
