use autoshop;

select distributor.distrib_name as distributor, count(orders.id) as orders
from distributor join cardistributor on distributor.id = cardistributor.distrib_id
join orders on carDistrib_id = cardistributor.id group by distributor;

select year(product_date) as production_year,monthname(product_date) as production_month,count(model) as cars from car
group by production_year with rollup order by production_year desc;

select from_days(avg(to_days(sysdate()) - to_days(car.product_date))) 
as avg_age from car;

select users.login, count(orders.id) from users
join orders on users.id = orders.user_id group by users.login 
order by count(orders.id) desc limit 1; 