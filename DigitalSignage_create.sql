USE `DigitalSignage`;

drop table `payments`;
drop table `contracts`;
drop table `companies`;
drop table `tariffs`;


CREATE TABLE companies (
	company_id INT NOT NULL AUTO_INCREMENT,
    phone VARCHAR(45) NOT NULL,
    reg_dttm TIMESTAMP,
    PRIMARY KEY(company_id)
) ;
CREATE TABLE tariffs (
    tariff_id INT NOT NULL ,
    tariff_name VARCHAR(45) NOT NULL,
    monthly_fee DOUBLE NOT NULL,
    PRIMARY KEY (tariff_id)
);

CREATE TABLE payments (
	payment_id INT NOT NULL AUTO_INCREMENT,
    company_id INT NOT NULL,
    discount INT NOT NULL,
    tariff_id INT NOT NULL,
    payment_dttm TIMESTAMP,
    PRIMARY KEY(payment_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (tariff_id) REFERENCES tariffs(tariff_id)
) ;

CREATE TABLE contracts (
	contract_id INT NOT NULL AUTO_INCREMENT,
	company_id INT NOT NULL,
    begin_dttm TIMESTAMP,
    end_dttm TIMESTAMP,
    PRIMARY KEY(contract_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
) ; 
