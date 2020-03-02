USE autoshop;

CREATE TABLE IF NOT EXISTS result1 AS SELECT mark, model, price, car_type
FROM car WHERE car_type != 'Sedan';

CREATE TABLE IF NOT EXISTS result2 AS SELECT mark, model, price, car_type
FROM car WHERE price >= 10000;

SELECT * FROM result1 UNION SELECT * FROM result2;
SELECT * FROM result1 WHERE mark IN 
(SELECT mark FROM result2) 
AND model IN (SELECT model FROM result2);
SELECT * FROM result1 WHERE model 
NOT IN (SELECT model FROM result2);

SELECT * FROM result1,result2;