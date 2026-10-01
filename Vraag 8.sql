SELECT DeelnemerNaam, ActiviteitTitel, Prijs
FROM platte_registratie
WHERE DeelnemerType = 'Student' 
  AND Prijs = 0 
  AND AanmeldStatus = 'Bevestigd';
