/*W�a�ciciel muzeum chce si� dowiedzie� jakie dzie�a generuj� najwi�ksze
zainteresowanie. Sporz�d� zestawienie autor�w, kt�rych dzie� by�o najwi�cej
na najcz�ciej odwiedzanej (l. sprzedanych bilet�w) 
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