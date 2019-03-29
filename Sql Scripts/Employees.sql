describe mydb.employees;

insert into mydb.employees values(1,'Mangesh','Joshi','24','joshim@gmail.com','8097770884','04-07-1993',50000);
insert into mydb.employees values(2,'Keta','Amichandwala','25','keat.a@gmail.com','9097770884','08-24-1992',50000);
insert into mydb.employees values(3,'Karan','Mahajan','25','karan.m@gmail.com','8097670884','06-28-1992',50000);
insert into mydb.employees values(4,'Chaitanya','Mogre','26','chaitanya.m@gmail.com','8057770884','04-07-1991',70000);

commit;

select * from mydb.employees;