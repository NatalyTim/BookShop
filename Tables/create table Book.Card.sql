use natasha
create table Book.Card (
Id integer identity not null,
Number varchar(32) not null,
Name varchar(32) not null,
Discount_Id integer null,
Primary key (Id))
