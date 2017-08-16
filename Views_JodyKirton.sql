-- Final Assignment -- FinalAssign_Views_JodyKirton.sql
-- Jody Kirton
-- Create database VIEWS that define each of the 9 user views for the Final Assignment Speciality Imports tables.


--1). Vehicle Inventory Record
-- Vehicle (VehicleSerial#, VehicleMake, VehicleModel, VehicleYear, VehicleExteriorColor, VehicleTrim, VehiclePurchaseFrom, VehiclePurchaseInv.#, VehiclePurchaseDate, VehiclePurchaseCost, VehicleListBasePrice[PartsCode, PartsDescription, PartsListPrice])

CREATE VIEW Vehicle_Inventory_Record AS
     SELECT cr.carserial, make, model, caryear, extcolour, trim, pv.purchasedfrom, pv.purchinvno, purchdate, purchcost, baselistprice, op.optioncode, optiondesc, optionlistprice
       FROM si_car cr, si_purchinv pv, si_caropt co, si_option op
      WHERE cr.purchinvno = pv.purchinvno
        AND cr.carserial = co.carserial
        AND co.optioncode = op.optioncode;


--2). Vehicle Sales Accounting Supplement
-- VehicleSales(SalesInvoice#, CustomerName, Date, CarSerial#, CarCost, [ItemName, ItemCost], FreightPreparationCost, TaxCost, LicenseFeesCost, OtherCost, OtherSale, CommissionCost, TotalCost)

CREATE VIEW Vehicle_Sales_Accounting_Supplement AS
     SELECT si.invno, si.custname, si.invdate, cr.carserial, cr.baselistprice, op.optioncode, optionlistprice, freightprepcost, taxes, licfee, otherfeecost, otherfeeprice, commission, SUM(baselistprice + optionlistprice + freightprepcost + taxes + licfee + commission) AS totalcost
       FROM si_salesinv si, si_car cr, si_caropt co, si_option op
      WHERE si.carserial = cr.carserial
        AND cr.carserial = co.carserial
        AND co.optioncode = op.optioncode
   GROUP BY si.invno, si.custname, si.invdate, cr.carserial, cr.baselistprice, op.optioncode, optionlistprice, freightprepcost, taxes, licfee, otherfeecost, otherfeeprice, commission;


--3). Service Work Order
-- SpecialtyImportsService (ServiceInvoice#, Date, CustomerName, CustomerAddress, CustomerCity, CustomerPostalCode, CustomerTelephoneWork, CustomerTelephoneHome, VehicleSerial#, VehicleMake, VehicleModel, VehicleYear, VehicleColor, WorkDescription, PartsCosts, LaborCosts, Tax, Total)

CREATE VIEW Service_Work_Order AS
     SELECT sw.workorderno, workorderdate, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone, cr.carserial, make, model, caryear, extcolour, workdesc, partprice, labourprice, tax, SUM(partprice + labourprice + tax) AS total
       FROM si_servworkord sw, si_cust cu, si_car cr, si_servdesc sd
      WHERE sw.custname = cu.custname
        AND sw.carserial = cr.carserial
        AND sw.workorderno = sd.workorderno
   GROUP BY sw.workorderno, workorderdate, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone, cr.carserial, make, model, caryear, extcolour, workdesc, partprice, labourprice, tax;


--4). Sales Invoice
-- SalesInvoice (SalesInvoice#, SalesDate, SaleCustomerFirstName-SaleCustomerInitial-SaleCustomerLastName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerPhone, Salesman, VehicalSerial#, VehicleMake, VehicleModel, VehicleYear, VehicleColor, InsuranceFineTheft, InsuranceCollision, InsuranceLiability, InsurancePropertyDamage, [OptionsCode, OptionsDescription, OptionsPrice], [TradeInVehicleSerial#, TradeInVehicleAllowance], TotalPrice, TradeInVehicleAllowanceSum, Discount, Net, Taxes, TotalPayable)

CREATE VIEW Sales_Invoice AS
     SELECT si.invno, invdate, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone, salesman, cr.carserial, make, model, caryear, extcolour, insfire, inscollision, insliab, insdamage, op.optioncode, optiondesc, optionlistprice, it.carserial AS tradecarserial, tradeallow, SUM(optionlistprice + baselistprice) AS totalprice, SUM(tradeallow) AS tradeallowsum, (SUM(optionlistprice + baselistprice) - tradeallow) AS net, taxes, (SUM(optionlistprice + baselistprice) - tradeallow + taxes) AS totalpayable
       FROM si_salesinv si, si_cust cu, si_car cr, si_invopt ip, si_option op, si_invtrade it
      WHERE si.custname = cu.custname
        AND si.carserial = cr.carserial
        AND si.invno = ip.invno
        AND ip.optioncode = op.optioncode
        AND si.invno = it.invno
   GROUP BY si.invno, invdate, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone, salesman, cr.carserial, make, model, caryear, extcolour, insfire, inscollision, insliab, insdamage, op.optioncode, optiondesc, optionlistprice, it.carserial, tradeallow, optionlistprice, baselistprice, net, taxes;


--5). Service Log
-- ServiceLog (Invoice#, Date, Serial#, Cost)

CREATE VIEW Service_Log AS
     SELECT workorderno, workorderdate, carserial, SUM(partprice + labourprice + tax) AS Cost
       FROM si_servworkord
   GROUP BY workorderno, workorderdate, carserial;


--6). Prospect List
-- ProspectList (CustFirstName-CustInitial-CustLastName, [VYear, [VColor, [VMake, [VModel, [VTrim, [VOptionCode, [VOptionDesc]]]]]]]) 

CREATE VIEW Prospect_List AS
     SELECT custname, caryear, carextcolour, carmake, carmodel, cartrim, op.optioncode, optiondesc
       FROM si_prospect ps, si_option op
      WHERE ps.optioncode = op.optioncode;


--7. Online Search Report (report c)
-- VehicleHistory(VehicleMake, VehicleModel, VehicleYear, VehicleEngineType, serviceVisits, AvgCost)

CREATE VIEW Online_Search_Report AS
     SELECT make, model, caryear, enginetype, COUNT(sw.carserial) AS servicevisits, AVG(partprice + labourprice) AS avgcost 
       FROM si_car cr LEFT OUTER JOIN si_servworkord sw ON (cr.carserial = sw.carserial)
   GROUP BY make, model, caryear, enginetype;


--8. Mailing List (report a)
-- SalesmanCustomers (SalesmanName [CustomerName, CustomerAddress, CustomerCity, CustomerPostalCode, CustomerHome#, CustomerMobile#])

    CREATE VIEW Mailing_List AS
SELECT DISTINCT salesman, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone
           FROM si_salesinv si LEFT OUTER JOIN si_cust cu ON (si.custname = cu.custname);


--9. Vehicle History (report b)
-- VehicleHistory(VehicleMake, VehicleModel, VehicleExteriorColor, VehicleTrim, VehicleYear, [CustomerName, CustomerAddress, CustomerCity, CustomerPostalCode, CustomerHome#, CustomerMobile#])

    CREATE VIEW Vehicle_History AS
SELECT DISTINCT make, model, extcolour, trim, caryear, cu.custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone 
           FROM si_car cr, si_cust cu
          WHERE cr.custname = cu.custname;