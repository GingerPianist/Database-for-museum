/*Wydzia� �ledczy pr�buje rozwik�a� zagadk� skradzionej rze�by. Musisz im pom�c.
Twoim zadaniem jest wyszukanie imienia, nazwiska oraz numeru telefonu os�b,
kt�re licytowa�y skradzione dzie�o. ID tego dziela to 1 */

SELECT *
FROM   Klienci
WHERE  ID_klienta IN (SELECT ID_klienta
                      FROM   Oferty
                      WHERE  ID_dziela = 1); 