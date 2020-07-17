-- Drop table if exists
---
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