Create table Book.[OrderItem](
Order_Id integer not null,
Book_Id integer not null,
Quantity integer null,
)

select *from Book.[OrderItem]