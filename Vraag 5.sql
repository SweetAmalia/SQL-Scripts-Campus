SELECT DeelnemerNaam, DeelnemerType
FROM platte_registratie
WHERE DeelnemerType IN ('Student', 'Externe');
