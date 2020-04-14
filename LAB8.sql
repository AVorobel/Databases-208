use autoshop;

select id, login from users where login like '%user%' order by login asc;

select mark, model, product_date from car order by product_date desc limit 5;

select distributor.distrib_name as distributor, count(cardistributor.car_id) as cars 
from cardistributor join distributor 
on cardistributor.distrib_id = distributor.id 
group by distributor;