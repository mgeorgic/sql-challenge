-- 1. List the following details of each employee: employee 
-- number, last name, first name, sex, and salary.
SELECT
e.emp_no, 
e.last_name, 
e.first_name, 
e.sex, 
s.salary
FROM employees as e
LEFT JOIN salaries as s
on e.emp_no = s.emp_no
ORDER BY emp_no;

-- 2. List first name, last name, and hire date for employees who 
-- were hired in 1986.
SELECT
e.first_name,
e.last_name,
e.hire_date
FROM employees as e
WHERE hire_date between'1986-01-01' and '1986-12-31'
ORDER BY hire_date;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name and first name.

SELECT
dm.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name
FROM dept_manager as dm
LEFT JOIN departments as d
on dm.dept_no = d.dept_no
LEFT JOIN employees as e
on dm.emp_no = e.emp_no
ORDER BY emp_no;

