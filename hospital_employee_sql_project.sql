-- Assignment #2
-- HHA 507
-- Hamza Sulemanjee



-- Section 1 - Create table
-- This creates a hospital employees table with 10 columns using text, integer, decimal, and date/time data.


Create table hospital_employees (
    employee_id INTEGER,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department VARCHAR2(100),
    job_title VARCHAR2(100),
    hire_date TIMESTAMP,
    hourly_rate NUMBER(6,2),
    years_experience INTEGER,
    shift VARCHAR2(20),
    active_status VARCHAR2(20)
);


-- Check the table after creating it.

select *
from hospital_employees;





-- Section 2 - Insert the data
-- These insert statements populate the table with 12 fictional hospital employees.


insert into hospital_employees
values (
    1001,
    'Michael',
    'Johnson',
    'Information Technology',
    'Systems Analyst',
    TO_TIMESTAMP('2021-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    42.50,
    6,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1002,
    'Sarah',
    'Williams',
    'Nursing',
    'Registered Nurse',
    TO_TIMESTAMP('2019-07-22 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    51.75,
    8,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1003,
    'David',
    'Lee',
    'Radiology',
    'Radiology Technician',
    TO_TIMESTAMP('2022-01-10 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    39.25,
    4,
    'Evening',
    'Active'
);

insert into hospital_employees
values (
    1004,
    'Emily',
    'Garcia',
    'Pharmacy',
    'Pharmacy Technician',
    TO_TIMESTAMP('2023-05-08 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    31.50,
    3,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1005,
    'James',
    'Brown',
    'Emergency Department',
    'Registered Nurse',
    TO_TIMESTAMP('2018-11-12 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    55.25,
    10,
    'Night',
    'Active'
);

insert into hospital_employees
values (
    1006,
    'Olivia',
    'Martinez',
    'Laboratory',
    'Medical Technologist',
    TO_TIMESTAMP('2020-09-14 07:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    38.75,
    7,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1007,
    'Daniel',
    'Wilson',
    'Information Technology',
    'Network Technician',
    TO_TIMESTAMP('2024-02-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    36.00,
    2,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1008,
    'Sophia',
    'Anderson',
    'Cardiology',
    'Medical Assistant',
    TO_TIMESTAMP('2022-08-29 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    29.75,
    4,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1009,
    'Christopher',
    'Thomas',
    'Environmental Services',
    'Environmental Services Aide',
    TO_TIMESTAMP('2021-12-06 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    24.50,
    5,
    'Night',
    'Active'
);

insert into hospital_employees
values (
    1010,
    'Ava',
    'Taylor',
    'Health Information Management',
    'Health Information Specialist',
    TO_TIMESTAMP('2023-10-16 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    34.25,
    3,
    'Day',
    'Active'
);

insert into hospital_employees
values (
    1011,
    'Matthew',
    'Moore',
    'Transport',
    'Patient Transporter',
    TO_TIMESTAMP('2020-04-20 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    23.75,
    6,
    'Evening',
    'Inactive'
);

insert into hospital_employees
values (
    1012,
    'Isabella',
    'Jackson',
    'Human Resources',
    'HR Coordinator',
    TO_TIMESTAMP('2024-06-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    32.50,
    2,
    'Day',
    null
);


-- Check that all 12 rows were inserted.

select *
from hospital_employees;

select count(*)
from hospital_employees;







-- Section 3 - Update the records
-- This updates the blank active status for employee 1012.

update hospital_employees
set active_status = 'Active'
where employee_id = 1012;


-- Check the updated record.

select *
from hospital_employees
where employee_id = 1012;







-- Section 4 - Alter table
-- This adds an email column to the hospital employees table.

alter table hospital_employees
add email VARCHAR2(100);


-- Check the table after adding the new column.

select *
from hospital_employees;






-- Section 5 - Delete records
-- This removes employees whose active status is listed as Inactive.

Delete from hospital_employees
where active_status = 'Inactive';


-- Check the table after deleting the record.

select *
from hospital_employees
where active_status = 'Inactive';

select count(*)
from hospital_employees;

commit;












-- Section 6 - Select statement
-- This query selects specific customer fields from the SH schema and limits the output to 100 rows.


Select
    cust_id,
    cust_first_name,
    cust_last_name,
    cust_gender,
    cust_city,
    cust_state_province,
    cust_main_phone_number
from sh.customers
fetch first 100 rows only;

-- Export result as: select_top_100.xlsx



-- Section 7 - inner join
-- An inner join only returns records that have matching customer IDs in both customers and sales.


SELECT
    c.cust_id AS customer_id,
    c.cust_first_name AS first_name,
    c.cust_last_name AS last_name,
    c.cust_city AS city,
    c.cust_state_province AS state,
    s.prod_id AS product_id,
    s.quantity_sold,
    s.amount_sold
FROM sh.customers c
INNER JOIN sh.sales s
    ON c.cust_id = s.cust_id
FETCH FIRST 100 ROWS ONLY;

-- Export result as: inner_join_top_100.xlsx





-- Section 8 - Left outer join
-- A left outer join returns all customers, including customers that do not have a matching sales record.


SELECT
    c.cust_id AS customer_id,
    c.cust_first_name AS first_name,
    c.cust_last_name AS last_name,
    c.cust_city AS city,
    c.cust_state_province AS state,
    s.prod_id AS product_id,
    s.quantity_sold,
    s.amount_sold
FROM sh.customers c
LEFT OUTER JOIN sh.sales s
    ON c.cust_id = s.cust_id
FETCH FIRST 100 ROWS ONLY;

-- Export result as: outer_join_top_100.xlsx
