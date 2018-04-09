create table book.[order](
Id integer identity not null,
Client_Id integer not null,
DateOfOrder date not null,
Primary Key (Id))