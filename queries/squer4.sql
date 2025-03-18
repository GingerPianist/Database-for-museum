/*Znajdz dzielo ktore jest najdro¿ej licytowane 
na trwaj¹cej obecnie aukcji*/
CREATE VIEW najwyzsze_ceny --zwraca najwyzsze ceny dziel na trwajacych aukcjach
AS
  SELECT Oferty.ID_aukcji,
         Oferty.ID_dziela,
         Max(Cena) AS "Cena sprzedazy"
  FROM   Oferty
         JOIN Aukcje
           ON Oferty.ID_aukcji = Aukcje.ID_aukcji
  WHERE  Aukcje.Data_zakonczenia >= '2024-01-22'
  GROUP  BY Oferty.ID_aukcji,
            Oferty.ID_dziela;

GO

SELECT TOP 1 Najwyzsze_ceny.ID_aukcji,
             Aukcje.Nazwa,
             Najwyzsze_ceny.ID_dziela,
             Dziela_sztuki.Tytul,
             Najwyzsze_ceny.[Cena sprzedazy],
			 Autorzy.Imie,
			 Autorzy.Nazwisko
FROM   Najwyzsze_ceny
       JOIN Aukcje
         ON Najwyzsze_ceny.ID_aukcji = Aukcje. ID_aukcji
       JOIN Dziela_sztuki
         ON Najwyzsze_ceny.ID_dziela = Dziela_sztuki. ID_dziela
	   JOIN Autorzy
	     ON Dziela_sztuki.ID_autora = Autorzy.ID_autora

DROP VIEW najwyzsze_ceny; 