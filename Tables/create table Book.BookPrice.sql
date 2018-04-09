
create table Book.BookPrice(
Id integer identity not null,
DateFrom date not null,
Price money not null,
Book_Id integer not null,
Primary key (Id))

