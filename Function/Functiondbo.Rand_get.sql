if(object_id('dbo.Rand_Get')is not null)
drop function dbo.Rand_Get
go
create function dbo.Rand_Get(
  @intFrom integer
 ,@intTo integer
  )
 returns integer
 as
 begin
   declare @Q integer
   select @Q= convert (int,rand()*(@intTo-@intFrom)+@intFrom)
   return @Q;
 end
 go
  
  select dbo.Rand_Get(3,10)