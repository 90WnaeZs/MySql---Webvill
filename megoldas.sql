/*1. feladat:*/
CREATE DATABASE webvill
CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;

/*3. feladat:*/
ALTER TABLE termekek
SET FOREIGN KEY(kazon) REFERENCES kategoriak(kazon);

ALTER TABLE rendelesek
ADD FOREIGN KEY (tazon) REFERENCES termekek(tazon);

/*4. feladat:*/
ALTER TABLE termekek
ADD INDEX (tnev);

/*5. feladat:*/
INSERT INTO `kategoriak`(`kazon`, `knev`) VALUES (9,'fénycsövek');

/*6. feladat:*/
UPDATE termekek SET fesz=CONCAT(fesz,'V')
WHERE fesz NOT LIKE '%V';

/*7. feladat:*/
SELECT termekek.tnev,SUM(rendelesek.db)
FROM termekek
JOIN rendelesek
ON termekek.tazon=rendelesek.tazon
GROUP BY termekek.tnev
ORDER BY SUM(rendelesek.db) DESC
LIMIT 1;

/*8. feladat:*/
SELECT kategoriak.knev,termekek.tnev,rendelesek.rdatum,(rendelesek.db*termekek.ar) AS 'db*ar'
FROM kategoriak
INNER JOIN termekek
ON termekek.kazon=kategoriak.kazon
INNER JOIN rendelesek
ON termekek.tazon=rendelesek.tazon
WHERE rendelesek.rdatum BETWEEN '2015-03-01' AND '2015.03.05'
AND termekek.telj='25W';

/*9. feladat:*/
SELECT kategoriak.knev, COUNT(termekek.kazon)
FROM kategoriak
JOIN termekek
ON kategoriak.kazon=termekek.kazon
GROUP BY kategoriak.kazon