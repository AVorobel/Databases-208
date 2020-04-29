use autoshop;

set autocommit = 0;
-- неуспішна операція
start transaction;
savepoint befor_transaction;
insert into autoshop.cardistributor(car_id, distrib_id) value (11,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (12,2);
insert into autoshop.cardistributor(car_id, distrib_id) value (13,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (14,3);
insert into autoshop.cardistributor(car_id, distrib_id) value (15,3);
insert into autoshop.cardistributor(car_id, distrib_id) value (16,2);
insert into autoshop.cardistributor(car_id, distrib_id) value (17,5);
insert into autoshop.cardistributor(car_id, distrib_id) value (18,5);
insert into autoshop.cardistributor(car_id, distrib_id) value (19,5);
insert into autoshop.cardistributor(car_id, distrib_id) value (20,5);
commit;

rollback to befor_transaction;
-- успішна опреація
start transaction;
savepoint befor_transaction;
insert into autoshop.cardistributor(car_id, distrib_id) value (11,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (12,2);
insert into autoshop.cardistributor(car_id, distrib_id) value (13,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (14,3);
insert into autoshop.cardistributor(car_id, distrib_id) value (15,3);
insert into autoshop.cardistributor(car_id, distrib_id) value (16,2);
insert into autoshop.cardistributor(car_id, distrib_id) value (17,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (18,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (19,1);
insert into autoshop.cardistributor(car_id, distrib_id) value (20,2);
commit;
