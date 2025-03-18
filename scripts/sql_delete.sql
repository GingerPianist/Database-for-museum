select * from Aukcje;
select * from Dziela_Aukcje;
select * from Oferty;

--Usuwanie historii aukcji przed 2009 rokiem
DELETE FROM Aukcje
WHERE ID_aukcji IN
(SELECT ID_aukcji FROM Aukcje 
	WHERE Data_zakonczenia < '2009-01-01'); 

select * from Aukcje;
select * from Dziela_Aukcje;
select * from Oferty;


select * from Style;
select * from Style_Dziela;
--Zmiana nazwy stylu z Renesans na ODRODZENIE
UPDATE Style
SET Nazwa = 'ODRODZENIE'
	WHERE Nazwa = 'Renesans';

select * from Style;
select * from Style_Dziela;
