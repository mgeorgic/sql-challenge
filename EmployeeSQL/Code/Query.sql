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

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT
e.emp_no,
e.last_name,
e.first_name,
de.dept_no,
d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
on e.emp_no = de.emp_no
INNER JOIN departments as d
on de.dept_no = d.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
-- NOTES: Inner join to collect the sales dept_name, not just on columns
--		use where statement for sales department  only
SELECT
e.emp_no,
e.last_name,
e.first_name,
de.dept_no
FROM employees as e
LEFT JOIN dept_emp as de
on e.emp_no = de.emp_no
INNER JOIN departments as d
on d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT 
e.emp_no, 
e.last_name, 
e.first_name,
de.dept_no
FROM employees as e
LEFT JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON d.dept_no=de.dept_no
WHERE d.dept_name in ('Sales', 'Development')

-- 8. In descending order, list the frequency count of employee last 
-- names, i.e., how many employees share each last name.
-- NOTES: select column last name and count all (*) naming the column as 
-- 			freq_last_name. Then groupby last name and put freq_last_name in descending order
SELECT last_name,
COUNT(*) AS freq_last_name
FROM employees
GROUP BY last_name
ORDER BY freq_last_name DESC;
