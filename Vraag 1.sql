SELECT TOP 5 
    CONCAT(DeelnemerNaam, ' (', DeelnemerType, ')') AS DeelnemerInfo, 
    ActiviteitTitel, 
    Aanmelddatum
FROM platte_registratie
ORDER BY Aanmelddatum DESC;


