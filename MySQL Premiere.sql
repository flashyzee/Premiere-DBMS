CREATE DATABASE PREMIERE;

USE PREMIERE;

CREATE TABLE REP (
    REP_NUM CHAR(2) PRIMARY KEY,
    LAST_NAME CHAR(15),
    FIRST_NAME CHAR(15),
    STREET CHAR(15),
    CITY CHAR(15),
    STATE CHAR(2),
    ZIP CHAR(5),
    COMMISSION DECIMAL(7 , 2 ),
    RATE DECIMAL(3 , 2 )
);

SELECT * FROM REP;


CREATE TABLE CUSTOMER (
    CUSTOMER_NUM CHAR(3) PRIMARY KEY,
    CUSTOMER_NAME CHAR(35) NOT NULL,
    STREET CHAR(15),
    CITY CHAR(15),
    STATE CHAR(2),
    ZIP CHAR(5),
    BALANCE DECIMAL(8 , 2 ),
    CREDIT_LIMIT DECIMAL(8 , 2 ),
    REP_NUM CHAR(2)
);

UPDATE CUSTOMER
SET 
    credit_limit = 12000
WHERE
    credit_limit = 10000
        AND Balance < Credit_limit;


CREATE TABLE LEVEL1_CUSTOMER (
    CUSTOMER_NUM CHAR(3) PRIMARY KEY,
    CUSTOMER_NAME CHAR(35),
    BALANCE DECIMAL(8 , 2 ),
    CREDIT_LIMIT DECIMAL(8 , 2 ),
    REP_NUM CHAR(2)
);
INSERT INTO LEVEL1_CUSTOMER
SELECT CUSTOMER_NUM, CUSTOMER_NAME,
BALANCE, CREDIT_LIMIT, REP_NUM 
FROM CUSTOMER WHERE CREDIT_LIMIT = 7500;

ALTER TABLE LEVEL1_CUSTOMER
ADD CUSTOMER_TYPE CHAR(1);

ALTER TABLE LEVEL1_CUSTOMER
MODIFY CUSTOMER_NAME CHAR(50);
 
ALTER TABLE LEVEL1_CUSTOMER
MODIFY CREDIT_LIMIT DECIMAL (8, 2)NOT NULL;


SELECT 
    *
FROM
    LEVEL1_CUSTOMER;

CREATE TABLE ORDERS (
    ORDER_NUM CHAR(5) PRIMARY KEY,
	ORDER_DATE DATE,
    CUSTOMER_NUM CHAR(3)
);

CREATE TABLE PART (
    PART_NUM CHAR(4) PRIMARY KEY,
    DESCRIPTION CHAR(15),
    ON_HAND DECIMAL(4 , 0 ),
    CLASS CHAR(2),
    WAREHOUSE CHAR(1),
    PRICE DECIMAL(6 , 2 )
);

CREATE TABLE ORDER_LINE (
    ORDER_NUM CHAR(5),
    PART_NUM CHAR(4),
    NUM_ORDERED DECIMAL(3 , 0 ),
    QUOTED_PRICE DECIMAL(6 , 2 ),
    PRIMARY KEY (ORDER_NUM , PART_NUM)
);


INSERT INTO REP
VALUES
('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05);
INSERT INTO REP
VALUES
('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07);
INSERT INTO REP
VALUES
('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);
INSERT INTO CUSTOMER
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20');
INSERT INTO CUSTOMER
VALUES
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35');
INSERT INTO CUSTOMER
VALUES
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65');
INSERT INTO CUSTOMER
VALUES
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35');
INSERT INTO CUSTOMER
VALUES
('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65');
INSERT INTO CUSTOMER
VALUES
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20');
INSERT INTO CUSTOMER
VALUES
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65');
INSERT INTO CUSTOMER
VALUES
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35');
INSERT INTO CUSTOMER
VALUES
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35');
INSERT INTO CUSTOMER
VALUES
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');
INSERT INTO ORDERS
VALUES
('21608','2007-10-20','148');
INSERT INTO ORDERS
VALUES
('21610','2007-10-20','356');
INSERT INTO ORDERS
VALUES
('21613','2007-10-21','408');
INSERT INTO ORDERS
VALUES
('21614','2007-10-21','282');
INSERT INTO ORDERS
VALUES
('21617','2007-10-23','608');
INSERT INTO ORDERS
VALUES
('21619','2007-10-23','148');
INSERT INTO ORDERS
VALUES
('21623','2007-10-23','608');
INSERT INTO PART
VALUES
('AT94','Iron',50,'HW','3',24.95);
INSERT INTO PART
VALUES
('BV06','Home Gym',45,'SG','2',794.95);
INSERT INTO PART
VALUES
('CD52','Microwave Oven',32,'AP','1',165.00);
INSERT INTO PART
VALUES
('DL71','Cordless Drill',21,'HW','3',129.95);
INSERT INTO PART
VALUES
('DR93','Gas Range',8,'AP','2',495.00);
INSERT INTO PART
VALUES
('DW11','Washer',12,'AP','3',399.99);
INSERT INTO PART
VALUES
('FD21','Stand Mixer',22,'HW','3',159.95);
INSERT INTO PART
VALUES
('KL62','Dryer',12,'AP','1',349.95);
INSERT INTO PART
VALUES
('KT03','Dishwasher',8,'AP','3',595.00);
INSERT INTO PART
VALUES
('KV29','Treadmill',9,'SG','2',1390.00);
INSERT INTO ORDER_LINE
VALUES
('21608','AT94',11,21.95);
INSERT INTO ORDER_LINE
VALUES
('21610','DR93',1,495.00);
INSERT INTO ORDER_LINE
VALUES
('21610','DW11',1,399.99);
INSERT INTO ORDER_LINE
VALUES
('21613','KL62',4,329.95);
INSERT INTO ORDER_LINE
VALUES
('21614','KT03',2,595.00);
INSERT INTO ORDER_LINE
VALUES
('21617','BV06',2,794.95);
INSERT INTO ORDER_LINE
VALUES
('21617','CD52',4,150.00);
INSERT INTO ORDER_LINE
VALUES
('21619','DR93',1,495.00);
INSERT INTO ORDER_LINE
VALUES
('21623','KV29',2,1290.00);


SELECT 
    *
FROM
    CUSTOMER;

