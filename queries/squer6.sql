/*Oblicz œredni zysk z ka¿dej aukcji, zak³adaj¹c, ¿e muzeum kupi³o
ka¿dy obraz po cenie "cena wywo³awcza" */

CREATE VIEW wylicytowane_wywolawcze
AS
  SELECT Wylicytowane.ID_aukcji,
         Wylicytowane.ID_dziela,
         Max(Wylicytowane."Cena sprzedazy") AS "Cena sprzedazy",
         Ceny_wywolawcze.Wartosc            AS "Cena wywolawcza"
  FROM   (SELECT Oferty.ID_aukcji,
                 Oferty.ID_dziela,
                 Max(Cena) AS "Cena sprzedazy"
          FROM   Oferty
                 JOIN Aukcje
                   ON Oferty.ID_aukcji = Aukcje.ID_aukcji
          WHERE  Aukcje.Data_rozpoczecia >= '2014-01-01'
                 AND Aukcje.Data_zakonczenia <= '2024-01-01'
          GROUP  BY Oferty.ID_aukcji,
                    Oferty.ID_dziela) Wylicytowane
         JOIN Ceny_wywolawcze
           ON Wylicytowane.ID_dziela = Ceny_wywolawcze.ID_dziela
  GROUP  BY Wylicytowane.ID_aukcji,
            Wylicytowane.ID_dziela,
            Ceny_wywolawcze.Wartosc

GO

SELECT Aukcje.Nazwa,
       Tabela_zyski.ID_aukcji,
       Avg(Tabela_zyski.Zysk) AS "Œredni zysk z aukcji"
FROM   (SELECT ID_aukcji,
               ID_dziela,
               "Cena sprzedazy" - "Cena wywolawcza" AS Zysk
        FROM   Wylicytowane_wywolawcze) Tabela_zyski
       JOIN Aukcje
         ON Tabela_zyski.ID_aukcji = Aukcje.ID_aukcji
GROUP  BY Tabela_zyski.ID_aukcji,
          Aukcje.Nazwa
ORDER BY ID_aukcji

DROP VIEW wylicytowane_wywolawcze; 