CREATE DATABASE foopswbdates;

CREATE TABLE dates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    date DATE
);

INSERT into dates (name, date) VALUES ('January', '2022-01-22');

INSERT into dates (name, date) VALUES ('February', '2022-02-26');

INSERT into dates (name, date) VALUES ('March', '2022-03-26');

INSERT into dates (name, date) VALUES ('April', '2022-04-21');

INSERT into dates (name, date) VALUES ('May', '2022-05-21');

INSERT into dates (name, date) VALUES ('June', '2022-06-21');

INSERT into dates (name, date) VALUES ('July', '2022-07-21');

INSERT into dates (name, date) VALUES ('August', '2022-08-21');

INSERT into dates (name, date) VALUES ('September', '2022-09-21');

INSERT into dates (name, date) VALUES ('October', '2022-10-21');

INSERT into dates (name, date) VALUES ('November', '2022-11-21');

INSERT into dates (name, date) VALUES ('December', '2022-12-21');

INSERT into dates (name, date) VALUES ('Testdate', '2021-01-01');