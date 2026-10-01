SELECT Locatie, COUNT(DeelnemerCode) AS AantalBevestigd
FROM platte_registratie
WHERE AanmeldStatus = 'Bevestigd'
GROUP BY Locatie
HAVING COUNT(DeelnemerCode) >= 2;
