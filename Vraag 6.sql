SELECT DeelnemerNaam, AanmeldStatus, Opleiding
FROM platte_registratie
WHERE Opleiding IS NULL 
  AND AanmeldStatus NOT IN ('Geannuleerd', 'Wachtlijst');
