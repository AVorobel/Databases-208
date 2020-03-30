USE autoshop;

SELECT * FROM cardescription WHERE car_id = 3;

SELECT userscontacts.u_name, userscontacts.u_surname, orders.id AS orderID FROM userscontacts
LEFT JOIN orders ON userscontacts.user_id = orders.user_id;

SELECT car.model, car.mark, cardescription.wheel_drive FROM car 
INNER JOIN cardescription ON car.id = cardescription.car_id 
WHERE cardescription.transmission != "Manual";

SELECT car.mark, car.model, distributor.distrib_name as distributorID FROM car 
INNER JOIN cardistributor ON car.id = cardistributor.car_id 
INNER JOIN distributor ON cardistributor.distrib_id = distributor.id
WHERE car.car_type NOT IN ("Pickup","Crossover");

SELECT car.mark, car.model, cardescription.car_engine, cardescription.wheel_drive
FROM car INNER JOIN cardescription ON car.id = cardescription.car_id
WHERE car.id IN (SELECT cardistributor.car_id FROM cardistributor 
WHERE cardistributor.distrib_id != 3) ORDER BY wheel_drive;

SELECT userscontacts.u_name, userscontacts.u_surname FROM userscontacts
WHERE NOT EXISTS
(SELECT * FROM orders WHERE userscontacts.user_id = orders.user_id);

SELECT CONCAT(car.mark," ", car.model) as Car FROM car
WHERE car.product_date = (SELECT MIN(car.product_date) FROM car);