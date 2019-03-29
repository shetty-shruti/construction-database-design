describe mydb.accounts;

insert into mydb.accounts values(67897679468,'Checking',1);
insert into mydb.accounts values(67897789468,'Saving',1);
insert into mydb.accounts values(68956885686,'Saving',2);
insert into mydb.accounts values(68956896686,'Checking',2);

insert into mydb.accounts values(68956885556,'Saving',3);
insert into mydb.accounts values(88956896686,'Checking',3);
insert into mydb.accounts values(68956884556,'Saving',3);
insert into mydb.accounts values(88990896686,'Checking',3);
insert into mydb.accounts values(67856885556,'Saving',4);
insert into mydb.accounts values(88900896686,'Checking',4);
insert into mydb.accounts values(68959985556,'Saving',5);
insert into mydb.accounts values(88922896686,'Saving',5);
insert into mydb.accounts values(68666885556,'Saving',6);
insert into mydb.accounts values(90956896686,'Checking',6);


commit;

select * from mydb.accounts order by Customer_Id;
