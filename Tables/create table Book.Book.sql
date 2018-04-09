--if object_id('Book.Book') is not null
--  drop table Book.Book
--go

create table Book.Book(
Id integer identity not null,
Name varchar (32) not null,
Author_Id integer not null,
Genre_Id integer not null,
Primary key (Id asc))
go

create unique index index_Book
on Book.Book (Author_id asc, Name asc)
go 
