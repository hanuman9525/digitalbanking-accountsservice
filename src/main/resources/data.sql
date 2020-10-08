Postgres Script
==================
CREATE TABLE IF NOT EXISTS CUSTOMER  
 ( 
 CUSTOMER_ID INTEGER NOT NULL, 
 CUSTOMER_NAME CHARACTER VARYING(20)  NOT NULL, 
 PASSWORD CHARACTER VARYING(20) , 
 LAST_LOGIN DATE, 
 MOBILE_NO INTEGER, 
 EMAIL_ID CHARACTER VARYING(50) , 
 CONSTRAINT PK_CUSTID PRIMARY KEY (CUSTOMER_ID) 
  ) 
 WITH ( 
   OIDS = FALSE 
 ); 
 
 
 ALTER TABLE CUSTOMER 
 OWNER TO POSTGRES; 


  CREATE TABLE IF NOT EXISTS ACCOUNT 
 ( 
     ACCOUNT_NO INTEGER NOT NULL, 
     CUSTOMER_ID INTEGER, 
     IFSC_CODE CHARACTER VARYING(30)  NOT NULL, 
     ACCOUNT_TYPE CHARACTER VARYING(20)  NOT NULL, 
     ACCOUNT_BALANCE DOUBLE PRECISION NOT NULL, 
     ACCOUNT_CREATION_DATE DATE, 
     ACCOUNT_STATUS BOOLEAN NOT NULL, 
     CONSTRAINT PK_ACCNO PRIMARY KEY (ACCOUNT_NO), 
     CONSTRAINT ACCOUNT_CUSTOMER_ID_FKEY FOREIGN KEY (CUSTOMER_ID) 
     REFERENCES PUBLIC.CUSTOMER (CUSTOMER_ID) MATCH SIMPLE 
     ON UPDATE NO ACTION 
     ON DELETE NO ACTION 
 ) 
; 
ALTER TABLE PUBLIC.ACCOUNT     OWNER TO POSTGRES;

CREATE TABLE IF NOT EXISTS TRANSACTION  
 ( 
 TRANSACTION_ID INTEGER NOT NULL,
 ACCOUNT_NO INTEGER NOT NULL,
 ACCOUNT_BALANCE DOUBLE PRECISION NOT NULL,
 TRANSACTION_TYPE CHARACTER VARYING(10),
 COMMENTS CHARACTER VARYING(50), 
 TRANSACTION_DATE TIMESTAMP, 
 ACCOUNT_BALANCE_DEBIT DOUBLE PRECISION,
 ACCOUNT_BALANCE_CREDIT DOUBLE PRECISION,
 CONSTRAINT PK_TRANSACTION_ID PRIMARY KEY (TRANSACTION_ID),
 CONSTRAINT ACCOUNT_ACCOUNT_NO_FKEY FOREIGN KEY (ACCOUNT_NO) 
 REFERENCES PUBLIC.ACCOUNT (ACCOUNT_NO) MATCH SIMPLE 
 ON UPDATE NO ACTION 
 ON DELETE NO ACTION
  ) 
 WITH ( 
   OIDS = FALSE 
 ); 

 ALTER TABLE PUBLIC.TRANSACTION OWNER TO POSTGRES;

delete from CUSTOMER;
 
INSERT INTO	 CUSTOMER ("customer_id", "customer_name", "password", "last_login", "mobile_no", "email_id") VALUES 
 (556677,	'Raja',	'capg123',	NULL,	NULL,	NULL), 
 (556678,	'Mahesh',	'capg123',	NULL,	NULL,	NULL);
 --ON CONFLICT (customer_id) DO NOTHING; 

 delete from ACCOUNT;
 
 INSERT INTO ACCOUNT ("account_no", "customer_id", "ifsc_code", "account_type", "account_balance", "account_creation_date", "account_status") VALUES 
 (355245,	556677,	'DBSB238',	'S',	25000,	'2016-11-12',	't'), 
 (355230,	556677,	'DBSB234',	'S',	5000,	'2016-11-08',	't'), 
 (355650,	556677,	'DBSB274',	'S',	50000,	'2016-12-03',	't'), 
 (355680,	556678,	'DBSB244',	'S',	50000,	'2016-01-03',	't'), 
 (3557230,	556678,	'DBSB294',	'S',	50000,	'2016-11-11',	't');
 --ON CONFLICT (account_no) DO NOTHING; 

 delete from TRANSACTION;
 
 
 
 MySql_Script
 ================
 

CREATE TABLE account
(
    account_no integer NOT NULL,
    customer_id integer,
    ifsc_code varchar(30) NOT NULL,
    account_type varchar(20) NOT NULL,
    account_balance double NOT NULL,
    account_creation_date date,
    account_status boolean NOT NULL,
    CONSTRAINT pk_accno PRIMARY KEY (account_no),
    CONSTRAINT account_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
       
);


CREATE TABLE customer
(
    customer_id integer NOT NULL,
    customer_name varchar(20)  NOT NULL,
    password varchar(20) ,
    last_login date,
    mobile_no integer,
    email_id character varying(50) ,
    CONSTRAINT pk_custid PRIMARY KEY (customer_id)
);



CREATE TABLE account_tansaction
(
    transaction_id numeric NOT NULL,
    tx_date timestamp,
    tx_details varchar(200) ,
    tx_type varchar(300) ,
    account_no numeric(16),
    tx_value numeric(10, 2),
    tx_description varchar(250) ,
    CONSTRAINT account_tansaction_pkey PRIMARY KEY (transaction_id)
);


INSERT INTO account(account_no, customer_id, ifsc_code, account_type, account_balance, account_creation_date, account_status) VALUES
(355245,	556677,	'DBSB238',	'S',	25000,	'2016-11-12',	1);
INSERT INTO account(account_no, customer_id, ifsc_code, account_type, account_balance, account_creation_date, account_status) VALUES
(355230,	556677,	'DBSB234',	'S',	5000,	'2016-11-08',	1);
INSERT INTO account(account_no, customer_id, ifsc_code, account_type, account_balance, account_creation_date, account_status) VALUES
(355650,	556677,	'DBSB274',	'S',	50000,	'2016-12-03',	1);
INSERT INTO account(account_no, customer_id, ifsc_code, account_type, account_balance, account_creation_date, account_status) VALUES
(355680,	556678,	'DBSB244',	'S',	50000,	'2016-01-03',	1);
INSERT INTO account(account_no, customer_id, ifsc_code, account_type, account_balance, account_creation_date, account_status) VALUES
(3557230,	556678,	'DBSB294',	'S',	50000,	'2016-11-11',	1);

INSERT INTO customer(customer_id, customer_name, password, last_login, mobile_no, email_id) VALUES
(556677,	'Raja',	'capg123',	NULL,	NULL,	NULL);
INSERT INTO customer(customer_id, customer_name, password, last_login, mobile_no, email_id) VALUES
(556678,	'Mahesh',	'capg123',	NULL,	NULL,	NULL);



INSERT INTO account_tansaction(transaction_id, tx_date, tx_details, tx_type, account_no, tx_value, tx_description)
	VALUES (1, '2017-02-12 12:23:42', 'Credit ref no 123456', 'CR', 556677, 1200, 'Credit by Cash');
    
INSERT INTO account_tansaction(transaction_id, tx_date, tx_details, tx_type, account_no, tx_value, tx_description)
	VALUES (2, '2017-02-18 12:23:42', 'Debit ATM ref No 1234564', 'DR', 556677, 1600, 'Debit at ATM');
    
INSERT INTO account_tansaction(transaction_id, tx_date, tx_details, tx_type, account_no, tx_value, tx_description)
	VALUES (3, '2017-02-01 12:23:42', 'Credit ref No 324234', 'CR', 556677, 1500, 'Credti by Netbanking');
 
 
 
