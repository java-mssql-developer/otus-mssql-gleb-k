--Заказы (Orders) с ценой товара (UnitPrice) более 100$ либо количеством единиц (Quantity) товара более 20 штуки присутствующей датой комплектации всего заказа (PickingCompletedWhen).
use WideWorldImporters
go
select o.OrderID, o.PickingCompletedWhen, ol.UnitPrice, ol.Quantity
from Sales.Orders o
inner join Sales.OrderLines ol
on o.OrderID=ol.OrderID
where (ol.UnitPrice>'100' OR ol.Quantity>'20') AND o.PickingCompletedWhen is not null

