Use natasha
Select  top 10 C.id,count(o.Id) as count_Orders
from book.Client c
     join [Book].[order] o on c.id=o.Client_Id
Where c.Name <>'Unknown'
group by c.Id
order by count(c.id) desc

select top 10 c.id,sum(i.Quantity*b.Price) as Sum_Orders
from book.Client c
     join [Book].[order] o on c.id=o.Client_Id
     join [Book].[OrderItem] i on o.Id=i.Order_Id
     join book.BookPrice b on b.Book_Id=i.Book_Id
Where c.Name <>'Unknown'
group by c.id
order by sum(i.Quantity*b.Price) desc

select Top 10 c.id,sum(i.Quantity*b.Price*d.Pct)/100 as Discount
from book.Client c
     join [Book].[order] o on c.id=o.Client_Id
     join [Book].[OrderItem] i on o.Id=i.Order_Id
     join book.BookPrice b on b.Book_Id=i.Book_Id
     join book.Card a on a.id=c.id
     join Book.Discount d on d.id=a.Discount_Id
Where c.Name <>'Unknown'
group by c.id
order by sum(i.Quantity*b.Price*d.Pct)/100 desc