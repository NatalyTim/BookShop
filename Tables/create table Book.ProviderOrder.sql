use natasha
Create table Book.ProviderOrder(
Id integer identity not null,
Book_Id integer not null,
Provider_Id integer not null,
Quantity integer null,
Price money null,
DateOfOrder date not null,
Primary key (Id))

