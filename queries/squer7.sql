/*  Koordynator chce zorganizowaæ wystawê dzie³ sztuki dawnej (tj. Renesansu i Baroku)
Podaj listê dzie³ (w postaci ich numerów ID) z tego okresu, które nie s¹ obecnie na licytacji
ani nie zosta³y sprzedane oraz nie s¹ obecnie na wymianie.
*/

SELECT Style_dziela.ID_dziela, 
	   Dziela_sztuki.Tytul,
	   Autorzy.Imie,
	   Autorzy.Nazwisko
FROM   Style
       JOIN Style_dziela
         ON Style.Nazwa = Style_Dziela.Nazwa_stylu
       JOIN Wymiany
         ON Style_Dziela.ID_dziela = Wymiany.ID_dziela
	   JOIN Dziela_sztuki
	     ON Style_Dziela.ID_dziela = Dziela_sztuki.ID_dziela
	   JOIN Autorzy
	     ON Dziela_sztuki.ID_autora = Autorzy.ID_autora
WHERE  Style.Nazwa IN ( 'Barok', 'Renesans' )
       AND Style_dziela.ID_dziela NOT IN (SELECT ID_dziela
                                          FROM   Wymiany
                                          WHERE  Data_zakonczenia > '2024-01-01'
                                         )
       AND Style_Dziela.ID_dziela NOT IN (SELECT ID_dziela
                                          FROM   Dziela_Aukcje
                                                 JOIN Aukcje
                                                   ON Dziela_Aukcje.ID_aukcji = Aukcje.ID_aukcji
                                          WHERE Aukcje.Data_zakonczenia > '2024-01-01'
                                         ) 
ORDER BY ID_dziela