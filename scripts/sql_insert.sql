INSERT INTO MozliweUlice
(Ulica)
VALUES
	('Aleje Jerozolimskie'),
	('Florianska'),
	('D�uga'),
	('�widnicka'),
	('Wielka'),
	('Mariacka'),
	('Piotrkowska'),
	('Monte Cassino'),
	('Gda�ska'),
	('Stary Rynek'),
	('Starowiejska');

INSERT INTO MozliweTypyDziel
(Typ)
VALUES
	('malarstwo'),
	 ('rzezba'),
	 ('instalacja'),
	 ('grafika'), 
	 ('sztuka cyfrowa'), 
	 ('fotografia'),
	 ('fresk'),
	 ('sztuka gipsowa'),
	 ('statuetki'),
	 ('architektura');


INSERT INTO Autorzy
	( [Imie], [Nazwisko], [Pseudonim], [Rok_urodzenia], [Rok_smierci])
VALUES
	( 'Leonardo', 'da Vinci',NULL, '1452', '1519'),
	( 'Micha�', 'Anio�',NULL, '1475', '1564'),
	( 'Michelangelo', 'de Caravaggio','Caravaggio', '1571', '1610'),
	( 'Diego', 'Velasquez',NULL, '1599', '1660'),
	( 'Eugene', 'Delacroix',NULL, '1798', '1863'),
	( 'Claude', 'Monet',NULL, '1840', '1926'),
	( 'Vincent', 'van Gogh',NULL, '1853', '1890'),
	( 'Jan', 'Matejko',NULL, '1838', '1892'),
	( 'Jacek', 'Malczewski',NULL, '1854', '1929'),
	( 'Stans�aw', 'Witkiewicz','Witkacy', '1885', '1939'),
	( 'Anna', 'van Gogh',NULL, '1853', '1890'),
	( 'Krzysztof', 'Matejko',NULL, '1838', '1892'),
	( 'Janiczek', 'Malczewski',NULL, '1854', '1929'),
	( 'Alan', 'Witkiewicz','labniks', '1885', '1939'),
	( 'Monika', 'Matejko',NULL, '1838', '1892'),
	( 'Sara', 'Malczewski',NULL, '1854', '1929'),
	( 'Alaninos', 'Witkiewicz','Ominok', '1885', '1939'),
	( 'Monika', 'Zarudzka',NULL, '1838', '1892'),
	( 'Sara', 'Konieczna',NULL, '1854', '1929'),
	( 'Alaninos', 'Witkiz','Zerba', '1885', '1939');


INSERT INTO Dziela_sztuki (ID_autora, Tytul, Rok, Typ, Stanowisko)
VALUES
    (1, 'Mona Lisa', 1106, 'Malarstwo', 1),
    (1, 'Ostatnia wieczerza', 1198, 'Malarstwo', 32),
    (1, 'Martwa natura', 1098, 'Malarstwo', 36),
    (1, 'Kolacja', 1698, 'Malarstwo', 39),
    (1, 'Krajobraz', 1898, 'Malarstwo', 31),
    (2, 'Dawid', 1504, 'Rzezba', 10),
    (3, 'Zawo�anie �w. Mateusza', 1600, 'Malarstwo', 32),
    (4, 'Panny dworskie', 1656, 'Malarstwo', 22),
    (4, 'Infantka Ma�gorzata', 1659, 'Malarstwo', 23),
    (5, 'Wolno�� wiod�ca lud na barykady', 1830, 'Malarstwo', 56),
    (5, 'Portret Chopina', 1838, 'Malarstwo', 57),
    (6, 'Impresja, wsch�d s�o�ca', 1872, 'Malarstwo', 93),
    (7, 'S�oneczniki', 1888, 'Malarstwo', 2),
    (8, 'Bitwa pod Grunwaldem', 1878, 'Malarstwo', 109),
    (9, 'Hamlet polski', 1903, 'Malarstwo', 68),
    (10, 'Autoportret ze �mierci� graj�c� na skrzypcach', 1922, 'Malarstwo', 59),
	(8, 'Tytul malasrtwa', 1878, 'Malarstwo', 109),
    (9, 'Hamlet angielski', 1903, 'Malarstwo', 68),
    (10, 'Autoportret ze kobiet� graj�c� na skrzypcach', 1922, 'Malarstwo', 59);


INSERT INTO Style (Nazwa, Rok_rozpoczecia, Rok_zakonczenia)
VALUES
	('Renesans', 1400, 1600),
	('Barok', 1400, 1600),
    ('Romantyzm', 1780, 1880),
    ('Impresjonizm', 1860, 1880),
    ('Postimpresjonizm', 1880, 1905),
    ('Malarstwo historyczne', 1800, 1900),  
    ('Symbolizm', 1880, 1910),
    ('Ekspresjonizm', 1905, 1920),
    ('Malarstwo abstrakcyjne', 1910, 1950),
	('Malarstwo olejne', 0,3000),
	('Malarstwo freskowe', 0,3000),
	('Malarstwo olejne na p��tnie', 0,3000),
	('Tempera', 0,3000);

INSERT INTO Style_Dziela(ID_dziela, Nazwa_stylu)
VALUES
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa'),'Renesans'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa'),'Malarstwo olejne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa'),'Malarstwo olejne na p��tnie'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Ostatnia wieczerza'),'Malarstwo freskowe'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Ostatnia wieczerza'),'Renesans'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Zawo�anie �w. Mateusza'),'Barok'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Zawo�anie �w. Mateusza'),'Malarstwo olejne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Zawo�anie �w. Mateusza'),'Malarstwo olejne na p��tnie'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Panny dworskie'),'Barok'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Panny dworskie'),'Malarstwo olejne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Infantka Ma�gorzata'),'Barok'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Infantka Ma�gorzata'),'Tempera'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Wolno�� wiod�ca lud na barykady'),'Romantyzm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Wolno�� wiod�ca lud na barykady'),'Tempera'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Portret Chopina'),'Romantyzm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Portret Chopina'),'Malarstwo historyczne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Impresja, wsch�d s�o�ca'),'Impresjonizm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki'),'Postimpresjonizm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki'),'Malarstwo olejne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Bitwa pod Grunwaldem'),'Malarstwo historyczne'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Bitwa pod Grunwaldem'),'Romantyzm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Hamlet polski'),'Symbolizm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Autoportret ze �mierci� graj�c� na skrzypcach'),'Ekspresjonizm'),
	((SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Autoportret ze �mierci� graj�c� na skrzypcach'),'Malarstwo abstrakcyjne');

INSERT INTO Ceny_wywolawcze (ID_dziela, Wartosc)
VALUES
	(1,1200),
	(2,13200),
	(3,109300),
	(4,120),
	(5,19200),
	(6,9450),
	(7,12040),
	(8,52060),
	(9,3400),
	(10,3900);


	
INSERT INTO Muzea(NIP, Nazwa, Ulica, Kod_pocztowy, Miasto, Numer_telefonu)
VALUES
	('5260309719','Muzeum Narodowe w Warszawie', 'D�uga', '00-495', 'Warszawa','+48526351726' ),
	('8172635142','Muzeum Narodowe w Gda�sku', 'D�uga', '81-263', 'Gda�sk','+48213621723' ),
	('9293162532','Muzeum Narodowe w Krakowie', 'D�uga', '09-231', 'Krak�w','+48223123726' ),
	('5293827162','Muzeum Narodowe w Poznaniu', 'D�uga', '01-322', 'Pozna�','+48193735736' ),
	('4567898766','Galeria sztuki wsp�czesnej', 'D�uga', '76-219', 'Warszawa','+48888777635' ),
	('1928374662','Muzeum rze�by', 'D�uga', '21-495', 'Wa�brzych','+48234672726' ),
	('1029386392','Galeria Dialogu Malarskiego', 'D�uga', '01-295', 'Koszalin','+48522751726' ),
	('1029382637','Muzeum sztuki dawnej', 'D�uga', '98-495', 'Lublin','+48526383726' ),
	('1203846362','Muzeum Van Gogha', 'D�uga', '98-263', 'Zielona G�ra','+48928374726' ),
	('8291727361','Galeria Tematyczna', 'D�uga', '98-405', 'Krak�w','+48201351732' );

INSERT INTO Wymiany(Data_rozpoczecia, Data_zakonczenia, NIP_muzeum, ID_dziela)
VALUES
	('2012-09-12', '2013-02-14','5260309719', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa') ),
	('2002-07-02', '2005-06-14','5260309719', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Infantka Ma�gorzata') ),
	('1998-05-16', '2000-06-14','8172635142', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Ostatnia wieczerza') ),
	('1999-04-14', '2007-09-14','8172635142', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Panny dworskie') ),
	('1990-06-19', '1994-09-14','8172635142', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Portret Chopina') ),
	('2010-01-11', '2020-09-14','9293162532', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Portret Chopina') ),
	('2010-06-12', '2013-10-04','9293162532', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Hamlet polski') ),
	('2001-07-10', '2004-09-07','5293827162', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Bitwa pod Grunwaldem') ),
	('2002-07-03', '2003-11-07','5293827162', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Impresja, wsch�d s�o�ca') ),
	('2003-12-10', '2004-08-07','4567898766', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki') ),
	('2004-03-12', '2006-11-07','4567898766', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki') ),
	('2005-03-12', '2007-12-07','4567898766', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa') ),
	('2006-03-12', '2010-01-07','1928374662', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Mona Lisa') ),
	('2007-03-12', '2008-04-07','1928374662', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Portret Chopina') ),
	('2008-03-12', '2009-03-07','1029386392', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki') ),
	('2021-03-12', '2024-12-07','1029386392', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Autoportret ze �mierci� graj�c� na skrzypcach') ),
	('2011-03-12', '2012-01-07','1029382637', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki') ),
	('2001-03-12', '2006-01-07','1203846362', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='S�oneczniki') ),
	('2004-11-07', '2004-11-15','8291727361', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Autoportret ze �mierci� graj�c� na skrzypcach') ),
	('2001-03-12', '2001-03-20','8291727361', (SELECT ID_dziela FROM Dziela_sztuki WHERE Tytul='Impresja, wsch�d s�o�ca') );

INSERT INTO Klienci (Imie, Nazwisko, Miasto, Ulica, Kod_pocztowy, Numer_telefonu)
VALUES 
	('Jan', 'Kowalski', 'Warszawa', 'Aleje Jerozolimskie', '00-001', '+48987657463'),
	('Anna', 'Nowak', 'Krak�w', 'Floria�ska', '30-001', '+48987657463'),
	('Piotr', 'Wi�niewski', 'Gda�sk', 'D�uga', '80-001', '+48987657463'),
	('Ewa', 'D�browska', 'Wroc�aw', '�widnicka', '50-001', '+48987657463'),
	('Tomasz', 'Lis', 'Pozna�', 'Wielka', '60-001', '+48987657463'),
	('Magdalena', 'Zaj�c', 'Katowice', 'Mariacka', '40-001', '+48987657463'),
	('Marek', 'W�jcik', '��d�', 'Piotrkowska', '90-001', '+48987657463'),
	('Karolina', 'Kaczmarek', 'Szczecin', 'Monte Cassino', '70-001', '+48987657463'),
	('Grzegorz', 'Jaworski', 'Bydgoszcz', 'Gda�ska', '85-001', '+48987657463'),
	('Katarzyna', 'Adamska', 'Gdynia', 'Starowiejska', '81-001', '+48987657463'),
	('Jan', 'Kowalski', 'Warszawa', 'Aleje Jerozolimskie', '00-001', '+48987657463'),
	('Anna', 'Nowak', 'Krak�w', 'Floria�ska', '30-001', '+48987657463'),
	('Piotr', 'Wi�niewski', 'Gda�sk', 'D�uga', '80-001', '+48987657463'),
	('Ewa', 'D�browska', 'Wroc�aw', '�widnicka', '50-001', '+48987657463'),
	('Tomasz', 'Lis', 'Pozna�', 'Wielka', '60-001', '+48987657463'),
	('Magdalena', 'Zaj�c', 'Katowice', 'Mariacka', '40-001', '+48987657463'),
	('Marek', 'W�jcik', '��d�', 'Piotrkowska', '90-001', '+48987657463'),
	('Karolina', 'Kaczmarek', 'Szczecin', 'Monte Cassino', '70-001', '+48987657463'),
	('Grzegorz', 'Jaworski', 'Bydgoszcz', 'Gda�ska', '85-001', '+48987657463'),
	('Katarzyna', 'Adamska', 'Gdynia', 'Starowiejska', '81-001', '+48987657463');


INSERT INTO Filie (NIP, Nazwa_oddzialu, Miasto, Ulica, Kod_pocztowy)
VALUES 
	('1234567890', 'Oddzia� Rze�by', 'Warszawa', 'Aleje Jerozolimskie', '00-001'),
	('9876543210', 'Oddzia� Inspiracji', 'Krak�w', 'Floria�ska', '30-001'),
	('2345678901', 'Oddzia� Morskich Opowie�ci', 'Gda�sk', 'D�uga', '80-001'),
	('3456789012', 'Oddzia� Kreatywno�ci', 'Wroc�aw', '�widnicka', '50-001'),
	('4567890123', 'Oddzia� Poezji', 'Pozna�', 'Wielka', '60-001'),
	('5678901234', 'Oddzia� Sztuki', 'Katowice', 'Mariacka', '40-001'),
	('6789012345', 'Oddzia� Historii', '��d�', 'Piotrkowska', '90-001'),
	('7890123456', 'Oddzia� Fantazji', 'Szczecin', 'Monte Cassino', '70-001'),
	('8901234567', 'Oddzia� Nauki', 'Bydgoszcz', 'Gda�ska', '85-001'),
	('9012345678', 'Oddzia� Marze�', 'Gdynia', 'Starowiejska', '81-001');



INSERT INTO Wystawy (Nazwa, Typ, Data_rozpoczecia, Data_zakonczenia, Sprzedane_bilety, NIP_filii)
VALUES 
	('Sztuka Renesansu', 'czasowa', '1990-01-15', '1990-07-15', 700, '1234567890'),
	('Nowoczesne Malarstwo', 'czasowa', '1995-05-01', '1995-12-01', 300, '9876543210'),
	('Historia Fotografii', 'sta�a', '2000-03-10', '2050-01-01', 450, '2345678901'),
	('Sztuka Abstrakcyjna', 'czasowa', '2005-07-15', '2006-01-15', 200, '3456789012'),
	('Poezja w Sztuce', 'sta�a', '2010-02-01', '2050-01-01', NULL, '4567890123'),
	('Wystawa Rze�by', 'czasowa', '2015-09-05', '2016-04-05', 600, '5678901234'),
	('Sztuka Wsp�czesna', 'sta�a', '2020-04-20', '2050-01-01', NULL, '6789012345'),
	('Van Gogh w ilustracjach', 'czasowa', '2020-10-10', '2026-04-10', NULL, '7890123456'),
	('Od wsp�czesno�ci do dzi�', 'sta�a', '2020-06-01', '2050-01-01', NULL, '8901234567'),
	('Sny i Marzenia', 'czasowa', '2035-11-15', '2036-05-15', NULL, '9012345678'),
	('Historia Fotografii', 'sta�a', '2000-03-10', '2050-01-01', 450, '2345678901'),
	('Sztuka Abstrakcyjna', 'czasowa', '2005-07-15', '2006-01-15', 200, '3456789012'),
	('Poezja w Sztuce', 'sta�a', '2010-02-01', '2050-01-01', NULL, '4567890123'),
	('Wystawa Rze�by', 'czasowa', '2015-09-05', '2016-04-05', 600, '5678901234');

INSERT INTO Dziela_Wystawy (ID_dziela, ID_wystawy)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (7, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 1),
    (12, 2),
    (1, 3),
    (2, 4),
    (3, 5),
    (4, 6),
    (5, 7),
    (6, 8),
    (7, 9),
    (8, 10);

INSERT INTO Aukcje (Nazwa, Data_rozpoczecia, Data_zakonczenia)
VALUES
    ('Aukcja Sztuki Nowoczesnej', '2000-01-01', '2000-04-01'),
    ('Aukcja Impresjonistyczna', '2003-03-20', '2003-06-20'),
    ('Aukcja Sztuki Wsp�czesnej', '2005-02-05', '2005-05-05'),
    ('Aukcja Rze�by', '2007-10-10', '2008-01-10'),
    ('Aukcja Fotografii', '2009-02-25', '2009-05-25'),
    ('Aukcja Grafiki', '2011-10-15', '2012-01-15'),
    ('Wielka Aukcja Nocna', '2017-07-10', '2017-07-12'),
    ('Aukcja Uliczna', '2018-02-05', '2018-05-05'),
    ('Aukcja Malarstwa Portretowego', '2019-06-15', '2019-09-15'),
    ('Aukcja Renesansowa', '2023-06-20', '2024-09-20'),
	('Aukcja Sztuki', '2000-01-01', '2000-04-01'),
    ('Aukcja Impresjonistyczna', '2003-03-20', '2003-06-20'),
    ('Aukcja Sztuki Wsp�czesnej', '2005-02-05', '2005-05-05'),
    ('Aukcja Rze�by', '2007-10-10', '2008-01-10'),
    ('Aukcja Fotografii', '2009-02-25', '2009-05-25'),
    ('Aukcja Grafikowa', '2011-10-15', '2012-01-15'),
    ('Wielka Aukcja Nocna', '2017-07-10', '2017-07-12'),
    ('Aukcja Uliczna', '2018-02-05', '2018-05-05'),
    ('Aukcja Malarstwa Portretowego', '2019-06-15', '2019-09-15'),
    ('Aukcja Renesansowa', '2023-06-20', '2024-09-20');

INSERT INTO Dziela_Aukcje (ID_dziela, ID_aukcji)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (4, 8),
    (9, 9),
    (10, 10),
    (11, 1),
    (12, 2),
    (1, 3),
    (2, 4),
    (3, 5),
    (4, 6),
    (6, 8),
    (3, 9),
    (8, 10),
	(3, 4),
    (10, 5),
    (7, 6),
    (5, 7),
    (7, 8);

INSERT INTO Oferty (ID_klienta, ID_aukcji, ID_dziela, Cena)
VALUES
    (1, 1, 1, 100000),
    (1, 2, 2, 75000),
    (1, 3, 3, 120000),
    (2, 4, 4, 50000),
    (2, 5, 5, 80000),
    (2, 6, 6, 60000),
    (3, 8, 8, 95000),
    (3, 9, 3, 180000),
    (4, 10, 10, 30000),
    (4, 1, 11, 60000),
    (5, 2, 12, 85000),
    (5, 3, 1, 110000),
    (6, 4, 2, 40000),
    (6, 5, 3, 70000),
    (6, 6, 4, 90000),
    (7, 7, 5, 150000),
    (8, 8, 6, 120000),
    (9, 9, 7, 250000);
