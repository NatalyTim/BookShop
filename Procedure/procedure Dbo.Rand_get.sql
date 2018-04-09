if(object_id('Dbo.Rand_get')is not null)
drop procedure Dbo.Rand_get
go
create procedure Dbo.Rand_get(
 @IntFrom integer
,@intTo integer
,@QWE integer out
)
as 
begin
Select @QWE= convert(integer, rand()* (@IntFrom-@intTo)+@intTo)
return
end
go

Declare @A integer
 exec Dbo.Rand_get
 @IntFrom =3
,@intTo =100
,@QWE =@A out

select @a