-- Final Assignment -- FinalAssign_Inserts_JodyKirton.sql
-- Jody Kirton
-- Insert at least three records per table into the Final Assignment Speciality Imports tables.


BEGIN TRANSACTION temp;

INSERT INTO si_cust (custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
VALUES ('Jody Kirton', '123 Lake Shore Blvd', 'Etobicoke', 'ON', 'M1R1S1', '416-255-5940', '416-242-2222');

INSERT INTO si_cust (custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
VALUES ('Markus Kirton', '321 Lake Shore Blvd', 'Etobicoke', 'ON', 'M1R1S1', '416-522-4059', '416-424-4444');

INSERT INTO si_cust (custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
VALUES ('Johny Smith', '1 First St', 'Toronto', 'ON', 'M4D1S2', '647-665-5544', '416-545-4432');

INSERT INTO si_cust (custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
VALUES ('Mary Smith', '2 Second St', 'Toronto', 'ON', 'M7Y6T6', '416-222-6675', '416-999-8787');



INSERT INTO si_purchinv (purchinvno, purchasedfrom, purchdate)
VALUES ('A2341', 'GMC Sommerset', '2016-02-01');

INSERT INTO si_purchinv (purchinvno, purchasedfrom, purchdate)
VALUES ('A2342', 'Bobs Carstop', '2016-03-02');

INSERT INTO si_purchinv (purchinvno, purchasedfrom, purchdate)
VALUES ('A2343', 'Honda Bayview', '2016-04-03');

INSERT INTO si_purchinv (purchinvno, purchasedfrom, purchdate)
VALUES ('A2344', 'Cars 4 U', '2016-05-01');



INSERT INTO si_car (carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
VALUES ('S1235D12', 'Jody Kirton', 'Chevrolet', 'Corvette', 2016, 'Candy Apple Red', 'Black Leather', '6.2L 8-cyl', '83478.90', 'A2341', '71385.00');

INSERT INTO si_car (carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
VALUES ('S1236D13', 'Markus Kirton', 'Acura', 'NSX', 2017, 'Nouvelle Blue', 'White', '24v V-6', '181011.60', 'A2343', '156940.00');

INSERT INTO si_car (carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
VALUES ('S1237D14', 'John Smith', 'Dodge', 'Challenger', 1970, 'Lime and Black', 'Black', '6.3L 8-Cyl', '54814.30', 'A2342', '47995.00');

INSERT INTO si_car (carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
VALUES ('S1238D15', 'Mary Smith', 'Subaru', 'Outback', 2006, 'Blue and Grey', 'Black', '2.5L 4-cyl', '8940.00', 'A2344', '7850.00');



INSERT INTO si_salesinv (invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, commission, net)
VALUES ('SI2341', '2016-02-1', 'Jody Kirton', 'Charles Stanley', 'S1235D12', 'Y', 'Y', 'N', 'N', '9993.90', '2000.00', '100.00', '4000.00', '79478.90');

INSERT INTO si_salesinv (invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, commission, net)
VALUES ('SI2343', '2016-04-03', 'Markus Kirton', 'Charles Price', 'S1236D13', 'N', 'N', 'T', 'N', '21971.60', '2000.00', '100.00', '9000.00', '172011.00');

INSERT INTO si_salesinv (invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, commission, net)
VALUES ('SI2342', '2016-03-2', 'John Smith', 'Bruno Mars', 'S1237D14', 'N', 'N', 'N', 'N', '6719.30', '1000.00', '100.00', '2000.00', '53814.30');

INSERT INTO si_salesinv (invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, commission, net)
VALUES ('SI2344', '2016-05-1', 'Mary Smith', 'Jenny Craig', 'S1238D15', 'N', 'N', 'N', 'N', '1090.00', '1000.00', '100.00', '400.00', '9540.00');



INSERT INTO si_option (optioncode, optiondesc, optionlistprice, optioncost)
VALUES ('SO24', 'MP3 Player', '250.00', '150.00');

INSERT INTO si_option (optioncode, optiondesc, optionlistprice, optioncost)
VALUES ('PO26', 'Mono Stearing', '650.00', '400.00');

INSERT INTO si_option (optioncode, optiondesc, optionlistprice, optioncost)
VALUES ('EO43', 'Sun Roof', '330.00', '200.00');

INSERT INTO si_option (optioncode, optiondesc, optionlistprice, optioncost)
VALUES ('YO52', 'Radio', '150.00', '100.00');



INSERT INTO si_invopt (invno, optioncode, optionsprice)
VALUES ('SI2341', 'SO24', '250.00');

INSERT INTO si_invopt (invno, optioncode, optionsprice)
VALUES ('SI2343', 'PO26', '650.00');

INSERT INTO si_invopt (invno, optioncode, optionsprice)
VALUES ('SI2342', 'EO43', '330.00');

INSERT INTO si_invopt (invno, optioncode, optionsprice)
VALUES ('SI2344', 'YO52', '150.00');



INSERT INTO si_invtrade (invno, carserial, tradeallow)
VALUES('SI2343', 'T1236D13', '2000.00');

INSERT INTO si_invtrade (invno, carserial, tradeallow)
VALUES('SI2342', 'T1237D14', '2500.00');

INSERT INTO si_invtrade (invno, carserial, tradeallow)
VALUES('SI2344', 'T1238D15', '1500.00');



INSERT INTO si_caropt (carserial, optioncode)
VALUES('S1235D12', 'SO24');

INSERT INTO si_caropt (carserial, optioncode)
VALUES('S1236D13', 'PO26');

INSERT INTO si_caropt (carserial, optioncode)
VALUES('S1237D14', 'EO43');

INSERT INTO si_caropt (carserial, optioncode)
VALUES('S1238D15', 'YO52');



INSERT INTO si_prospect (custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
VALUES('Joy Jones', 'Chevrolet', 'Corvette', 2015, 'Yellow', 'White', 'SO24');

INSERT INTO si_prospect (custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
VALUES('Dean Dumplings', 'Acura', 'NSX', 2017, 'Red', 'Black Leather', 'SO24');

INSERT INTO si_prospect (custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
VALUES('Joanne Penny', 'Chevrolet', 'Corvette', 2016, 'White', 'Black', 'PO26');



INSERT INTO si_servworkord (workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
VALUES('W12121', '2016-05-10', 'Jody Kirton', 'S1235D12', '25.00', '20.00', '6.76');

INSERT INTO si_servworkord (workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
VALUES('W12122', '2016-05-12', 'Markus Kirton', 'S1236D13', '20.00', '20.00', '6.01');

INSERT INTO si_servworkord (workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
VALUES('W12123', '2016-05-14', 'John Smith', 'S1237D14', '200.00', '60.00', '39.04');



INSERT INTO si_servdesc (workorderno, workdesc)
VALUES('W12121', 'Oil change');

INSERT INTO si_servdesc (workorderno, workdesc)
VALUES('W12122', 'Tighten wheel bearings');

INSERT INTO si_servdesc (workorderno, workdesc)
VALUES('W12123', 'Replace right break pad');

--ROLLBACK;
COMMIT;