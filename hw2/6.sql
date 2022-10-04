--Все ид и имена клиентов и их контактные телефоны, которые покупали товар "Chocolate frogs 250g".--
use WideWorldImporters
go
with OrdersCustomers as (
select o.CustomerID, c.CustomerName, o.OrderID, c.PhoneNumber
from Sales.Customers c
join Sales.Orders o
on o.CustomerID=c.CustomerID
),

ItemCustomer as (select distinct ol.StockItemID, oc.CustomerID, oc.CustomerName, oc.PhoneNumber, ol.OrderID 
from OrdersCustomers oc
join Sales.OrderLines ol
on ol.OrderID=oc.OrderID)

select ic.CustomerID, ic.CustomerName, ic.PhoneNumber
from ItemCustomer ic
join Warehouse.StockItems si
on ic.StockItemID=si.StockItemID
where si.StockItemName='Chocolate frogs 250g'