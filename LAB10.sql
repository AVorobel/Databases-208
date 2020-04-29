use autoshop;
-- SET GLOBAL log_bin_trust_function_creators = 1;

create function autoshop_uppercase(str nvarchar(50))
returns nvarchar(50)
return upper(str);

create function autoshop_lowercase(str nvarchar(50))
returns nvarchar(50)
return lower(str);

select autoshop_uppercase(login), autoshop_lowercase(pass) from users;

DELIMITER //
drop procedure if exists distrib_car_count;
create procedure distrib_car_count(in name nvarchar(50))
begin
	declare error_msg nvarchar(50);
	set error_msg = "дистрибютор відсутній в списку";
	if (name in (select distrib_name from distributor)) then
		begin
		create table if not exists autoshop.distrib_car_procedure(distrib_name nvarchar(50), amount int);
        truncate autoshop.distrib_car_procedure;
        insert into autoshop.distrib_car_procedure 
        select distributor.distrib_name as distrib_name,count(cardistributor.car_id) as amount
        from distributor inner join cardistributor on distributor.id = cardistributor.distrib_id
        where distributor.distrib_name = name
        group by distrib_name;
		end;
        else select error;
        end if;
	end//
    DELIMITER ;
    
    select * from distributor;
    call distrib_car_count('FayneAuto');
    select * from distrib_car_procedure;
        

