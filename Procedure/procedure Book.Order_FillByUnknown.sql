if(object_id('Book.Order_FillByUnknown')is not null)
  drop procedure Book.Order_FillByUnknown
go

create procedure Book.Order_FillByUnknown(
 @QantityOrder integer
,@Date date 
)

as
begin
  --
  If  Isnull(@date,'19000101')='19000101'
   or Isnull(@QantityOrder,0)<=0
    return -1
  --
  declare @Client_id integer

  Select @Client_id=c.id
  from book.client c
  Where c.Name='Unknown'
  --
  While @QantityOrder > 0
  begin
    Insert into book.[order] (Client_Id,DateOfOrder)
    Select @Client_id,@Date
    --  
    Select @QantityOrder=@QantityOrder-1
  end
  --
  return
end
go

/*
--Truncate  table book.[order]
exec Book.Order_FillByUnknown
 @QantityOrder = 10
,@Date = '20170110'

select * from book.[order]

*/