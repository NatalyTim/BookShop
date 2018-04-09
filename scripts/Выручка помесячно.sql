select Month_ = case MONTH(o.DateOfOrder)
       When 1 then '������'
       When 2 then '�������'
       When 3 then '����'
       When 4 then '������'
       When 5 then '���'
       When 6 then '����'
       When 7 then '����'
       When 8 then '������'
       When 9 then '��������'
       When 10 then '�������'
       When 11 then '������'
       When 12 then '�������'
       End
      ,sum(i.Quantity*b.Price) as Total
from [Book].[order] o
     join [Book].[OrderItem] i on i.Order_Id=o.Id
     join [Book].[BookPrice] b on b.Book_Id=i.Book_Id
     Where o.DateOfOrder between '20170101' and '20171231'
Group by month(o.DateOfOrder)
Order by month(o.DateOfOrder) 
 