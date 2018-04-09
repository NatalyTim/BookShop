Use natasha

Select top 5 with ties o.Id,sum(i.Quantity*b.Price) as Total
from [Book].[order] o
     join [Book].[OrderItem] i on i.Order_Id=o.Id
     join [Book].[BookPrice] b on b.Id=i.Book_Id
Where o.Client_Id<>14 and o.DateOfOrder between '20180201' and '20180228'
group by o.id
order by sum(i.Quantity*b.Price) desc