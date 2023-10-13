delete ReceiveOrderItems
where ReceiveOrderItemID = 7213
go
update ReceiveOrderItems
set ItemQuantity = 20
where ReceiveOrderItemID = 7212
go
update Products
set QuantityOnOrder = 20
where ProductID = 37
go
update Products
set QuantityOnOrder = 60
where ProductID = 40