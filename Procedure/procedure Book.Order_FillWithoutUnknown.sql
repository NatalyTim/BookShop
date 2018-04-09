Use natasha
if(object_Id('Book.Order_FillWithoutUnknown')is not null)
  drop procedure Book.Order_FillWithoutUnknown
go

create procedure Book.Order_FillWithoutUnknown(
 @QantityOrder integer
,@Date date
)
as
begin
  if isnull(@QantityOrder,0)<=0 
  or isnull(@Date,'19000110')='19000110'
     return -1
     --
     Declare @Client_Id integer
            ,@Client_IdReale integer
            ,@MinId integer
            ,@MaxId integer
         --
    While @QantityOrder>0
    begin
     Select @Client_Id = Null
           ,@Client_IdReale =Null
           ,@MinId =Null
           ,@MaxId=Null

     Select @MinId =min(c.Id)
           ,@MaxId =max(c.id)
     From Book.Client c
     Where c.Name <>'Unknown'
     --Select @MinId,@MaxId
     --
     exec Dbo.Rand_get
      @IntFrom =@MinId
     ,@intTo =@MaxId
     ,@QWE =@Client_Id out
    --select @Client_Id
     --
     Insert into book.[Order](Client_Id,DateOfOrder)
     Select @Client_Id,@Date
     --
     Select @QantityOrder=@QantityOrder-1
     end
end
go

exec Book.Order_FillWithoutUnknown
 @QantityOrder = 5
,@Date ='20170110'

select*from book.[Order]


--Truncate table book.[Order]

