use autoshop;

drop trigger distrib_delete;
create trigger distrib_delete before delete
on autoshop.distributor for each row
update autoshop.cardistributor set distrib_id = OLD.id-1
where distrib_id = OLD.id;

select * from cardistributor;
delete from distributor where id = 4;
select * from cardistributor;

drop trigger encrypt_password;
CREATE
TRIGGER encrypt_password BEFORE INSERT ON autoshop.users FOR EACH ROW
SET NEW.pass = AES_ENCRYPT(NEW.pass, 'key-key');

select * from users;
insert into users(login, pass) value ('marko', 'adrian2001');

drop trigger last_activity;
create trigger last_activity after insert
on autoshop.orders for each row 
update autoshop.users set last_activity = current_date()
where users.id = NEW.user_id; 

select * from users;
insert into orders(user_id, carDistrib_id) value (11,64);