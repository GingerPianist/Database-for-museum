/* Dla ka�dego stylu w sztuce podaj jakim cieszy si� on zainteresowaniem.
   W tym celu sporz�d� zestawienie dla ka�dego stylu odpowiednio:
   -jego dzie� sprzedanych w aukcjach
   -jego dzie� na wymianach w ca�ym okresie
   Podaj r�wnie� ile dzie� z ka�dego stylu muzeum obecnie posiada 
*/

--widok-- lista ID dziel sprzedanych
CREATE VIEW sprzedane_dziela
AS
  SELECT DISTINCT ID_dziela
  FROM   Oferty
         JOIN Aukcje
           ON Aukcje.ID_aukcji = Oferty.ID_aukcji
  WHERE  Data_zakonczenia < '2024-01-01'

go

SELECT Posiadane.Nazwa,
       Posiadane.[liczba sztuk w posiadaniu],
       Sprzedane.[liczba sztuk sprzedanych],
       Wymienione.[liczba sztuk wymienionych]
FROM   (SELECT Nazwa,--ile muezum posiada
               Count(*) "liczba sztuk w posiadaniu"
        FROM   Style
               JOIN Style_Dziela
                 ON Style.Nazwa = Style_Dziela.Nazwa_stylu
        WHERE  Style_dziela.ID_dziela NOT IN (SELECT ID_dziela
                                              FROM   Sprzedane_dziela)
        GROUP  BY nazwa) Posiadane
       LEFT JOIN (SELECT Style.Nazwa,--ile muzeum sprzeda�o
                         Count(*) "liczba sztuk sprzedanych"
                  FROM   Style
                         JOIN Style_Dziela
                           ON Style.Nazwa = Style_Dziela.Nazwa_stylu
                         JOIN Oferty
                           ON Style_Dziela.ID_dziela = Oferty.ID_dziela
                         JOIN Aukcje
                           ON Oferty.ID_aukcji = Aukcje.ID_aukcji
                  WHERE  Aukcje.Data_zakonczenia < '2024-01-01'
                  GROUP  BY Style.Nazwa) Sprzedane
              ON Posiadane.Nazwa = Sprzedane.Nazwa
       LEFT JOIN (SELECT Style.Nazwa,--ile muzeum da�o na wymiany
                         Count(*) "liczba sztuk wymienionych"
                  FROM   Style
                         JOIN Style_Dziela
                           ON Style.Nazwa = Style_Dziela.Nazwa_stylu
                         JOIN Wymiany
                           ON Style_dziela.ID_dziela = Wymiany.ID_dziela
                  GROUP  BY Style.Nazwa) Wymienione
              ON Posiadane.Nazwa = Wymienione.Nazwa
ORDER  BY Posiadane.Nazwa

DROP VIEW sprzedane_dziela 