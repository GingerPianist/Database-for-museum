/*Klient domu aukcyjnego chcia�by zorientowa� si� 
  w obecnych ofertach aukcji.
  Sporz�d� zestawienie dzie� na aukcji 
  wraz z ich obecnymi cenami oraz autorami
*/

CREATE VIEW Licytowane
AS --zwraca ceny obecnie licytowanych dziel
  SELECT Oferty.ID_aukcji,
         Oferty.ID_dziela,
         Max(Cena) AS "Obecna cena"
  FROM   Oferty
         JOIN Aukcje
           ON Oferty.ID_aukcji = Aukcje.ID_aukcji
  WHERE  Aukcje.Data_zakonczenia > '2014-01-01' --dzisiejsza data
  GROUP  BY Oferty.ID_aukcji,
            Oferty.ID_dziela;

GO

SELECT Licytowane.*,
       Dziela_sztuki.Tytul,
       Dziela_sztuki.Rok,
       Autorzy.Imie,
       Autorzy.Nazwisko
FROM   Licytowane
       JOIN Dziela_sztuki
         ON Licytowane.ID_dziela = Dziela_sztuki.ID_dziela
       JOIN Autorzy
         ON Autorzy.ID_autora = Dziela_sztuki.ID_autora
ORDER BY ID_aukcji, ID_dziela

DROP VIEW Licytowane 