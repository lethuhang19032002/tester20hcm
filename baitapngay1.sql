create database QLBH;
create database tester20;
use tester20;
drop database QLBH;
CREATE TABLE NHANVIEN(
id int,
hoten nvarchar(20),
diachi nvarchar(50)

);
drop table CUSTOMER;
create table CUSTOMER(
customer_id int,
customer_name varchar(20),
customer_phone varchar(20),
customer_address varchar(30),
customer_age int
);
create table TRAINEE(
TraineeID int primary key auto_increment,
Full_Name varchar(20),
Birth_date date,
Gender enum('male','female','unknown'),
ET_IQ int,
ET_Gmail int,
ET_English int,
Training_class varchar(50),
Evalution_Notes varchar(50),
constraint CHECK_ET_IQ check (ET_IQ>0 and ET_IQ<20)
);
Alter table TRAINEE ADD column VTI_Account varchar(100) not null unique;
Insert into TRAINEE(Full_Name,Birth_date,Gender,ET_IQ,ET_Gmail,ET_English,Training_class,Evalution_Notes,VTI_Account) value ('Le thi thu hang','2002-03-19','female',50,50,50,'tester20','test','20');

