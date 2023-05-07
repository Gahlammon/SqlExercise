SELECT * FROM ZESPOLY ORDER BY ID_ZESP ASC;

SELECT * FROM PRACOWNICY ORDER BY ID_PRAC ASC;

SELECT NAZWISKO, PLACA_POD * 12 AS ROCZNA_PLACA FROM PRACOWNICY ORDER BY NAZWISKO;

SELECT NAZWISKO, ETAT, PLACA_POD + COALESCE(PLACA_DOD,0) AS MIESIECZNE_ZAROBKI FROM PRACOWNICY ORDER BY MIESIECZNE_ZAROBKI DESC;

SELECT * FROM ZESPOLY ORDER BY NAZWA;

SELECT UNIQUE ETAT FROM PRACOWNICY;

SELECT * FROM PRACOWNICY WHERE ETAT = 'ASYSTENT' ORDER BY NAZWISKO;

SELECT ID_PRAC, NAZWISKO, ETAT, PLACA_POD, ID_ZESP FROM PRACOWNICY WHERE ID_ZESP = 30 OR ID_ZESP = 40 ORDER BY PLACA_POD DESC;

SELECT NAZWISKO, ID_ZESP, PLACA_POD FROM PRACOWNICY WHERE PLACA_POD >= 300 AND PLACA_POD <=800 ORDER BY NAZWISKO;

SELECT NAZWISKO, ETAT, ID_ZESP FROM PRACOWNICY WHERE NAZWISKO LIKE '%SKI' ORDER BY NAZWISKO;

SELECT ID_PRAC, ID_SZEFA, NAZWISKO, PLACA_POD FROM PRACOWNICY WHERE PLACA_POD > 1000 AND ID_SZEFA IS NOT NULL;

SELECT NAZWISKO, ID_ZESP FROM PRACOWNICY WHERE ID_ZESP = 20 AND (NAZWISKO LIKE 'M%' OR NAZWISKO LIKE '%SKI') ORDER BY NAZWISKO;

SELECT NAZWISKO, ETAT, (PLACA_POD/20)/8 AS STAWKA FROM PRACOWNICY WHERE (ETAT != 'ASYSTENT' AND ETAT != 'STAZYSTA') AND (PLACA_POD < 400 OR PLACA_POD > 800) ORDER BY STAWKA;

SELECT NAZWISKO, ETAT, PLACA_POD, PLACA_DOD FROM PRACOWNICY 