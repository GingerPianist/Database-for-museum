/*Wydzia³ œledczy próbuje rozwik³aæ zagadkê skradzionej rzeŸby. Musisz im pomóc.
Twoim zadaniem jest wyszukanie imienia, nazwiska oraz numeru telefonu osób,
które licytowa³y skradzione dzie³o. ID tego dziela to 1 */

SELECT *
FROM   Klienci
WHERE  ID_klienta IN (SELECT ID_klienta
                      FROM   Oferty
                      WHERE  ID_dziela = 1); 