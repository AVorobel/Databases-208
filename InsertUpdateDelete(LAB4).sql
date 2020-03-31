USE autoshop;
-- INSERT INTO users(login, pass, id) VALUES ('admin', 'admin',1);
-- INSERT INTO users(login, pass) VALUES ('Alexander1983', '12345678'),
-- 						('TheBestCustomer', 'best123'),
--                         ('UserBuyCar', 'iwantBMW'),
--                         ('MercedesLover', 'AmgIsLife');
-- UPDATE users SET pass='admin12345' WHERE login='admin';
-- UPDATE users SET login='User' WHERE login='UserBuyCar';
-- UPDATE users SET pass='pass1234' WHERE id>3;

-- DELETE FROM users WHERE pass = 'pass1234';

LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 5.7\Uploads\data.csv' INTO TABLE Users FIELDS TERMINATED BY ',';