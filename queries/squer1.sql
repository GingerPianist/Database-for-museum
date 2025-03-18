/*W³aœciciel muzeum chce siê dowiedzieæ jakie dzie³a generuj¹ najwiêksze
zainteresowanie. Sporz¹dŸ zestawienie autorów, których dzie³ by³o najwiêcej
na najczêœciej odwiedzanej (l. sprzedanych biletów) 
wystawie.*/

SELECT TOP 3 Autorzy.Imie,
             Autorzy.Nazwisko,
             Wystawy.Sprzedane_bilety,
             Count(*) AS "Ile obrazow tego autora"
FROM   Autorzy
       JOIN Dziela_sztuki
         ON Autorzy.ID_Autora = Dziela_sztuki.ID_Autora
       JOIN Dziela_Wystawy
         ON Dziela_sztuki.ID_Dziela = Dziela_Wystawy.ID_Dziela
       JOIN Wystawy
         ON Dziela_Wystawy.ID_Wystawy = Wystawy.ID_Wystawy
WHERE  Wystawy.ID_wystawy IN (SELECT TOP 1 ID_wystawy
                              FROM   Wystawy
                              ORDER  BY Sprzedane_bilety DESC)
GROUP  BY Autorzy.Imie,
          Autorzy.Nazwisko,
          Wystawy.Sprzedane_bilety 