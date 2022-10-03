--Заказы (Orders) с ценой товара (UnitPrice) более 100$ либо количеством единиц (Quantity) товара более 20 штуки присутствующей датой комплектации всего заказа (PickingCompletedWhen).
use WideWorldImporters
go
with a as (select OrderID,customers.CustomerID as customersCust, orders.PickingCompletedWhen
from Sales.Orders orders
inner join Sales.Customers customers
on orders.CustomerID=customers.CustomerID),

b as (select itemTransactions.CustomerID,itemTransactions.StockItemID as transactionsStockItemID, stockitems.StockItemName, stockitems.UnitPrice, itemTransactions.Quantity
from Warehouse.StockItems stockitems

inner join Warehouse.StockItemTransactions itemTransactions
on stockitems.StockItemID= itemTransactions.StockItemID)

select a.OrderID, b.StockItemName, b.UnitPrice, b.Quantity, a.PickingCompletedWhen
from a
inner join b 
on a.customersCust=b.CustomerID
where b.UnitPrice>'100' OR b.Quantity<'-20.000'

