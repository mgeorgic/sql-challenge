-- Drop Tables if it exists in databases
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_employees;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create a table schema for each of the six CSV files. 
-- Specify data types, primary keys, foreign keys, and other constraints.

create table titles(
    title_id varchar,
    title varchar(25),
    PRIMARY KEY (title_id));
	
create table departments(
    dept_no varchar(10),
    dept_name varchar(200),
    PRIMARY KEY (dept_no));

create table employees(
    emp_no int,
    emp_title_id varchar(20),
    birth_date date,
    first_name varchar(50),
    last_name varchar(50),
    sex varchar(2),
    hire_date date,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

create table dept_manager(
    dept_no varchar(10),
    emp_no int,
	primary key (dept_no,emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

create table dept_emp(
    emp_no int,
    dept_no varchar(8),
	primary key (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

create table salaries(
    emp_no int,
    salary  int,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
 
-- See all tables
select * from departments;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;