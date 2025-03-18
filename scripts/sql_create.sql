CREATE TABLE MozliweUlice
(
	Ulica CHAR(30) NOT NULL PRIMARY KEY
);

CREATE TABLE MozliwetypyDziel
(
	Typ CHAR(30) NOT NULL PRIMARY KEY
);


CREATE TABLE Autorzy 
(
ID_autora INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Imie CHAR(30) NOT NULL, 
Nazwisko CHAR(30),
Pseudonim CHAR(30),
Rok_urodzenia CHAR(4),
Rok_smierci CHAR(4),
);

CREATE TABLE Muzea
(
NIP CHAR(10) NOT NULL PRIMARY KEY,
Nazwa CHAR(30) NOT NULL, 
Ulica CHAR(30) REFERENCES MozliweUlice,
Miasto CHAR(30) NOT NULL,
Kod_pocztowy CHAR(6) CHECK (Kod_pocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'),
Numer_telefonu CHAR(15) CHECK (Numer_telefonu LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE Dziela_sztuki
(
ID_dziela INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ID_autora INT NOT NULL REFERENCES Autorzy ON DELETE CASCADE ON UPDATE CASCADE,
Tytul CHAR(50),
Rok INT,
Typ CHAR(30) REFERENCES MozliweTypyDziel, --CHECK (Typ IN ('malarstwo', 'rzezba','instalacja','grafika', 'sztuka cyfrowa', 'fotografia')),
Stanowisko INT
);

CREATE TABLE Wymiany 
(
ID_wymiany INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Data_rozpoczecia DATE NOT NULL,
Data_zakonczenia DATE NOT NULL,
NIP_muzeum CHAR(10)NOT NULL REFERENCES Muzea ON DELETE CASCADE ON UPDATE CASCADE,
ID_dziela INT REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Klienci
(
ID_klienta INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Imie CHAR(30) NOT NULL,
Nazwisko CHAR(30) NOT NULL,
Miasto CHAR(30) NOT NULL,
Ulica CHAR(30) NOT NULL,
Kod_pocztowy CHAR(6) CHECK (Kod_pocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'),
Numer_telefonu CHAR(15) CHECK (Numer_telefonu LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
);



CREATE TABLE Style
(
Nazwa CHAR(30) NOT NULL PRIMARY KEY,
Rok_rozpoczecia INT NOT NULL,
Rok_zakonczenia INT NOT NULL
);

CREATE TABLE Aukcje
(
ID_aukcji INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nazwa CHAR(30) NOT NULL,
Data_rozpoczecia DATE NOT NULL,
Data_zakonczenia DATE NOT NULL
);

CREATE TABLE Filie
(
NIP CHAR(10) NOT NULL PRIMARY KEY, /*CHECK (LEN(NIP) = 10 AND NIP LIKE '^[0-9]+$'),*/
Nazwa_oddzialu CHAR(50) NOT NULL,
Miasto CHAR(30) NOT NULL,
Ulica CHAR(30) NOT NULL,
Kod_pocztowy CHAR(6) CHECK (Kod_pocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'),
);

CREATE TABLE Oferty
(
ID_klienta INT NOT NULL REFERENCES Klienci ON DELETE CASCADE ON UPDATE CASCADE,
ID_aukcji INT NOT NULL REFERENCES Aukcje ON DELETE CASCADE ON UPDATE CASCADE,
ID_dziela INT NOT NULL REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE,
Cena INT NOT NULL,
PRIMARY KEY(ID_klienta, ID_aukcji, ID_dziela)
);

CREATE TABLE Wystawy
(
ID_wystawy INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nazwa CHAR(50) NOT NULL,
Typ CHAR(10) NOT NULL CHECK (Typ IN ('czasowa', 'sta³a')),
Data_rozpoczecia DATE NOT NULL,
Data_zakonczenia DATE NOT NULL,
Sprzedane_bilety INT,
NIP_filii CHAR(10) REFERENCES Filie ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Style_Dziela
(
ID_dziela INT NOT NULL REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE,
Nazwa_stylu CHAR(30) NOT NULL REFERENCES Style ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(ID_dziela, Nazwa_stylu)
);

CREATE TABLE Dziela_Wystawy
(
ID_dziela INT NOT NULL REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE,
ID_wystawy INT NOT NULL REFERENCES Wystawy ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(ID_dziela, ID_wystawy)
);

CREATE TABLE Dziela_Aukcje
(
ID_dziela INT NOT NULL REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE,
ID_aukcji INT NOT NULL REFERENCES Aukcje ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(ID_dziela, ID_aukcji)
);

CREATE TABLE Ceny_wywolawcze
(
ID_dziela INT NOT NULL PRIMARY KEY REFERENCES Dziela_sztuki ON DELETE CASCADE ON UPDATE CASCADE,
Wartosc INT NOT NULL
);