--Все ид и имена клиентов и их контактные телефоны, которые покупали товар "Chocolate frogs 250g".--
use WideWorldImporters
go

select o.CustomerID, c.CustomerName, c.PhoneNumber, s.StockItemName
from Sales.Orders o
join Sales.Customers c
on o.CustomerID=c.CustomerID
join Sales.OrderLines ol
on ol.OrderID=o.OrderID
join Warehouse.StockItems s
on s.StockItemID=ol.StockItemID
where s.StockItemName='Chocolate frogs 250g'