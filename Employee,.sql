create table EmployeeInfo_Table
(
Emp_Id int primary key,
Emp_Fir_Name varchar(20),
Emp_Sec_Name varchar(20),
Department varchar(20),
Project varchar(10),
Address varchar(100),
DOB date,
Gender varchar(10)
)

create table EmployeePosition_Table
(
Emp_Id int,
constraint fk_EmpInfo_Table foreign key (Emp_Id) references EmployeeInfo_Table(Emp_Id),
EmpPosition Varchar(20),
DateOfJoining date,
Salary int,
)
---------------------------------------------------------------------------------------------------------
insert into EmployeeInfo_Table values(1,'Rohit','Gupta','Admin','P1','Delhi','1979/12/2','Male')
insert into EmployeeInfo_Table values(2,'Rahul','Mahajan','Admin','P2','Mumbai','1986/10/10','Male')
insert into EmployeeInfo_Table values(3,'Sonia','Banerjee','HR','P3','Pune','1983/6/5','Female')
insert into EmployeeInfo_Table values(4,'Anikta','Kapoor','HR','P4','Chennai','1983/11/28','Female')
insert into EmployeeInfo_Table values(5,'Swati','Garg','HR','P5','Delhi','1991/4/6','Female')

insert into EmployeePosition_Table values(1,'Executive','2020/4/1',75000)
insert into EmployeePosition_Table values(2,'Manager','2020/4/3',50000)
insert into EmployeePosition_Table values(3,'Manager','2020/4/2',150000)
insert into EmployeePosition_Table values(2,'Officer','2020/4/2',90000)
insert into EmployeePosition_Table values(1,'Manager','2020/4/3',300000)
-------------------------------------------------------------------------------------------------------------
select * from EmployeeInfo_Table
select * from EmployeePosition_Table
------------------------------------------------------------------------------------------------------------
--1. Create a query to generate the first records from the EmployeeInfo table.
select top 1 * from EmployeeInfo_Table

--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1  * from EmployeeInfo_Table order by Emp_Id desc 

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select * from EmployeePosition_Table 
order by Salary desc
offset 2 rows 
fetch next 1 row only

--4. Write a query to find duplicate records from a table.
select emp_id ,count (Emp_Id)from EmployeeInfo_Table
group by Emp_Id
having count(Emp_Id)>1

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select  EmpPosition, sum(salary) as'sum' from EmployeePosition_Table
group by EmpPosition

--6. find the employee who has max salary
--select max (Salary) as 'max salry' from EmployeePosition_Table

select top 1 Ei.*,Ep.Salary from EmployeeInfo_Table Ei
inner join EmployeePosition_Table Ep on Ei.Emp_Id=Ep.Emp_Id
order by Ep .salary desc

--7 find the employee who has max salary from HR department
--select top 1 max (Salary) as 'max salry'  from EmployeeInfo_Table Ei
--inner join EmployeePosition_Table Ep
--on Ep.emp_id=Ei.emp_id

select top 1 Ei.*,Ep.Salary from EmployeeInfo_Table Ei
inner join EmployeePosition_Table Ep on Ei.Emp_Id=Ep.Emp_Id
where department ='HR'
order by Ep .salary desc

--8 find the age of each employee
select *, year(cast(GETDATE() as date))-year(cast(dob as date)) as 'Age' from EmployeeInfo_Table

--9 display only female employee details
select * from EmployeeInfo_Table 
where Gender='Female'

--10 display employee whos position is executive
select * from EmployeeInfo_Table Ei
inner join EmployeePosition_Table Ep
on Ei.Emp_Id=Ep.Emp_Id
where EmpPosition='Executive'

--11 display count of employee in each city
select Address,count(*)as 'cnt' from EmployeeInfo_Table
group by Address


--12 update 
update EmployeeInfo_Table  set salary=salary+2000 where department in
(
select Department from
)

delete from EmployeeInfo_Table where 
