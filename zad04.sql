--1.
SELECT P.NAZWISKO, P.ETAT, P.ID_ZESP, Z.NAZWA FROM PRACOWNICY P JOIN ZESPOLY Z ON P.ID_ZESP = Z.ID_ZESP ORDER BY NAZWISKO;

--2.
SELECT P.NAZWISKO, P.ETAT, P.ID_ZESP, Z.NAZWA FROM PRACOWNICY P JOIN ZESPOLY Z ON P.ID_ZESP = Z.ID_ZESP WHERE ADRES LIKE 'PIOTROWO 3A' ORDER BY NAZWISKO;

--3.
SELECT P.NAZWISKO, P.ETAT, P.PLACA_POD, E.PLACA_MIN, E.PLACA_MAX FROM PRACOWNICY P JOIN ETATY E ON P.ETAT = E.NAZWA ORDER BY P.ETAT, P.NAZWISKO;

--4.
SELECT P.NAZWISKO, P.ETAT, P.PLACA_POD, E.PLACA_MIN, E.PLACA_MAX, CASE WHEN PLACA_POD <= PLACA_MAX AND PLACA_POD >= PLACA_MIN THEN 'OK' ELSE 'NIE' END AS CZY_PENSJA_OK FROM PRACOWNICY P JOIN ETATY E ON P.ETAT = E.NAZWA ORDER BY P.ETAT, P.NAZWISKO;

--5.
SELECT P.NAZWISKO, P.ETAT, P.PLACA_POD, E.PLACA_MIN, E.PLACA_MAX, CASE WHEN PLACA_POD <= PLACA_MAX AND PLACA_POD >= PLACA_MIN THEN 'OK' ELSE 'NIE' END AS CZY_PENSJA_OK FROM PRACOWNICY P JOIN ETATY E ON P.ETAT = E.NAZWA WHERE PLACA_POD > PLACA_MAX OR PLACA_POD < PLACA_MIN ORDER BY P.ETAT, P.NAZWISKO;

--6.
SELECT P.NAZWISKO, P.PLACA_POD, P.ETAT, E.NAZWA AS KAT_PLAC, E.PLACA_MIN, E.PLACA_MAX FROM PRACOWNICY P JOIN ETATY E ON P.PLACA_POD >= PLACA_MIN AND P.PLACA_POD <= PLACA_MAX ORDER BY P.NAZWISKO, E.NAZWA;

--7.
SELECT P.NAZWISKO, P.PLACA_POD, P.ETAT, E.NAZWA AS KAT_PLAC, E.PLACA_MIN, E.PLACA_MAX FROM PRACOWNICY P JOIN ETATY E ON P.PLACA_POD >= PLACA_MIN AND P.PLACA_POD <= PLACA_MAX WHERE E.NAZWA LIKE 'SEKRETARKA' ORDER BY P.NAZWISKO, E.NAZWA;

--8.
SELECT P1.NAZWISKO, P1.ID_PRAC, P2.NAZWISKO AS SZEF, P1.ID_SZEFA FROM PRACOWNICY P1 INNER JOIN PRACOWNICY P2 ON P1.ID_SZEFA = P2.ID_PRAC WHERE P1.ID_SZEFA IS NOT NULL ORDER BY P1.NAZWISKO;

--9.
SELECT P1.NAZWISKO, P1.ZATRUDNIONY AS PRAC_ZATRUDNIONY, P2.NAZWISKO AS SZEF, P2.ZATRUDNIONY AS SZEF_ZATRUDNIONY, FLOOR(MONTHS_BETWEEN(P1.ZATRUDNIONY, P2.ZATRUDNIONY)/12) AS LATA FROM PRACOWNICY P1 INNER JOIN PRACOWNICY P2 ON P1.ID_SZEFA = P2.ID_PRAC WHERE MONTHS_BETWEEN(P1.ZATRUDNIONY, P2.ZATRUDNIONY)/12 <= 10 ORDER BY P1.ZATRUDNIONY, P1.NAZWISKO;

--10.
SELECT Z.NAZWA, COUNT(ID_PRAC) AS LICZBA, AVG(PLACA_POD) AS SREDNIA_PLACA FROM ZESPOLY Z JOIN PRACOWNICY P ON Z.ID_ZESP = P.ID_ZESP GROUP BY Z.NAZWA ORDER BY Z.NAZWA;

--11.
SELECT Z.NAZWA, CASE WHEN COUNT(ID_PRAC)<3 THEN 'mały' WHEN COUNT(ID_PRAC)<7 THEN 'średni' ELSE 'duży' END AS LICZBA FROM ZESPOLY Z JOIN PRACOWNICY P ON Z.ID_ZESP = P.ID_ZESP GROUP BY Z.NAZWA HAVING COUNT(ID_PRAC)>0 ORDER BY Z.NAZWA;