use autoshop;

show indexes from car;
show indexes from distributor;

-- DROP INDEX carINDX2 on car;
-- DROP INDEX distributorINDX on distributor;

create index carINDX2 on car (id, mark, model, car_type);
create index distributorINDX on distributor (id, distrib_name);
create index cardistribINDX on cardistributor(car_id, distrib_id);

explain SELECT car.mark, car.model, distributor.distrib_name as distributorID FROM car 
INNER JOIN cardistributor ON car.id = cardistributor.car_id 
INNER JOIN distributor ON cardistributor.distrib_id = distributor.id
WHERE car.car_type NOT IN ("Pickup","Crossover");

explain SELECT straight_join car.mark, car.model, distributor.distrib_name as distributorID FROM car 
INNER JOIN cardistributor ON car.id = cardistributor.car_id 
INNER JOIN distributor ON cardistributor.distrib_id = distributor.id
WHERE car.car_type NOT IN ("Pickup","Crossover");