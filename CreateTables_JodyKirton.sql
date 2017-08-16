-- Final Assignment -- FinalAssign_CreateTables_JodyKirton.sql
-- Jody Kirton
-- Create tables for Final Assignment Speciality Imports, foreign key references included.


DROP TABLE si_servdesc;
DROP TABLE si_servworkord;
DROP TABLE si_prospect;
DROP TABLE si_caropt;
DROP TABLE si_invtrade;
DROP TABLE si_invopt;
DROP TABLE si_option;
DROP TABLE si_salesinv;
DROP TABLE si_car;
DROP TABLE si_purchinv;
DROP TABLE si_cust;


CREATE TABLE si_cust (
	custname		VARCHAR(25),
	custaddress		VARCHAR(30),
	custcity		VARCHAR(30),
	custprovince	VARCHAR(20),
	custpostal		VARCHAR(10),
	custhomephone	VARCHAR(14),
	custworkphone	VARCHAR(14),
	CONSTRAINT pksicust PRIMARY KEY (custname)
);

CREATE TABLE si_purchinv (
	purchinvno		VARCHAR(10),
	purchasedfrom	VARCHAR(15) NOT NULL,
	purchdate		DATE,
	CONSTRAINT pksipurchinv PRIMARY KEY (purchinvno)
);

CREATE TABLE si_car (
	carserial		CHAR(8),
	custname		VARCHAR(25),
	make			VARCHAR(15) NOT NULL,
	model			VARCHAR(15) NOT NULL,
	caryear			INTEGER		NOT NULL,
	extcolour		VARCHAR(15) NOT NULL,
	trim			VARCHAR(25),
	enginetype		CHAR(10) NOT NULL,
	baselistprice	DECIMAL(9,2),
	purchinvno		VARCHAR(10),
	purchcost		DECIMAL(9,2)
	CONSTRAINT pksicar PRIMARY KEY (carserial),
	CONSTRAINT fksicarcust FOREIGN KEY (custname) REFERENCES si_cust (custname),
	CONSTRAINT fksicarpurch FOREIGN KEY (purchinvno) REFERENCES si_purchinv (purchinvno)
);

CREATE TABLE si_salesinv (
	invno			CHAR(6),
	invdate			DATE NOT NULL,
	custname		VARCHAR(25) NOT NULL,
	salesman		VARCHAR(25),
	carserial		CHAR(8),
	insfire			CHAR(1),
	inscollision	CHAR(1),
	insliab			CHAR(1),
	insdamage		CHAR(1),
	taxes			DECIMAL(8,2),
	freightprepcost	DECIMAL(8,2),
	licfee			DECIMAL(8,2),
	otherfeecost	DECIMAL(8,2),
	otherfeeprice	DECIMAL(8,2),
	commission		DECIMAL(8,2),
	net				DECIMAL(9,2),
	CONSTRAINT pksisalesinv PRIMARY KEY (invno),
	CONSTRAINT fksisalesinvcust FOREIGN KEY (custname) REFERENCES si_cust (custname),
	CONSTRAINT fksisalesinvcar FOREIGN KEY (carserial) REFERENCES si_car (carserial)
);

CREATE TABLE si_option (
	optioncode		CHAR(4),
	optiondesc		VARCHAR(30) NOT NULL,
	optionlistprice	DECIMAL(7,2) NOT NULL,
	optioncost		DECIMAL(7,2) NOT NULL,
	CONSTRAINT pkoption PRIMARY KEY (optioncode)
);

CREATE TABLE si_invopt (
	invno			CHAR(6),
	optioncode		CHAR(4),
	optionsprice	DECIMAL(8,2),
	CONSTRAINT pkinvopt PRIMARY KEY (invno, optioncode)
);

CREATE TABLE si_invtrade (
	invno			CHAR(6),
	carserial		CHAR(8),
	tradeallow		DECIMAL(8,2),
	CONSTRAINT pkinvtrade PRIMARY KEY (invno, carserial)
);

CREATE TABLE si_caropt (
	carserial		CHAR(8),
	optioncode		CHAR(4),
	CONSTRAINT pkcaropt PRIMARY KEY (carserial, optioncode)
);

CREATE TABLE si_prospect (
	custname		VARCHAR(25) NOT NULL,
	carmake			VARCHAR(15) NOT NULL,
	carmodel		VARCHAR(15),
	caryear			CHAR(4),
	carextcolour	VARCHAR(15),
	cartrim			VARCHAR(25),
	optioncode		CHAR(4),
	CONSTRAINT pkprospect UNIQUE (custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
);

CREATE TABLE si_servworkord (
	workorderno		CHAR(6),
	workorderdate	DATE NOT NULL,
	custname		VARCHAR(25) NOT NULL,
	carserial		CHAR(8) NOT NULL,
	partprice		DECIMAL(7,2),
	labourprice		DECIMAL(7,2),
	tax				DECIMAL(7,2) NOT NULL,
	CONSTRAINT pkservworkord PRIMARY KEY (workorderno),
	CONSTRAINT fkservworkordcust FOREIGN KEY (custname) REFERENCES si_cust (custname),
	CONSTRAINT fkserworkordcar FOREIGN KEY (carserial) REFERENCES si_car (carserial)
);

CREATE TABLE si_servdesc (
	workorderno		CHAR(6),
	workdesc		VARCHAR(255),
	CONSTRAINT pkservdesc PRIMARY KEY (workorderno, workdesc)
);
