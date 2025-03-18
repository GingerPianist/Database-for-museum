/* Dykertor chce wiedzieæ jakie miasta maj¹ aktualnie najwiêcej dzie³ sztuki jego w³asnoœci.
Utwórz zestawienie miast w których znajduje siê najwiêcej dzie³ sztuki (na wystawach i
wymianach)
Zak³adamy ¿e dzisiajesza data to 01-01-2012
*/

SELECT Miasto,
       "Wymiany z miasta" AS "Obrazy w mieœcie"
FROM   (SELECT Miasto,
               Count(*) AS "Wymiany z miasta"
        FROM   Muzea
               JOIN Wymiany
                 ON Muzea.NIP = Wymiany.NIP_Muzeum
        WHERE  Wymiany.Data_zakonczenia > '2012-01-01'
        GROUP  BY Miasto
        UNION ALL
        SELECT Miasto,
               Count(*) AS "Wystawy z miasta"
        FROM   Filie
               JOIN Wystawy
                 ON Filie.NIP = Wystawy.NIP_filii
        WHERE  Wystawy.Data_zakonczenia > '2012-01-01'
        GROUP  BY Miasto) wynik_podzapytania; 