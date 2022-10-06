-- SUBQUERY 
-- QUERY WITHIN A QUERY - NESTED QUERY
-- SELECT,INSERT,UPDATE,DELETE 
-- OUTER QUERY(MAIN QUERY) - INNER QUERY(NESTED QUERY) - 32 LEVELS

USE TE

select * from Employee
select * from Department

--WHERE CLAUSE - SUBQUERY

--single table
select EID,EName,EAge from Employee where EAge IN(select DISTINCT EAge from Employee where EAge<26)

--more than one table
select EID,EName,EAge,EDeptNo from Employee where EDeptNo IN(select DID from Department where Dname IN('Admin','Training'))

--SELECT CLAUSE - SUBQUERY

--single table
select EID,EName,(select EDeptNo from Employee ie where ie.EID=oe.EID) as 'Emp No' from Employee oe;

select * from Students
select * from Student_Dept
select * from Student_Rep

--more than one table

select SID,SName,(select DID from Student_Dept dep where dep.DID=stud.SDept) as 'Dept No' from Students stud;

--FROM CLAUSE - SUBQUERY

--single table
select SID,SName,SDept from (select DISTINCT count(SDept) as 'Total Departments' from Students) 
as i_stud,Students as o_stud
where o_stud.SID =i_stud.[Total Departments] 

--based on the assumption of SDept as the Score column
select SID,SName,SDept from (select DISTINCT avg(SDept) as 'Average Department' from Students) 
as i_stud,Students as o_stud
where o_stud.SDept <i_stud.[Average Department] 

--more than one table
select SID,SName,SDept from (select DISTINCT avg(DID) as 'Average Department' from Student_Dept) 
as i_stud,Students as o_stud
where o_stud.SDept <i_stud.[Average Department] 

