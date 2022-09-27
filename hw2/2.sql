/****** Поставщиков (Suppliers), у которых не было сделано ни одного заказа (PurchaseOrders).  ******/
SELECT TOP (1000) s.[SupplierID]
			       ,[SupplierName]
				   ,p.PurchaseOrderID
     
  FROM [WideWorldImporters].[Purchasing].[Suppliers] s
  FULL OUTER JOIN  [WideWorldImporters].[Purchasing].[PurchaseOrders] p
  ON s.SupplierID=p.SupplierID
  where p.PurchaseOrderID IS NULL