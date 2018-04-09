Use natasha 
select*
From (select distinct dateadd(dd,-(datepart (dd,o.DateOfOrder))+1,o.DateOfOrder) as DateFrom
       ,dateadd (dd,(-(datepart(dd,dateadd(mm,1,o.DateOfOrder)))+1)-1,dateadd(mm,1,o.DateOfOrder))as DateTo
      From [Book].[order] o
      )T
       outer apply (select Top 10 c.id,sum(i.Quantity*b.Price*d.Pct)/100 as Discount
                    from book.Client c
                    join [Book].[order] o on c.id=o.Client_Id
                    join [Book].[OrderItem] i on o.Id=i.Order_Id
                    join book.BookPrice b on b.Book_Id=i.Book_Id
                    join book.Card a on a.id=c.id
                    join Book.Discount d on d.id=a.Discount_Id
                    Where c.Name <>'Unknown' and o.DateOfOrder between t.DateFrom and t.DateTo
                    group by c.id
                    order by sum(i.Quantity*b.Price*d.Pct)/100 desc)Q
Order by 1