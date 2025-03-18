/*W³aœciciel chce wiedzieæ kto jest sta³ym klientem aukcji.
W tym celu utwórz zestawienie klientów, którzy zakupili najwiêcej 
dzie³ sztuki z Baroku przez ostatnie 10 lat*/

CREATE VIEW Wylicytowane
AS --zwraca ceny wylicytowanych dziel na zakonczonych aukcjach
  SELECT Oferty.ID_aukcji,
         Oferty.ID_dziela,
         Max(Cena) AS "Cena sprzedazy"
  FROM   Oferty
         JOIN Aukcje
           ON Oferty.ID_aukcji = Aukcje.ID_aukcji
  WHERE  Aukcje.Data_rozpoczecia >= '2014-01-01'
         AND Aukcje.Data_zakonczenia <= '2024-01-01'
  GROUP  BY Oferty.ID_aukcji,
            Oferty.ID_dziela;

GO

SELECT TOP 10 Klienci.Imie,
              Klienci.Nazwisko,
              Count(*) AS Ile_kupil
FROM   Klienci
       JOIN (SELECT Oferty.ID_klienta
             FROM   Oferty
                    JOIN Wylicytowane
                      ON Oferty.ID_aukcji = Wylicytowane.ID_aukcji
                         AND Oferty.ID_dziela = Wylicytowane.ID_dziela)
            Kto_licytowal
         ON Klienci.ID_klienta = Kto_licytowal.ID_klienta
GROUP  BY Imie,
          Nazwisko
ORDER  BY Ile_kupil DESC

DROP VIEW Wylicytowane; 