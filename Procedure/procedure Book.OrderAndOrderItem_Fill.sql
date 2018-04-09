if(object_id('Book.OrderAndOrderItem_Fill')is not null)
  drop procedure Book.OrderAndOrderItem_Fill
go

create procedure Book.OrderAndOrderItem_Fill(
  @DateFrom date
 ,@DateTo date
 )
 as
 begin
  Declare @A integer
         ,@Order integer
   
  While @DateFrom<=@DateTo
    begin
      
      exec Dbo.Rand_get
       @IntFrom =1
      ,@intTo =100
      ,@QWE =@A out
      
      Select @A=@A/2
      --
      exec Book.Order_FillByUnknown
       @QantityOrder = @A
      ,@Date = @DateFrom
      --
      exec Book.Order_FillWithoutUnknown
       @QantityOrder = @A
      ,@Date = @DateFrom
      --
      Select @Order=min(id)
      from Book.[Order] o
      where o.DateOfOrder = @DateFrom
        
      while  @Order is not null
      begin
        exec Book.OrderItem_fill
          @Order_Id=@Order
        ,@MaxCountItem =20
        ,@MinCountItem =1
        ,@MinCountQuantity =1
        ,@MaxCountQuantity = 100

        Select @Order=min(o.id)
        from book.[order] o
        Where o.id>@Order
          and o.DateOfOrder = @DateFrom
      end
      --
    Select @DateFrom=dateadd (day,1,@DateFrom)
    end
 end
 go

 /*
 exec Book.OrderAndOrderItem_Fill
  @DateFrom ='20170110'
 ,@DateTo ='20170115'

 --Truncate table book.[order]
 select * from book.[order]
 --Truncate table book.orderItem
 select o.id, count(*), max(o.DateOfOrder)
 from   book.[order] o 
          join book.orderItem oi on oi.Order_Id = o.id 
group by o.id
order by 3, 1
*/