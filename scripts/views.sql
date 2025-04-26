CREATE OR REPLACE TABLE employees (
    id INT,
    name STRING,
    department STRING,
    salary FLOAT
);

//Inserting a values into a employee 

INSERT INTO employees (id, name, department, salary) VALUES
    (1, 'John Doe', 'HR', 60000),
    (2, 'Jane Smith', 'Finance', 75000),
    (3, 'Mike Johnson', 'Engineering', 90000),
    (4, 'Emily Davis', 'Marketing', 65000),
    (5, 'Chris Brown', 'Sales', 70000),
    (6, 'Anna Lee', 'Engineering', 88000),
    (7, 'David Wilson', 'Finance', 73000),
    (8, 'Sophia Turner', 'HR', 62000),
    (9, 'Liam Carter', 'IT', 78000),
    (10, 'Olivia Clark', 'Marketing', 67000);

select * from employees;

//Lets create a view called "it_employees" standard view
create or replace view it_employee as
select id,name,salary
from employees
where department='IT';


select * from it_employee;

//Secure view
create or replace secure view hr_employee as
select id,name,salary
from employees
where department='HR';

SELECT * from hr_employee;


//aggregated view
create or replace view agg as
select 
department,
sum(salary) as total_salary
from employees
group by department;


//Materialised view 
create or replace materialized view aggregat as
select 
department,
sum(salary) as total_salary
from employees
group by department;

select * from aggregat;


//Showing all the views

show views;
