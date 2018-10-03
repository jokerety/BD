USE `DB`;

drop table `payments`;
drop table `sessions`;
drop table `users`;



CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
    login VARCHAR(45) NOT NULL,
    reg_dttm TIMESTAMP,
    PRIMARY KEY(user_id)
) ;

CREATE TABLE payments (
	payment_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    payment_sum DOUBLE,
    payment_dttm TIMESTAMP,
    PRIMARY KEY(payment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) ;

CREATE TABLE sessions (
    session_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    begin_dttm TIMESTAMP,
    end_dttm TIMESTAMP,
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
) ;


LOAD DATA INFILE '/var/lib/mysql-files/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/sessions.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';






