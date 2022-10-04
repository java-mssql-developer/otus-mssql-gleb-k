--Десять последних продаж (по дате продажи) с именем клиента и именем сотрудника, который оформил заказ (SalespersonPerson)--
use WideWorldImporters
go

with a as (select top(10) *
from Sales.Invoices
order by InvoiceDate desc)

select a.InvoiceID, customers.CustomerName
from a
inner join Sales.Customers customers
on a.CustomerID=customers.CustomerID
