select Month_ = case MONTH(o.DateOfOrder)
       When 1 then 'Январь'
       When 2 then 'Февраль'
       When 3 then 'Март'
       When 4 then 'Апрель'
       When 5 then 'Май'
       When 6 then 'Июнь'
       When 7 then 'Июль'
       When 8 then 'Август'
       When 9 then 'Сентябрь'
       When 10 then 'Октябрь'
       When 11 then 'Ноябрь'
       When 12 then 'Декабрь'
       End
      ,sum(i.Quantity*b.Price) as Total
from [Book].[order] o
     join [Book].[OrderItem] i on i.Order_Id=o.Id
     join [Book].[BookPrice] b on b.Book_Id=i.Book_Id
     Where o.DateOfOrder between '20170101' and '20171231'
Group by month(o.DateOfOrder)
Order by month(o.DateOfOrder) 
 