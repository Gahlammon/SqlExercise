--1.

CREATE TABLE PROJEKTY
(ID_PROJEKTU NUMBER(4) GENERATED ALWAYS AS IDENTITY)
(OPIS_PROJEKTU VARCHAR2(20))
(DATA_ROZPOCZECIA DATE DEFAULT CURRENT_DATE)
(DATA_ZAKONCZENIA DATE)
(FUNDUSZ NUMBER(7,2));

--2.

INSERT INTO PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
VALUES ('Indeksy bitmapowe', '02-04-1999', '31-08-2001', 25000);

INSERT INTO PROJEKTY (OPIS_PROJEKTU, FUNDUSZ)
VALUES ('Sieci kręgosłupowe', 19000);

--3.

SELECT ID_PROJEKTU, OPIS_PROJEKTU FROM PROJEKTY;

--4.

INSERT INTO PROJEKTY (ID_PROJEKTU, OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
VALUES (10, 'Indeksy drzewiaste', '24-12-2013', '01-01-2014', 1200);

SELECT ID_PROJEKTU, OPIS_PROJEKTU FROM PROJEKTY;

--nie zakończyło się powodzeniem

INSERT INTO PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
VALUES ('Indeksy drzewiaste', '24-12-2013', '01-01-2014', 1200);

--5.

UPDATE PROJEKTY
SET ID_PROJEKTU = 10
WHERE OPIS_PROJEKTU LIKE 'Indeksy drzewiaste';

--nie zakończyło się powodzeniem

--6.

CREATE TABLE PROJEKTY_KOPIA
AS SELECT * FROM;

SELECT * FROM PROJEKTY_KOPIA;

--7.

INSERT INTO PROJEKTY_KOPIA (ID_PROJEKTU, OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
VALUES (10, 'Sieci_lokalne', CURRENT_DATE, CURRENT_DATE, 24500);

--zakończyło się sukcesem ponieważ nie zostały skopiowane ograniczenia krotek, zatem ID_PROJEKTU w tablicy PROJEKTY_KOPIA straciło własność GENERATED ALWAYS AS IDENTITY

--8.

DELETE FROM PROJEKTY
WHERE OPIS_PROJEKTU LIKE 'Indeksy drzewiaste';

--nie został usunięty, ponieważ to kopia, a nie referencja czy element dziedziczący

--9.

SELECT name
FROM sys.databases;