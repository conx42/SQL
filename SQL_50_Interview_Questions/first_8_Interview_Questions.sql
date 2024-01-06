USE 50_interview_questions;
select * from worker;
-- Q1
-- Q-1. Write an SQL query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>.
select first_name as Worker_Name from worker;
-- Q2
-- Q-2. Write an SQL query to fetch "FIRST_NAME" from Worker table in upper case.
select upper(first_name) as Worker_Name from worker;
-- Q3
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department) from Worker;
-- alternative
select department, count(*) as worker_number from Worker
group by department;
-- Q4
-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
select substring(first_name,1,3) from worker;
-- Q5
-- Q-5. Write an SQL query to find the position of the alphabet ('b') in the first name column 'Amitabh' from Worker table.
select * from worker;
select first_name, instr(first_name, 'b') from worker
where first_name='Amitabh';
-- Q6
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(first_name) from worker;
-- Q7
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(department) from worker;
-- Q8
-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select DEPARTMENT, length(department), count(*) from worker
group by DEPARTMENT;
-- OR
select distinct department, length(department) from worker;

/*
*/
-- Q9
-- Q-9. Write an SQL query to print the FIRST NAME from Worker table after replacing 'a' with 'A'.
select replace(first_name, 'a', 'A') from worker;

-- Q10
-- Q-10. Write an SQL query to print the FIRST NAME and LAST NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select concat(first_name, " ",last_name) as COMPLETE_NAME from worker;

-- Q11
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker
order by FIRST_NAME asc;
/*

*/
-- Q12
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by
-- FIRST NAME Ascending and DEPARTMENT Descending.
select * from worker
order by FIRST_NAME asc, DEPARTMENT desc;

-- Q13
-- Q-13. Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
select * from worker
where first_name IN ('Vipul','Satish');
-- OR
select * from worker
where first_name = 'Vipul' OR first_name='Satish';

-- Q14
-- Q-14. Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from Worker table.
select * from worker
where first_name NOT IN ('Vipul','Satish');
-- OR
select * from worker
where first_name != 'Vipul' OR first_name <> 'Satish';

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as "Admin*".
select * from worker
where department='Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
select * from worker
where FIRST_NAME like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'.
select * from worker
where FIRST_NAME like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets.
select * from worker
where FIRST_NAME like '______%a';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from workers
where salary between 100000 and 500000; 

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb'2014.
select * from worker
where JOINING_DATE between '2014-02-01 00:00:00' AND '2014-02-28 00:00:00';
-- OR
-- CodeHELP solution
select * from worker
where year(joining_date) = 2014 AND month(joining_date) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
select DEPARTMENT,count(DEPARTMENT) from worker
group by DEPARTMENT
having DEPARTMENT='Admin';
-- OR
-- CodeHELP solution
select department,count(*) from worker
where DEPARTMENT='Admin';  -- only admin cheyeche bole grouping err kono dorkar nei

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name, ' ',last_name) as Worker_Full_Name from worker
where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department,count(*) as number_of_employees from worker
group by department
order by number_of_employees desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select first_name, worker_title  from (select * from worker as w
inner join title as t
on w.WORKER_ID=t.WORKER_REF_ID) as temp_joined_table
where worker_title = 'Manager';
-- CodeHELP solution
select w.* from worker as w
inner join title as t
on w.WORKER_ID=t.WORKER_REF_ID where t.worker_title='Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of different titles in the ORG.
select worker_title,count(*) from title
group by worker_title
having count(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM worker
WHERE MOD(worker_id, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table.
select * from worker
where mod(worker_id,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select w.* from worker as w
INNER JOIN worker_clone as cw
using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
select w.* from worker as w
left join worker_clone as cw
using(worker_id);

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL table use hocche
select current_date();
select current_time();
select current_user();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker
order by salary desc
limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker 
order by salary desc
limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
-- co-related sub query
-- Later

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
/*
ON w1.salary = w2.salary;
korechi karon question ee boleche ["fetch the list of employees with the same salary"] taii
*/
select w1.worker_id as w1_ID, w1.first_name as w1_name, w1.salary as w1_salary,
w2.worker_id as w2_id, w2.first_name as w2_name, w2.salary as w2_salary
from worker as w1
INNER JOIN worker as w2
ON w1.salary = w2.salary;
/*
NEXT 
*/
/*
ON w1.salary = w2.salary
WHERE w1.WORKER_ID != w2.WORKER_ID; -- alada employee(differentiate by id) with same salary list hoye jabe
*/
select w1.worker_id as w1_ID, w1.first_name as w1_name, w1.salary as w1_salary,
w2.worker_id as w2_id, w2.first_name as w2_name, w2.salary as w2_salary
from worker as w1
INNER JOIN worker as w2
ON w1.salary = w2.salary
WHERE w1.WORKER_ID != w2.WORKER_ID; -- alada employee(differentiate by id) with same salary list hoye jabe





-- 43:08
