--1.
SELECT NAZWISKO, ETAT, ID_ZESP FROM PRACOWNICY WHERE ID_ZESP = (SELECT ID_ZESP FROM PRACOWNICY WHERE NAZWISKO LIKE 'BRZEZINSKI') ORDER BY NAZWISKO;

--2.
SELECT P.NAZWISKO, P.ETAT, Z.NAZWA FROM PRACOWNICY P JOIN ZESPOLY Z ON P.ID_ZESP = Z.ID_ZESP WHERE P.ID_ZESP = (SELECT ID_ZESP FROM PRACOWNICY WHERE NAZWISKO LIKE 'BRZEZINSKI') ORDER BY NAZWISKO;

INSERT INTO pracownicy(id_prac, nazwisko, etat, zatrudniony) 
VALUES ((SELECT max(id_prac) + 1 FROM pracownicy), 
 'WOLNY', 'ASYSTENT', DATE '1968-07-01');

--3.
SELECT NAZWISKO, ETAT, ZATRUDNIONY FROM PRACOWNICY WHERE ETAT LIKE 'PROFESOR' AND MONTHS_BETWEEN(ZATRUDNIONY,CURRENT_DATE) <= (SELECT MIN(MONTHS_BETWEEN(ZATRUDNIONY,CURRENT_DATE)) FROM PRACOWNICY WHERE ETAT LIKE 'PROFESOR');

--4.
SELECT NAZWISKO, ZATRUDNIONY, ID_ZESP FROM PRACOWNICY WHERE ID_ZESP IS NOT NULL AND (ID_ZESP, ZATRUDNIONY) IN (SELECT ID_ZESP, MAX(ZATRUDNIONY) FROM PRACOWNICY GROUP BY ID_ZESP);

--5.
SELECT Z1.ID_ZESP, Z1.NAZWA, Z1.ADRES FROM ZESPOLY Z1 LEFT OUTER JOIN PRACOWNICY P1 ON Z1.ID_ZESP = P1.ID_ZESP WHERE P1.ID_PRAC IS NULL;

DELETE FROM pracownicy 
WHERE nazwisko = 'WOLNY';

--6.
SELECT NAZWISKO FROM PRACOWNICY WHERE
ID_PRAC NOT IN (SELECT P1.ID_PRAC FROM PRACOWNICY P1 INNER JOIN PRACOWNICY P2 ON P1.ID_PRAC = P2.ID_SZEFA WHERE P2.ETAT LIKE 'STAZYSTA') AND
ID_PRAC IN (SELECT P1.ID_PRAC FROM PRACOWNICY P1 INNER JOIN PRACOWNICY P2 ON P1.ID_PRAC = P2.ID_SZEFA GROUP BY P1.ID_PRAC HAVING COUNT(P2.ID_PRAC)>0);

--7.
SELECT Z1.ID_ZESP, SUM(P1.PLACA_POD) AS SUMA_PLAC FROM ZESPOLY Z1 LEFT OUTER JOIN PRACOWNICY P1 ON Z1.ID_ZESP = P1.ID_ZESP GROUP BY Z1.ID_ZESP HAVING
SUM(P1.PLACA_POD) >= ALL(SELECT COUNT(PLACA_POD) FROM PRACOWNICY GROUP BY ID_ZESP);

--8.
SELECT Z1.NAZWA, SUM(P1.PLACA_POD) AS SUMA_PLAC FROM ZESPOLY Z1 LEFT OUTER JOIN PRACOWNICY P1 ON Z1.ID_ZESP = P1.ID_ZESP GROUP BY Z1.NAZWA HAVING
SUM(P1.PLACA_POD) >= ALL(SELECT COUNT(PLACA_POD) FROM PRACOWNICY GROUP BY ID_ZESP);

--9.
SELECT Z1.NAZWA, COUNT(P1.ID_PRAC) AS ILU_PRACOWNIKOW FROM ZESPOLY Z1 LEFT OUTER JOIN PRACOWNICY P1 ON Z1.ID_ZESP = P1.ID_ZESP GROUP BY Z1.NAZWA HAVING
COUNT(P1.ID_PRAC) > (SELECT COUNT(*) FROM ZESPOLY Z1 LEFT OUTER JOIN PRACOWNICY P1 ON Z1.ID_ZESP = P1.ID_ZESP WHERE Z1.NAZWA LIKE 'ADMINISTRACJA') ORDER BY Z1.NAZWA;

--10.
SELECT ETAT FROM PRACOWNICY GROUP BY ETAT HAVING
COUNT(ID_PRAC) >= ALL(SELECT COUNT(ID_PRAC) FROM PRACOWNICY GROUP BY ETAT);

--11.
SELECT ETAT, LISTAGG(NAZWISKO, ', ') AS PRACOWNICY FROM PRACOWNICY GROUP BY ETAT HAVING
COUNT(ID_PRAC) >= ALL(SELECT COUNT(ID_PRAC) FROM PRACOWNICY GROUP BY ETAT);

--12.
SELECT P2.NAZWISKO AS PRACOWNIK, P1.NAZWISKO AS SZEF FROM PRACOWNICY P1 LEFT OUTER JOIN PRACOWNICY P2 ON P1.ID_PRAC = P2.ID_SZEFA WHERE
ABS(P1.PLACA_POD - P2.PLACA_POD) <= ALL(SELECT ABS(P1.PLACA_POD - P2.PLACA_POD) FROM PRACOWNICY P1 LEFT OUTER JOIN PRACOWNICY P2 ON P1.ID_PRAC = P2.ID_SZEFA);