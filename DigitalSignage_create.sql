USE `DigitalSignage`;

drop table `orders`;
drop table `companies`;
drop table `contracts`;
drop table `payments`;
drop table `priorities`;
drop table `tariffs`;


CREATE TABLE tariffs (
    tariff_id INT NOT NULL AUTO_INCREMENT,
    tariff_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (tariff_id)
);
CREATE TABLE priorities (
	priority_id INT NOT NULL AUTO_INCREMENT,
    message VARCHAR (45) NOT NULL,
    PRIMARY KEY (priority_id)
) ;
CREATE TABLE payments (
	payment_id INT NOT NULL AUTO_INCREMENT,
    amount DOUBLE,
    payment_dttm TIMESTAMP,
    PRIMARY KEY(payment_id)
) ;

CREATE TABLE contracts (
	contract_id INT NOT NULL AUTO_INCREMENT,
	company_id INT NOT NULL,
    begin_dttm TIMESTAMP,
    end_dttm TIMESTAMP,
    PRIMARY KEY(contract_id)
) ; 

CREATE TABLE companies (
	company_id INT NOT NULL AUTO_INCREMENT,
    phone VARCHAR(45) NOT NULL,
    name VARCHAR(45) NOT NULL,
    joined_dttm TIMESTAMP,
    balance  DOUBLE,
    contract_id INT NOT NULL,
    PRIMARY KEY(company_id),
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id),
    FOREIGN KEY (company_id) REFERENCES payments (payment_id)
) ;
CREATE TABLE orders (
	order_id INT NOT NULL AUTO_INCREMENT,
    description_order VARCHAR (250) NOT NULL,
	discount INT NOT NULL,
    order_dttm TIMESTAMP,
    company_id INT NOT NULL,
    tariff_id INT NOT NULL,
    priority_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (tariff_id) REFERENCES tariffs(tariff_id),
    FOREIGN KEY (priority_id) REFERENCES priorities(priority_id)
) ;

LOAD DATA INFILE '/var/lib/mysql-files/tariff.csv'
INTO TABLE tariffs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/priorities.csv'
INTO TABLE priorities
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/contracts.csv'
INTO TABLE contracts
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/companies.csv'
INTO TABLE companies
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';













