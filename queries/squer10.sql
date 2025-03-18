/*W³aœciciel muzeum chce siê dowiedzieæ jakie dzie³a generuj¹ najwiêksze
zainteresowanie. Sporz¹dŸ zestawienie autorów, których dzie³ by³o najwiêcej
na najczêœciej odwiedzanej (l. sprzedanych biletów) 
wystawie ---w ka¿dym roku---*/

SELECT Wystawy.ID_wystawy,
       Wystawy.Nazwa,
       Year(Wystawy.Data_zakonczenia) AS "Rok zakonczenia wystawy",
       Max(Wystawy.Sprzedane_bilety)  AS "Sprzedane_bilety",
       Autorzy.Imie,
       Autorzy.Nazwisko,
       Count(*)                       AS "Ile obrazow tego autora"
FROM   Wystawy
       JOIN Dziela_Wystawy
         ON Wystawy.ID_wystawy = Dziela_Wystawy.ID_wystawy
       JOIN Dziela_sztuki
         ON Dziela_Wystawy.ID_dziela = Dziela_sztuki.ID_dziela
       JOIN Autorzy
         ON Dziela_sztuki.ID_autora = Autorzy.ID_autora
WHERE  Year(Wystawy.Data_zakonczenia) <= '2023'
GROUP  BY Year(Wystawy.Data_zakonczenia),
          Wystawy.Nazwa,
          Wystawy.ID_wystawy,
          Autorzy.Imie,
          Autorzy.Nazwisko
HAVING Max(Wystawy.Sprzedane_bilety) IS NOT NULL
ORDER  BY ID_wystawy,
          "Ile obrazow tego autora" DESC 