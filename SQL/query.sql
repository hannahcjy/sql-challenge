--List the following details of each employee: employee number, last name, 
--first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
left join salaries s
	on e.emp_no = s.emp_no;

--List employees who were hired in 1986.
--All info on employees table
select * from employees where hire_date >= '19860101';
-- only first_name and last_name
select first_name, last_name from employees where hire_date >= '19860101';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end 
--employment dates.
select m.dept_no, m.emp_no, d.dept_name, e.last_name, e.first_name, emp.from_date, emp.to_date
from dept_manager as m
left join departments as d on (m.dept_no = d.dept_no)
	left join employees as e on (m.emp_no = e.emp_no)
		left join dept_emp as emp on (m.emp_no = emp.emp_no);

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select d_e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as d_e
left join employees as e on (d_e.emp_no = e.emp_no)
	left join departments as d on (d_e.dept_no = d.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."
--List all info from employees table
select * from employees where (first_name = 'Hercules' and last_name like 'B%');
--List last and first name only
select last_name, first_name from employees where (first_name = 'Hercules' and last_name like 'B%');

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select d_e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as d_e
left join departments as d on (d_e.dept_no = d.dept_no)
	left join employees as e on (d_e.emp_no = e.emp_no)
		where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select d_e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as d_e
left join departments as d on (d_e.dept_no = d.dept_no)
	left join employees as e on (d_e.emp_no = e.emp_no)
		where (d.dept_name = 'Sales' or d.dept_name = 'Development');

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select count(*), last_name from employees
group by last_name;

