if (object_id ('Book.OrderItem_fill')is not null)
  drop procedure Book.OrderItem_fill
go

create procedure Book.OrderItem_fill(
 @Order_Id         integer
,@MaxCountItem     integer
,@MinCountItem     integer
,@MinCountQuantity integer 
,@MaxCountQuantity integer
)
as
begin
  Declare  @CountItem integer
          ,@i integer
          ,@Book_id integer
          ,@Book_Id_Real integer 
          ,@MaxBook_Id integer
          ,@MinBook_Id integer
          ,@Quantity integer


  declare @bookUsed  as table( 
                                Book_Id integer 
                              )
  

  exec Dbo.Rand_get
   @IntFrom =@MinCountItem
  ,@intTo =@MaxCountItem
  ,@QWE =@CountItem out


  --Select @CountItem

  Select @i=1
  --
  
  --
  While @i <=@CountItem
  begin
   select @Book_Id = NULL 
        , @Book_ID_Real = NULL 
        , @MinBook_Id = NULL 
        , @MaxBook_Id = NULL 
        , @Quantity   = NULL  
       
   Select @MaxBook_Id=max(B.id)
         ,@MinBook_Id=min(B.id)
   From Book.Book B
          left join @bookUsed bu on bu.Book_Id = b.Id
   where  bu.Book_Id is null

    --
   exec  Dbo.Rand_get
    @IntFrom =@MinBook_Id
   ,@intTo =@MaxBook_Id
   ,@QWE =@Book_id out

   select @Book_Id_Real = min(b.Id)
   from   Book.Book b
             left join @bookUsed bu on bu.Book_Id = b.Id
   where  b.Id >= @Book_Id
     and  bu.Book_Id is null

   if @Book_Id_Real is NULL
     select @Book_Id_Real = max(b.Id)
     from   Book.Book b
              left join @bookUsed bu on bu.Book_Id = b.Id
     where  b.Id <= @Book_Id
       and  bu.Book_Id is null


    --
    exec Dbo.Rand_get   
     @IntFrom =@MinCountQuantity
    ,@intTo =@MaxCountQuantity
    ,@QWE =@Quantity out 

    --select @Book_Id, @Book_Id_Real, @MinBook_Id, @MaxBook_Id, @Quantity
    --
    insert into Book.[OrderItem](Order_Id,Book_Id,Quantity)
    select @Order_Id,@Book_id_Real,@Quantity

    insert into @bookUsed(Book_Id)
    select @Book_Id_Real
    -- -- 
    select @i=@i+1
  end

end
go




exec Book.OrderItem_fill
 @Order_Id =5
,@MaxCountItem =5
,@MinCountItem =1
,@MinCountQuantity =1
,@MaxCountQuantity =5


--Truncate  table book.[OrderItem]

select * from book.OrderItem