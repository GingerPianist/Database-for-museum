/* Dykertor chce wiedzie� jakie miasta maj� aktualnie najwi�cej dzie� sztuki jego w�asno�ci.
Utw�rz zestawienie miast w kt�rych znajduje si� najwi�cej dzie� sztuki (na wystawach i
wymianach)
Zak�adamy �e dzisiajesza data to 01-01-2012
*/

SELECT Miasto,
       "Wymiany z miasta" AS "Obrazy w mie�cie"
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