USE autoshop;

CREATE VIEW AvalaibleCars AS SELECT DISTINCT id,mark, model, product_date FROM autoshop.car;

SELECT * FROM avalaiblecars WHERE avalaiblecars.product_date < "2005-01-01";

SELECT avalaiblecars.mark, avalaiblecars.model, cardistributor.distrib_id 
FROM avalaiblecars, cardistributor
WHERE avalaiblecars.id = cardistributor.car_id;

SELECT avalaiblecars.mark, avalaiblecars.model, cardistributor.distrib_id 
FROM avalaiblecars, cardistributor
WHERE avalaiblecars.id = cardistributor.car_id AND avalaiblecars.product_date > "2015-01-01";


