SELECT DeelnemerType, 
       AVG(Prijs) AS GemiddeldePrijs, 
       MIN(Prijs) AS LaagstePrijs, 
       MAX(Prijs) AS HoogstePrijs
FROM platte_registratie
GROUP BY DeelnemerType;
