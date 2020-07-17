-- Drop table if exists 
DROP TABLE salaries;
----------------------------------
-- Create new table 'departments' 
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

SELECT *
FROM departments; 
----------------------------------
-- Create new table 'departments_emp'
CREATE TABLE departments_emp (
	emp_no VARCHAR,
	dept_no VARCHAR
);

SELECT *
FROM departments_emp; 
----------------------------------
-- Create new table 'dept_manager' 
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no VARCHAR
);

SELECT *
FROM dept_manager; 
----------------------------------
-- Create new table 'employees'
CREATE TABLE employees (
	emp_no VARCHAR,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
);

SELECT *
FROM employees; 
-------------------------------------
-- Create new table 'salaries'
CREATE TABLE salaries (
	emp_no VARCHAR,
	salary VARCHAR
);

SELECT *
FROM salaries; 
------------------------------
-- Create new table 'titles' 
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

SELECT *
FROM titles; 

-- Once you have a complete database, do the following:--

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.--
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON employees.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.--
SELECT employees.hire_date, employees.first_name, employees.last_name
FROM employees
WHERE hire_date BETWEEN '01/01/86' AND '01/01/87';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.--
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.--
SELECT departments_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments_emp
INNER JOIN employees ON departments_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."--
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.--
SELECT departments_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments_emp
INNER JOIN employees ON departments_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.--
SELECT departments_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments_emp
INNER JOIN employees ON departments_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.--
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
