use natasha
Select*
From (select distinct dateadd(dd,-datepart(dd,o.dateoforder)+1,o.dateoforder) as DateFrom
      ,dateadd(dd,(-datepart(dd,dateadd(mm,1,o.DateOfOrder))+1)-1,dateadd(mm,1,o.DateOfOrder)) as DateTo
      from [Book].[order] o
      )T
      outer apply  (Select top 10 c.id,sum(i.Quantity*p.Price) as Value
                    from [Book].[Client] c
                         join [Book].[order] r on r.Client_Id=c.id
                         join [Book].[OrderItem] i on i.Order_Id=r.id
                         join [Book].[BookPrice] p on p.Book_Id=i.Book_Id
                    Where c.name<>'Unknown' 
                      and r.DateOfOrder between t.DateFrom and t.DateTo
                    group by c.id
                    order by sum(i.Quantity*p.Price) desc
                     )W
Order by 1