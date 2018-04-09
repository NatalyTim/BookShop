create table Book.BookPlace(
Id integer identity not null,
Book_Id integer not null,
Shelf integer null,
Stand integer null,
Storage_Id integer not null,
Quantity integer null,
Primary key (Id))

