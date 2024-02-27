--Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
Join salaries ON employees.emp_no =salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date)=1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dept_managers.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name
FROM dept_managers
JOIN departments ON dept_managers.dept_no = departments.dept_no
JOIN employees ON dept_managers.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employees.first_name, employees.last_name 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT * FROM departments;

--Looked up all the department names and found the Sales department number is d007.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees 
GROUP BY last_name 
ORDER BY "Frequency count" DESC;
