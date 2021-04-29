-- Drop Tables if it exists in databases
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_employees;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create a table schema for each of the six CSV files. 
-- Specify data types, primary keys, foreign keys, and other constraints.

CREATE TABLE departments (
	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR (10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);	
	
CREATE TABLE dept_emp (
	"id" serial NOT NULL,
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR (7),
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL, 
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	title_id VARCHAR (10) NOT NULL,
	title VARCHAR (255) NOT NULL,
	PRIMARY KEY (title_id)
);

-- See all tables
select * from departments;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

