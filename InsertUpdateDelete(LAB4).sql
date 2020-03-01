USE autoshop;
INSERT INTO users VALUES (1,'admin', 'admin');
INSERT INTO users VALUES (2,'Alexander1983', '12345678'),
						(3,'TheBestCustomer', 'best123'),
                        (4,'UserBuyCar', 'iwantBMW'),
                        (5,'MercedesLover', 'AmgIsLife');

UPDATE users SET pass='admin12345' WHERE login='admin';
UPDATE users SET login='User' WHERE login='UserBuyCar';
UPDATE users SET pass='pass1234' WHERE id>3;

DELETE FROM users WHERE pass = 'pass1234';