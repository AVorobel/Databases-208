CREATE DATABASE IF NOT EXISTS AutoShop 
					CHARACTER SET utf8;
USE AutoShop;

CREATE TABLE IF NOT EXISTS Users(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    login VARCHAR(18) NOT NULL,
    pass VARCHAR(10) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS UsersContacts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    u_name VARCHAR(30) NOT NULL,
    u_surname VARCHAR(30),
    u_email VARCHAR(35) NOT NULL,
    u_phone VARCHAR(13),
    user_id INT UNSIGNED NOT NULL UNIQUE,
    PRIMARY KEY(id),
    CONSTRAINT fk_contact_user FOREIGN KEY(user_id)
    REFERENCES AutoShop.Users(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Car(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    mark VARCHAR(20) NOT NULL,
    model VARCHAR(30) NOT NULL,
    product_date DATE NOT NULL,
    price INT NOT NULL,
    car_type ENUM('Sedan','Universal','Hatchback','Minivan','Crossover',
    'Coupe','Cabriolet','Pickup') NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS CarDescription(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    car_engine VARCHAR(10) NOT NULL,
    wheel_drive VARCHAR(3) NOT NULL,
    sit_places INT NOT NULL,
    trunk INT NOT NULL,
    transmission ENUM('Automatic','Manual'),
    car_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_description_car FOREIGN KEY (car_id)
    REFERENCES AutoShop.Car(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Distributor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    distrib_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DistributorContacts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    address VARCHAR(40) NOT NULL,
    phone VARCHAR(13) NOT NULL,
    email VARCHAR(50) NOT NULL,
    distrib_id INT UNSIGNED NOT NULL UNIQUE,
    PRIMARY KEY (id),
    CONSTRAINT fk_distrib_contacts FOREIGN KEY (distrib_id)
    REFERENCES AutoShop.Distributor(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CarDistributor(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    car_id INT UNSIGNED NOT NULL,
    distrib_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_car_carDistrib FOREIGN KEY(car_id)
    REFERENCES AutoShop.Car(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_distrib_carDistrib FOREIGN KEY(distrib_id)
    REFERENCES AutoShop.Distributor(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Orders(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    carDistrib_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_orders_user FOREIGN KEY (user_id)
    REFERENCES AutoShop.Users(id) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orders_carDistrib FOREIGN KEY(carDistrib_id)
    REFERENCES AutoShop.CarDistributor(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);



