USE AutoShop;
ALTER TABLE cardescription
			ADD COLUMN fuel_tank INT NOT NULL AFTER trunk;
ALTER TABLE userscontacts
			MODIFY COLUMN u_email VARCHAR(50) NOT NULL,
            DROP COLUMN u_surname;
ALTER TABLE distributorcontacts
            DROP FOREIGN KEY fk_distrib_contacts,
            DROP INDEX fk_distrib_contacts,
            DROP COLUMN distrib_id,
            ADD COLUMN distributor INT UNSIGNED NOT NULL,
            ADD CONSTRAINT fk_distrib_contacts FOREIGN KEY(distributor)
            REFERENCES AutoShop.Distributor(id) ON DELETE CASCADE ON UPDATE CASCADE;