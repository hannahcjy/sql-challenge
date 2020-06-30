drop table titles;
drop table employees;
drop table salaries;
drop table dept_emp;
drop table dept_manager;
drop table departments;

create table departments (
	dept_no VARCHAR(30) not null primary key,
	dept_name VARCHAR(30) not null
);

create table employees (
	emp_no INT not null primary key,
	birth_date DATE not null,
	first_name VARCHAR(255) not null,
	last_name VARCHAR(255) not null,
	gender VARCHAR(30) not null,
	hire_date DATE not null
);

create table salaries (
	emp_no INT not null primary key,
	salary int not null,
	from_date DATE not null,
	to_date DATE not null
);

create table dept_manager (
	dept_no VARCHAR(30) not null,
	emp_no INT not null primary key,
	from_date DATE not null,
	to_date DATE not null,
	foreign key (dept_no) references departments(dept_no)
);

create table dept_emp (
	emp_no INT not null,
	dept_no VARCHAR(30) not null,
	from_date DATE not null,
	to_date DATE not null,
	foreign key (emp_no) references salaries(emp_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

create table titles (
	emp_no INT not null,
	title VARCHAR(255) not null,
	from_date DATE not null,
	to_date DATE not null,
	foreign key (emp_no) references salaries(emp_no),
	foreign key (emp_no) references employees(emp_no)
);


