SELECT DeelnemerNaam, ActiviteitTitel, Prijs
FROM platte_registratie
WHERE Prijs BETWEEN 10 AND 80
ORDER BY Prijs ASC;
