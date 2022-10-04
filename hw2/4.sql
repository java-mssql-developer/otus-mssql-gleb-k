--Заказы поставщикам (Purchasing.Suppliers), которые должны быть исполнены (ExpectedDeliveryDate) в январе 2013 года с доставкой "Air Freight" или "Refrigerated Air Freight" (DeliveryMethodName) и которые исполнены (IsOrderFinalized).--
USE WideWorldImporters
go
with a as (select *
from Purchasing.PurchaseOrders po
where po.IsOrderFinalized='1' and ExpectedDeliveryDate between '2013-01-01 00:00:00.000' and '2013-01-31 23:59:59.999')

select *
from a
inner join [Application].DeliveryMethods delivery
on a.DeliveryMethodID=delivery.DeliveryMethodID
where delivery.DeliveryMethodName='Air Freight' or delivery.DeliveryMethodName='Refrigerated Air Freight'