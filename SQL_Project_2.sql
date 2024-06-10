CREATE TABLE regions (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INT IDENTITY(1,1) PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);




/*Data for the table regions */
INSERT INTO regions(region_id,region_name) 
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) 
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) 
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) 
VALUES (4,'Middle East and Africa');


/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);

/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');


/*Data for the table jobs */
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);






/*Data for the table departments */
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);


/*Data for the table employees */
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

/*Data for the table dependents */
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);


-- TASK 1 :

/*
1)WRITE A QUERY FOR  SELECT STATEMENTS :-
Syntax of  SELECT STATEMENT:-
SELECT 
    select_list
FROM
    table_name;
⦁	To get data from all the rows and columns in the employees table:
⦁	select data from the employee id, first name, last name, and hire date of all rows in the employees table:
⦁	to get the first name, last name, salary, and new salary:
⦁	Increase the salary two times and named as New_SALARY from employees table
*/

-- Get data from all rows and columns in the employees table
SELECT * FROM employees;

-- Select data from the employee id, first name, last name, and hire date of all rows in the employees table
SELECT employee_id, first_name, last_name, hire_date FROM employees;

-- To get the first name, last name, salary, and new salary (increase the salary two times and name it as New_SALARY)
SELECT first_name, last_name, salary, salary*2 AS New_SALARY FROM employees;

-- Increase the salary two times and name it as New_SALARY from employees table
SELECT *, salary*2 AS New_SALARY FROM employees;

---------------------------------------------------------------------------------------------------------------------------

/*
2)WRITE A QUERY FOR ORDER BY  STATEMENTS :-
Syntax of ORDER BY Statements:-
SELECT 
    select_list
FROM
    table_name
ORDER BY 
    sort_expression1 [ASC | DESC],
  sort_expression 2[ASC | DESC];



⦁	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
⦁	to sort employees by first names in alphabetical order:
⦁	to sort the employees by the first name in ascending order and the last name in descending order:
⦁	to sort employees by salary from high to low:
⦁	to sort the employees by values in the hire_date column from:
⦁	sort the employees by the hire dates in descending order:
*/

-- Return data from the employee id, first name, last name, hire date, and salary column of the employees table
SELECT employee_id, first_name, last_name, hire_date, salary FROM employees;

-- Sort employees by first names in alphabetical order
SELECT * FROM employees ORDER BY first_name;

-- Sort employees by the first name in ascending order and the last name in descending order
SELECT * FROM employees ORDER BY first_name ASC, last_name DESC;

-- Sort employees by salary from high to low
SELECT * FROM employees ORDER BY salary DESC;

-- Sort employees by the hire dates in ascending order
SELECT * FROM employees ORDER BY hire_date;

-- Sort employees by the hire dates in descending order
SELECT * FROM employees ORDER BY hire_date DESC;

---------------------------------------------------------------------------------------------------------------------------

/*
3)WRITE A QUERY FOR DISTINCT  STATEMENTS :-
Syntax of DISTINCT Statements:-
SELECT DISTINCT
    column1, column2, ...
FROM
    table1;

⦁	selects the salary data from the salary column of the employees table and ⦁	sorts them from high to low:
⦁	select unique values from the salary column of the employees table:
⦁	selects the job id and salary from the employees table:
⦁	to remove the duplicate values in job id and salary:
⦁	returns the distinct phone numbers of employees:
*/

-- Select salary data from the salary column of the employees table and sort them from high to low
SELECT DISTINCT salary FROM employees ORDER BY salary DESC;

-- Select unique values from the salary column of the employees table
SELECT DISTINCT salary FROM employees;

-- Select job id and salary from the employees table
SELECT DISTINCT job_id, salary FROM employees;

-- To remove the duplicate values in job id and salary
SELECT DISTINCT job_id, salary FROM employees;

-- Return the distinct phone numbers of employees
SELECT DISTINCT phone_number FROM employees;

---------------------------------------------------------------------------------------------------------------------------

/*
4)WRITE A QUERY FOR TOP N  STATEMENTS :-
Syntax of TOP N Statements(N=Will be any nos)
SELECT TOP N 
    column_list
FROM
    table1
ORDER BY column_list
⦁	returns all rows in the employees table sorted by the first_name column.
⦁	to return the first 5 rows in the result set returned by the SELECT clause:
⦁	to return five rows starting from the 4th row:
⦁	gets the top five employees with the highest salaries.
⦁	to get employees who have the 2nd highest salary in the company
*/

-- Return all rows in the employees table sorted by the first_name column
SELECT * FROM employees ORDER BY first_name;

-- Return the first 5 rows in the result set returned by the SELECT clause
SELECT TOP 5 * FROM employees;

-- Return five rows starting from the 4th row
SELECT * FROM employees ORDER BY employee_id OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;

-- Get the top five employees with the highest salaries
SELECT TOP 5 * FROM employees ORDER BY salary DESC;

-- Get employees who have the 2nd highest salary in the company
SELECT TOP 1 * FROM (SELECT TOP 2 * FROM employees ORDER BY salary DESC) AS SecondHighest ORDER BY salary ASC;

---------------------------------------------------------------------------------------------------------------------------

/*
5)WRITE A QUERY FOR WHERE  CLAUSE and COMPARISON OPERATORS :-
Syntax of WHERE  CLAUSE and COMPARISON OPERATORS:--
SELECT 
    column1, column2, ...
FROM
    table_name
WHERE
    condition;
The WHERE clause appears immediately after the FROM clause. The WHERE clause contains one or more logical expressions that evaluate each row in the table. If a row that causes the condition evaluates to true, it will be included in the result set; otherwise, it will be excluded.
Note that SQL has three-valued logic which are TRUE, FALSE, and UNKNOWN. It means that if a row causes the condition to evaluate to FALSE or NULL, the row will not be returned.
Note that the logical expression that follows the WHERE clause is also known as a predicate. You can use various operators to form the row selection criteria used in the WHERE clause.
Operator	Meaning
=			Equal to
<> (!=)		Not equal to
<			Less than
>			Greater than
<=			Less than or equal
>=			Greater than or equal

⦁	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
⦁	query finds all employees who work in the department id 5.
⦁	query finds the employee whose last name is Chen
⦁	To get all employees who joined the company after January 1st, 1999
⦁	to find the employees who joined the company in 1999,
⦁	statement finds the employee whose last name is Himuro
⦁	the query searches for the string Himuro in the last_name column of the employees table.
⦁	to find all employees who do not have phone numbers:
⦁	returns all employees whose department id is not 8.
⦁	finds all employees whose department id is not eight and ten.
⦁	to find the employees whose salary is greater than 10,000,
⦁	finds employees in department 8 and have the salary greater than 10,000:
⦁	the statement below returns all employees whose salaries are less than 10,000:
⦁	finds employees whose salaries are greater than or equal 9,000:
⦁	finds employees whose salaries are less than or equal to 9,000:
*/

-- Find employees who have salaries greater than 14,000 and sort the result sets based on salary in descending order
SELECT * FROM employees WHERE salary > 14000 ORDER BY salary DESC;

-- Find all employees who work in the department id 5
SELECT * FROM employees WHERE department_id = 5;

-- Find the employee whose last name is Chen
SELECT * FROM employees WHERE last_name = 'Chen';

-- To get all employees who joined the company after January 1st, 1999
SELECT * FROM employees WHERE hire_date > '1999-01-01';

-- Find the employees who joined the company in 1999
SELECT * FROM employees WHERE hire_date BETWEEN '1999-01-01' AND '1999-12-31';

-- Statement finds the employee whose last name is Himuro
SELECT * FROM employees WHERE last_name = 'Himuro';

-- The query searches for the string 'Himuro' in the last_name column of the employees table
SELECT * FROM employees WHERE last_name LIKE '%Himuro%';

-- Find all employees who do not have phone numbers
SELECT * FROM employees WHERE phone_number IS NULL;

-- Return all employees whose department id is not 8
SELECT * FROM employees WHERE department_id <> 8;

-- Find all employees whose department id is not eight and ten
SELECT * FROM employees WHERE department_id NOT IN (8, 10);

-- Find the employees whose salary is greater than 10,000
SELECT * FROM employees WHERE salary > 10000;

-- Find employees in department 8 and have salary greater than 10,000
SELECT * FROM employees WHERE department_id = 8 AND salary > 10000;

-- Return all employees whose salaries are less than 10,000
SELECT * FROM employees WHERE salary < 10000;

-- Find employees whose salaries are greater than or equal to 9,000
SELECT * FROM employees WHERE salary >= 9000;

-- Find employees whose salaries are less than or equal to 9,000
SELECT * FROM employees WHERE salary <= 9000;

---------------------------------------------------------------------------------------------------------------------------

/*
6)WRITE A QUERY FOR:-

		courses
	*course_id
	course_name


⦁	adds a new column named credit_hours to the courses table.
⦁	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.
⦁	changes the attribute of the fee column to NOT NULL.
⦁	to remove the fee column of the courses table
⦁	removes the max_limit and credit_hours of the courses table.
*/

-- Adds a new column named credit_hours to the courses table
ALTER TABLE courses ADD credit_hours INT;

-- Adds the fee and max_limit columns to the courses table and places these columns after the course_name column
ALTER TABLE courses 
ADD fee DECIMAL(10, 2),
ADD max_limit INT
AFTER course_name;

-- Changes the attribute of the fee column to NOT NULL
ALTER TABLE courses ALTER COLUMN fee DECIMAL(10, 2) NOT NULL;

-- To remove the fee column of the courses table
ALTER TABLE courses DROP COLUMN fee;

-- Removes the max_limit and credit_hours columns of the courses table
ALTER TABLE courses DROP COLUMN max_limit, DROP COLUMN credit_hours;

---------------------------------------------------------------------------------------------------------------------------

/*
6)WRITE A QUERY FOR:-
SQL foreign key constraint
A foreign key is a column or a group of columns that enforces a link between the data in two tables. In a foreign key reference, the primary key column (or columns) of the first table is referenced by the column (or columns) of the second table. The column (or columns) of the second table becomes the foreign key.
You use the FOREIGN KEY constraint to create a foreign key when you create or alter table. Let’s take a simple example to get a better understanding.







SQL FOREIGN KEY constraint examples
See the following projects and project_assignments tables:
CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);

CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);
Each project may have zero or more milestones while one milestone must belong to one and only one project. The application that uses these tables must ensure that for each row in the project_milestones table there exists the corresponding row in the projects table. In other words, a milestone cannot exist without a project.
Unfortunately, users may edit the database using client tool or if there is a bug in the application, a row might be added to the project_milestones table that does not correspond to any row in the projects table. Or user may delete a row in the projects table, leaving orphaned rows in the project_milestones table. This causes the application not to work properly.
Write a Query 
⦁	to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables.

⦁	Suppose the project_milestones already exists without any predefined foreign key and you want to define a FOREIGN KEY constraint for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table
*/

-- Add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables
ALTER TABLE project_milestones
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id)
REFERENCES projects(project_id);

-- Suppose the project_milestones already exist without any predefined foreign key and you want to define a FOREIGN KEY constraint for the project_id column so write a Query to add a FOREIGN KEY constraint to the existing table
ALTER TABLE project_milestones
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id)
REFERENCES projects(project_id);

---------------------------------------------------------------------------------------------------------------------------

--=======================================================================================================================--

-- TASK 2 :

/*
Logical Operators and Special  Operators:
A logical operator allows you to test for the truth of a condition ,a logical operator returns a value of true, false, or unknown.

The following table illustrates the SQL logical operators:
Operator	Meaning
AND			Return true if both expressions are true
NOT			Reverse the result of any other Boolean operator.
OR			Return true if either expression is true

OTHER SPECIAL OPERATORS:--
ANY			Return true if any one of the comparisons is true.
BETWEEN		Return true if the operand is within a range
EXISTS		Return true if a subquery contains any rows
IN			Return true if the operand is equal to one of the value in a list
LIKE		Return true if the operand matches a pattern
ALL			Return true if all comparisons are true

1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-

*/

/*

Part 1:-
⦁	finds all employees whose salaries are greater than 5,000 and less than 7,000:
⦁	finds employees whose salary is either 7,000 or 8,000:
⦁	finds all employees who do not have a phone number:
⦁	finds all employees whose salaries are between 9,000 and 12,000.
⦁	finds all employees who work in the department id 8 or 9.
⦁	finds all employees whose first name starts with the string jo
⦁	finds all employees with the first names whose the second character is  h
⦁	finds all employees whose salaries are greater than all salaries of employees in the department 8:

*/

-- Finds all employees whose salaries are greater than 5,000 and less than 7,000
SELECT * FROM employees WHERE salary > 5000 AND salary < 7000;

-- Finds employees whose salary is either 7,000 or 8,000
SELECT * FROM employees WHERE salary = 7000 OR salary = 8000;

-- Finds all employees who do not have a phone number
SELECT * FROM employees WHERE phone_number IS NULL;

-- Finds all employees whose salaries are between 9,000 and 12,000
SELECT * FROM employees WHERE salary BETWEEN 9000 AND 12000;

-- Finds all employees who work in the department id 8 or 9
SELECT * FROM employees WHERE department_id IN (8, 9);

-- Finds all employees whose first name starts with the string "jo"
SELECT * FROM employees WHERE first_name LIKE 'jo%';

-- Finds all employees with the first names whose the second character is "h"
SELECT * FROM employees WHERE first_name LIKE '_h%';

-- Finds all employees whose salaries are greater than all salaries of employees in department 8
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 8);

---------------------------------------------------------------------------------------------------------------------------

/*

Part 2:- 
⦁	finds all employees whose salaries are greater than the average salary of every department:
⦁	finds all employees who have dependents:
⦁	to find all employees whose salaries are between 2,500 and 2,900:
⦁	to find all employees whose salaries are not in the range of 2,500 and 2,900:
⦁	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
⦁	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
⦁	to find employees who joined the company between 1990 and 1993:

*/

-- Finds all employees whose salaries are greater than the average salary of every department
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees GROUP BY department_id);

-- Finds all employees who have dependents
SELECT * FROM employees WHERE employee_id IN (SELECT DISTINCT employee_id FROM dependents);

-- To find all employees whose salaries are between 2,500 and 2,900
SELECT * FROM employees WHERE salary BETWEEN 2500 AND 2900;

-- To find all employees whose salaries are not in the range of 2,500 and 2,900
SELECT * FROM employees WHERE salary NOT BETWEEN 2500 AND 2900;

-- To find all employees who joined the company between January 1, 1999, and December 31, 2000
SELECT * FROM employees WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31';

-- To find employees who have not joined the company from January 1, 1989 to December 31, 1999
SELECT * FROM employees WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';

-- To find employees who joined the company between 1990 and 1993
SELECT * FROM employees WHERE YEAR(hire_date) BETWEEN 1990 AND 1993;

---------------------------------------------------------------------------------------------------------------------------

/*

Part 3:-
⦁	to find all employees whose first names start with Da
⦁	to find all employees whose first names end with er
⦁	to find employees whose last names contain the word an:
⦁	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
⦁	to find employees whose first names start with any number of characters and are followed by at most one character:
⦁	to find all employees whose first names start with the letter S but not start with Sh:

*/

-- To find all employees whose first names start with "Da"
SELECT * FROM employees WHERE first_name LIKE 'Da%';

-- To find all employees whose first names end with "er"
SELECT * FROM employees WHERE first_name LIKE '%er';

-- To find employees whose last names contain the word "an"
SELECT * FROM employees WHERE last_name LIKE '%an%';

-- Retrieves employees whose first names start with "Jo" and are followed by at most 2 characters
SELECT * FROM employees WHERE first_name LIKE 'Jo__';

-- To find employees whose first names start with any number of characters and are followed by at most one character
SELECT * FROM employees WHERE first_name LIKE '_%_';

-- To find all employees whose first names start with the letter "S" but not start with "Sh"
SELECT * FROM employees WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';

---------------------------------------------------------------------------------------------------------------------------

/*

Part 4:-
⦁	retrieves all employees who work in the department id 5.
⦁	To get the employees who work in the department id 5 and with a salary not greater than 5000.
⦁	statement gets all the employees who are not working in the departments 1, 2, or 3.
⦁	retrieves all the employees whose first names do not start with the letter D.
⦁	to get employees whose salaries are not between 5,000 and 1,000.

*/

-- Retrieves all employees who work in the department id 5
SELECT * FROM employees WHERE department_id = 5;

-- To get the employees who work in the department id 5 and with a salary not greater than 5000
SELECT * FROM employees WHERE department_id = 5 AND salary <= 5000;

-- Statement gets all the employees who are not working in the departments 1, 2, or 3
SELECT * FROM employees WHERE department_id NOT IN (1, 2, 3);

-- Retrieves all the employees whose first names do not start with the letter D
SELECT * FROM employees WHERE first_name NOT LIKE 'D%';

-- To get employees whose salaries are not between 5,000 and 10,000
SELECT * FROM employees WHERE salary NOT BETWEEN 5000 AND 10000;

---------------------------------------------------------------------------------------------------------------------------

/*

Part 5:- 
			_________________			________________
			|	employees	|			|	dependents	|
			|_______________|			|_______________|
			|*employee_id	|			|*dependent_id	|
			| first_name	|			| first_name	|
			| last_name		|			| last_name		|
			| email			|			| relationship	|
			| phone_number	|			| employee_id	|
			| hire_date		|			|_______________|
			| job_id		|
			| salary		|
			| manager_id	|
			| department_id	|
			|_______________|

⦁	Write a query to get the employees who do not have any dependents by above table
⦁	To find all employees who do not have the phone numbers
⦁	To find all employees who have phone numbers

*/

-- Write a query to get the employees who do not have any dependents by above table
SELECT * FROM employees WHERE employee_id NOT IN (SELECT employee_id FROM dependents);

-- To find all employees who do not have phone numbers
SELECT * FROM employees WHERE phone_number IS NULL;

-- To find all employees who have phone numbers
SELECT * FROM employees WHERE phone_number IS NOT NULL;

---------------------------------------------------------------------------------------------------------------------------

--=======================================================================================================================--

-- TASK 3 :

/*
JOINS:-
SQL INNER JOIN clause
 

For each row in table A, the inner join clause finds the matching rows in table B. If a row is matched, it is included in the final result set.
Suppose the columns in the A and B tables are a and b. The following statement illustrates the inner join clause:
SELECT a
FROM A
INNER JOIN B ON b = a;
 
Write a Query - 
⦁	To get the information of the department id 1,2, and 3
⦁	To get the information of employees who work in the department id 1, 2 and 3
Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3.

*/

-- Get the information of the department id 1, 2, and 3
SELECT * FROM departments WHERE department_id IN (1, 2, 3);

-- Get the information of employees who work in the department id 1, 2, and 3
SELECT * FROM employees WHERE department_id IN (1, 2, 3);

-- Get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3
SELECT e.first_name, e.last_name, e.job_id AS job_title, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (1, 2, 3);

/*






 SQL LEFT JOIN clause

 

 
Write a Query :--
⦁	To query the country names of US, UK, and China
⦁	query retrieves the locations located in the US, UK and China:
⦁	To join the countries table with the locations table
⦁	to find the country that does not have any locations in the locations table

*/


-- Query the country names of US, UK, and China
SELECT country_name FROM countries WHERE country_name IN ('US', 'UK', 'China');

-- Retrieve the locations located in the US, UK, and China
SELECT l.*
FROM locations l
LEFT JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name IN ('US', 'UK', 'China');

-- Join the countries table with the locations table
SELECT c.country_name, l.location_id, l.city
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id;

-- Find the country that does not have any locations in the locations table
SELECT c.country_name
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
WHERE l.location_id IS NULL;

/*
 
Write a query to join 3 tables: regions, countries, and locations

 SQL self-join

SELECT
	column1,
	column2,
	column3,
        ...
FROM
	table1 A
INNER JOIN table1 B ON B.column1 = A.column2;

 
Questions:-
The manager_id column specifies the manager of an employee. Write a query  statement to  joins the employees table to itself to query the information of who reports to whom.
 

The president does not have any manager. In the employees table, the manager_id of the row that contains the president is NULL.
Because the inner join clause only includes the rows that have matching rows in the other table, therefore the president did not show up in the result set of the query above.
Now write a Query To include the president in the result set:-

*/

-- Join 3 tables: regions, countries, and locations
SELECT r.region_name, c.country_name, l.city
FROM regions r
LEFT JOIN countries c ON r.region_id = c.region_id
LEFT JOIN locations l ON c.country_id = l.country_id;

-- Query the information of who reports to whom using a self-join
SELECT e1.employee_id, e1.first_name, e1.last_name, e2.first_name AS manager_first_name, e2.last_name AS manager_last_name
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- Include the president in the result set of who reports to whom
SELECT e1.employee_id, e1.first_name, e1.last_name, e2.first_name AS manager_first_name, e2.last_name AS manager_last_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

/*

SQL FULL OUTER JOIN clause

 

Let’s take an example of using the FULL OUTER JOIN clause to see how it works.
First, create two new tables: baskets and fruits for the demonstration. Each basket stores zero or more fruits and each fruit can be stored in zero or one basket.
*/

CREATE  TABLE  fruits (
	fruit_id  INT PRIMARY KEY,
	fruit_name  VARCHAR (255) NOT NULL,
	basket_id  INTEGER
);
CREATE TABLE baskets (
	basket_id  INT PRIMARY KEY,
	basket_name  VARCHAR (255) NOT NULL
);

/*
Second, insert some sample data into the baskets and fruits tables.
*/
INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');









INSERT  INTO  fruits (
	fruit_id,
	fruit_name,
	basket_id
)
VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);

/*
Question:-
⦁	Write a query to  returns each fruit that is in a basket and each basket that has a fruit, but also returns each fruit that is not in any basket and each basket that does not have any fruit.
⦁	Write a query to find the empty basket, which does not store any fruit
⦁	Write a query  which fruit is not in any basket

*/


-- Return each fruit that is in a basket and each basket that has a fruit, but also returns each fruit that is not in any basket and each basket that does not have any fruit
SELECT f.fruit_name, b.basket_name
FROM fruits f
FULL OUTER JOIN baskets b ON f.basket_id = b.basket_id;

-- Find the empty basket, which does not store any fruit
SELECT b.basket_name
FROM baskets b
LEFT JOIN fruits f ON b.basket_id = f.basket_id
WHERE f.fruit_id IS NULL;

-- Find which fruit is not in any basket
SELECT f.fruit_name
FROM fruits f
LEFT JOIN baskets b ON f.basket_id = b.basket_id
WHERE f.basket_id IS NULL;

/*

SQL CROSS JOIN clause
A cross join is a join operation that produces the Cartesian product of two or more tables.
In Math, a Cartesian product is a mathematical operation that returns a product set of multiple sets.
For example, with two sets A {x,y,z} and B {1,2,3}, the Cartesian product of A x B is the set of all ordered pairs (x,1), (x,2), (x,3), (y,1) (y,2), (y,3), (z,1), (z,2), (z,3).
The following picture illustrates the Cartesian product of A and B:
 
Similarly, in SQL, a Cartesian product of two tables A and B is a result set in which each row in the first table (A) is paired with each row in the second table (B). Suppose the A table has n rows and the B table has m rows, the result of the cross join of the A and B tables have n x m rows.
The following illustrates syntax of the CROSS JOIN clause:
SELECT column_list
FROM A
CROSS JOIN B;
The following picture illustrates the result of the cross join between the table A and table B. In this illustration, the table A has three rows 1, 2 and 3 and the table B also has three rows x, y and z. As the result, the Cartesian product has nine rows:
 


We will create two new tables for the demonstration of the cross join:
⦁	 sales_organization table stores the sale organizations.
⦁	 sales_channel table stores the sales channels.
The following statements create the sales_organization and sales_channel tables:

*/

CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255)
);

 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255)
);

/*

Suppose the company has two sales organizations that are Domestic and Export, which are in charge of sales in the domestic and international markets.
The following statement inserts two sales organizations into the sales_organization table:

*/

INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');

/*

The company can distribute goods via various channels such as wholesale, retail, eCommerce, and TV shopping. The following statement inserts sales channels into the sales_channel table:

*/

INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');

/*

Question:--
Write a Query To find the all possible sales channels that a sales organization 

*/


-- Find all possible sales channels that a sales organization
SELECT so.sales_org, sc.channel
FROM sales_organization so
CROSS JOIN sales_channel sc;

--=======================================================================================================================--

-- TASK 4 :

/*

SQL GROUP BY clause
The GROUP BY is an optional clause of the SELECT statement. The GROUP BY clause allows you to group rows based on values of one or more columns. It returns one row for each group.
The following shows the basic syntax of the GROUP BY clause:
SELECT
	column1,
	column2,
	aggregate_function(column3)
FROM
	table_name
GROUP BY
	column1,
	column2;

In practice, you often use the GROUP BY clause with an aggregate function such as MIN, MAX, AVG, SUM, or COUNT to calculate a measure that provides the information for each group.
We will use the employees and departments tables  to demonstrate how the GROUP BY clause works.

 
Questions:-
Write a  Query 
⦁	to group the values in department_id column of the employees table:
⦁	to count the number of employees by department:
⦁	returns the number of employees by department
⦁	to sort the departments by headcount:
⦁	to find departments with headcounts are greater than 5:
⦁	returns the minimum, maximum and average salary of employees in each department.
⦁	To get the total salary per department,
⦁	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups

*/

-- Group the values in department_id column of the employees table
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

-- Count the number of employees by department
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- Return the number of employees by department
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;

-- Sort the departments by headcount
SELECT department_id, COUNT(*) AS headcount
FROM employees
GROUP BY department_id
ORDER BY headcount DESC;

-- Find departments with headcounts greater than 5
SELECT department_id, COUNT(*) AS headcount
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- Return the minimum, maximum, and average salary of employees in each department
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Get the total salary per department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Group rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups
SELECT department_id, job_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id, job_id;

/*

SQL HAVING clause

To specify a condition for groups, you use the HAVING clause.
The HAVING clause is often used with the GROUP BY clause in the SELECT statement. If you use a HAVING clause without a GROUP BY clause, the HAVING clause behaves like the WHERE clause
The following illustrates the syntax of the HAVING clause:
SELECT
	column1,
	column2,
	AGGREGATE_FUNCTION (column3)
FROM
	table1
GROUP BY
	column1,
	column2
HAVING
	group_condition;

 

Questions:-
Write a Query 
⦁	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports.
⦁	To find the managers who have at least five direct reports
⦁	calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.
⦁	To find the department that has employees with the lowest salary greater than 10000
⦁	To find the departments that have the average salaries of employees between 5000 and 7000

*/

-- Get the managers and their direct reports, and to group employees by the managers and to count the direct reports
SELECT manager_id, COUNT(*) AS direct_reports
FROM employees
GROUP BY manager_id;

-- Find the managers who have at least five direct reports
SELECT manager_id, COUNT(*) AS direct_reports
FROM employees
GROUP BY manager_id
HAVING COUNT(*) >= 5;

-- Calculate the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;

-- Find the department that has employees with the lowest salary greater than 10000
SELECT department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 10000;

-- Find the departments that have the average salaries of employees between 5000 and 7000
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;

--=======================================================================================================================--

-- TASK 5 :

/*

1)SQL UNION operator
Suppose, we have two result sets A(1,2) and B(2,3). The following picture illustrates A UNION B:
 

And the following picture illustrates A UNION ALL B
 

 
Quetsion:-
Write a Query to combine the first name and last name of employees and dependents

*/

-- Write a Query to combine the first name and last name of employees and dependents
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM dependents;

/*

2)SQL INTERSECT operator
Suppose, we have two tables: A(1,2) and B(2,3).
The following picture illustrates the intersection of A & B tables.
 

Question :-
Write a Query to  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.

*/

-- Write a Query to Applies the INTERSECT operator to the employee_id of employees and dependents tables and sorts the combined result set by the employee_id column in descending order
SELECT employee_id FROM employees
INTERSECT
SELECT employee_id FROM dependents
ORDER BY employee_id DESC;

/*

3)SQL EXISTS operator
We will use the  employees and dependents tables in the sample database for the demonstration.
 
Write a Query 

⦁	finds all employees who have at least one dependent.
⦁	finds employees who do not have any dependents.

*/


-- Write a Query that finds all employees who have at least one dependent
SELECT e.*
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM dependents d
    WHERE d.employee_id = e.employee_id
);

-- Write a Query that finds employees who do not have any dependents
SELECT e.*
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM dependents d
    WHERE d.employee_id = e.employee_id
);

/*

4) SQL CASE expression
CASE expression
WHEN when_expression_1 THEN
	result_1
WHEN when_expression_2 THEN
	result_2
WHEN when_expression_3 THEN
	result_3
...
ELSE
	else_result
END
Let’s take a look at the employees table.
 


Questions:-
⦁	Suppose the current year is 2000. How to  use the simple CASE expression to get the work anniversaries of employees by 

⦁	Write a Query  If the salary is less than 3000, the CASE expression returns “Low”. If the salary is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, the CASE expression returns “High”.

*/

-- Suppose the current year is 2000. Use the simple CASE expression to get the work anniversaries of employees
SELECT first_name, last_name, hire_date,
    CASE
        WHEN EXTRACT(YEAR FROM hire_date) = 2000 THEN '20th Anniversary'
        WHEN EXTRACT(YEAR FROM hire_date) = 1995 THEN '25th Anniversary'
        ELSE 'Less than 20 years'
    END AS anniversary
FROM employees;

-- Write a Query that returns “Low” if the salary is less than 3000, “average” if the salary is between 3000 and 5000, and “High” if the salary is greater than 5000
SELECT first_name, last_name, salary,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
        ELSE 'High'
    END AS salary_level
FROM employees;

/*

5) SQL UPDATE statement
 

Suppose the employee id 192 Sarah Bell changed her last name from Bell to Lopez and you need to update her record in the  employees table.
 
Write a Query to update Sarah’s last name from  Bell to Lopez
How to  make sure that the last names of children are always matched with the last name of parents in the  employees table, 

*/

-- Write a Query to update Sarah’s last name from Bell to Lopez
UPDATE employees
SET last_name = 'Lopez'
WHERE employee_id = 192 AND last_name = 'Bell';

-- Write a Query to make sure that the last names of children are always matched with the last name of parents in the employees table
UPDATE dependents
SET last_name = (
    SELECT e.last_name
    FROM employees e
    WHERE e.employee_id = dependents.employee_id
)
WHERE last_name <> (
    SELECT e.last_name
    FROM employees e
    WHERE e.employee_id = dependents.employee_id
) OR last_name IS NULL;

/*

FINAL TASK  (Advanced Queries)
SQL SUBQUERY 
Consider the following employees and departments tables from the sample database

 

Suppose you have to find all employees who locate in the location with the id 1700. You might come up with the following solution.
First, find all departments located at the location whose id is 1700:
SELECT 
    *
FROM
    departments
WHERE
    location_id = 1700;

 
Second, find all employees that belong to the location 1700 by using the department id list of the previous query:
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (1 , 3, 8, 10, 11)
ORDER BY first_name , last_name;

 
This solution has two problems. To start with, you have looked at the departments table to check which department belongs to the location 1700. However, the original question was not referring to any specific departments; it referred to the location 1700.
Because of the small data volume, you can get a list of department easily
.
However, in the real system with high volume data, it might be problematic .Another problem was that you have to revise the queries whenever you want to find employees who locate in a different location
A much better solution to this problem is to use a subquery. By definition, a subquery is a query nested inside another query such as SELECT, INSERT, UPDATE, or DELETE statement. In this tutorial, we are focusing on the subquery used with the SELECT statement.





Question:-
Write a Query :- 
⦁	Combine Above two queries using subquery inorder find all departments located at the location whose id is 1700 and find all employees that belong to the location 1700 by using the department id list of the previous query

⦁	to find all employees who do not locate at the location 1700:

⦁	finds the employees who have the highest salary:

⦁	finds all employees who salaries are greater than the average salary of all employees:

⦁	finds all departments which have at least one employee with the salary is greater than 10,000:

⦁	finds all departments that do not have any employee with the salary greater than 10,000:

⦁	to find the lowest salary by department:


⦁	finds all employees whose salaries are greater than the lowest salary of every department:
⦁	finds all employees whose salaries are greater than or equal to the highest salary of every department

⦁	returns the average salary of every department

⦁	to calculate the average of average salary of departments :

⦁	finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.

*/

-- Write a Query to combine the queries using a subquery to find all departments located at the location whose id is 1700 and find all employees that belong to the location 1700 by using the department id list of the previous query
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
)
ORDER BY first_name, last_name;

-- Write a Query to find all employees who do not locate at the location 1700
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

-- Write a Query that finds the employees who have the highest salary
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Write a Query that finds all employees whose salaries are greater than the average salary of all employees
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Write a Query that finds all departments which have at least one employee with the salary is greater than 10,000
SELECT DISTINCT department_id
FROM employees
WHERE salary > 10000;

-- Write a Query that finds all departments that do not have any employee with the salary greater than 10,000
SELECT department_id
FROM departments
WHERE department_id NOT IN (
    SELECT department_id
    FROM employees
    WHERE salary > 10000
);

-- Write a Query to find the lowest salary by department
SELECT department_id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;

-- Write a Query that finds all employees whose salaries are greater than the lowest salary of every department
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT MIN(salary)
    FROM employees
    GROUP BY department_id
);

-- Write a Query that finds all employees whose salaries are greater than or equal to the highest salary of every department
SELECT *
FROM employees
WHERE salary >= ALL (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id
);

-- Write a Query that returns the average salary of every department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Write a Query to calculate the average of average salary of departments
SELECT AVG(avg_salary) AS avg_of_avg_salaries
FROM (
    SELECT AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) dept_avg_salaries;

-- Write a Query that finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary
SELECT employee_id, first_name, last_name, salary,
    AVG(salary) OVER () AS avg_salary,
    salary - AVG(salary) OVER () AS salary_diff
FROM employees;