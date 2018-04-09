use natasha
select*
From (select distinct dateadd(dd,-(datepart (dd,o.DateOfOrder))+1,o.DateOfOrder) as DateFrom
       ,dateadd (dd,(-(datepart(dd,dateadd(mm,1,o.DateOfOrder)))+1)-1,dateadd(mm,1,o.DateOfOrder))as DateTo
      From [Book].[order] o
      )T
       
     outer apply(select top 10 c.id,count(o.id) as Count_Order
                 from [Book].[Client] c
                      join [Book].[order] o on o.Client_Id=c.Id
                 Where c.name <> 'Unknown' and o.DateOfOrder between t.DateFrom and t.DateTo
                 group by c.id
                 Order by count(o.id) desc)Q
Order by 1
 
