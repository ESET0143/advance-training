create database s2;
use s2;


CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    subject1_marks INT,
    subject2_marks INT,
    subject3_marks INT,
    standard VARCHAR(10),
    staff_id INT
);

/*     ALTER TABLE YourTableName
    DROP CONSTRAINT YourPrimaryKeyConstraintName; 
alter table student drop constraint PK__student__9560EEE199E245A4;

INSERT INTO student (roll_no, name, class, grade, staff_id)
VALUES
(102, 'ram', '101', 'B', 502),
(103, 'suresh', '102', 'A', 501),
(104, 'naresh', '103', 'C', 503);

insert into student values (105, 'surendra', '103', 'C', 503),
(106, 'ganesh', '103', 'C', 503);
EXEC sp_help 'student';
*/
INSERT INTO student (id, name, date_of_birth, subject1_marks, subject2_marks, subject3_marks, standard, staff_id)
VALUES
(1, 'Alice', '2009-05-15', 85, 92, 78, '10', 101),
(2, 'Bob ', '2008-11-23', 95, 88, 91, '10', 102),
(3, 'ram', '2010-01-30', 76, 81, 85, '9', 101),
(4, 'dhoni', '2009-08-05', 90, 75, 89, '10', 103),
(5, 'suresh', '2010-03-20', 88, 95, 80, '9', 102);


select * from student 
where (subject1_marks>35 and subject2_marks>35 and  subject3_marks>35);

select * from student 
where (subject1_marks<35 or subject2_marks<35 or subject3_marks<35);

select * from student where name='Alice';

select * from student where name='Alice' or name='dhoni';

select * from student where MONTH(date_of_birth)='01';


select * from student where MONTH(date_of_birth) between '01' and '05';


select * from student where day(date_of_birth)='15';


select * from student where year(date_of_birth)='2010';

select * from student where abs(datediff(year,getdate(),date_of_birth))>1;

SELECT *
FROM student
WHERE DATEDIFF(year, date_of_birth, GETDATE()) > 1;

update  student set date_of_birth= DATEADD(day, 30, '2025-10-07') 
where name='Alice' ;

SELECT * FROM student where name='Alice'


--SELECT DATEADD(month, -6, GETDATE()) AS SixMonthsAgo;
---- Result: '2025-04-07' (or based on the current date)

--datepart and isdate
SELECT DATEPART(weekday, '2025-10-7') AS day_of_week;

-- Valid date
SELECT ISDATE('2025-10-07');
-- Output: 1

-- Invalid date format
SELECT ISDATE('2025-15-07');
-- Output: 0 (assuming default language settings where month 15 is invalid)

------------------------string functions ------------------


--TRIM(string): Removes leading and trailing spaces from a string.


SELECT
    CONCAT('Hello', ' ', 'World') AS concatenated_string,
    UPPER('sql functions') AS uppercase_string,
    TRIM('  padded string  ') AS trimmed_string,
    SUBSTRING('Database', 4, 3) AS extracted_substring,
    LEN('Example') AS string_length;

select upper(name ) from  student ;

select lower(name ) ,len (name) from  student ;

select name ,substring(name,2,3),TRIM(name) AS trimmed_string from student;

select * from student where name like '%e%';

select * from student where name like '_l%';


SELECT REPLACE('Hello World', 'World', 'SQL');  
-- Output: 'Hello SQL'

SELECT CONCAT('SQL', ' ', 'Server');  -- Output: 'SQL Server'

select concat('Mr.',name) from student;

SELECT REVERSE('SQL');  -- Output: 'LQS'


select reverse(name) from student;


SELECT FORMAT(GETDATE(), 'dd-MM-yyyy HH-mm-ss');  
SELECT GETDATE();


SELECT LTRIM('   Hello');  -- Output: 'Hello'

SELECT RTRIM('                 Hello         ');  -- Output: 'Hello'


SELECT STRING_AGG(name, ', ') AS Names
FROM student;
-- Output: 'John, Mary, Raj, Anita'



SELECT REPLICATE('surendra    ', 5);  -- Output: '*****'


SELECT STR(123.45,2) AS Result;
-- Output: '       123' (right-justified, rounded to integer)
SELECT STR(123.456, 8, 2) AS Result;
 -- Output: ' 123.46' (total length 7, 2 decimal places, rounded)


 
select replace(str('1234',7),' ','0');----output  0001234



SELECT FORMAT(GETDATE(), 'ddd-dd-MMM-MM-yyyy');  


CREATE TABLE SampleData (
    TextValue VARCHAR(50)
);

INSERT INTO SampleData VALUES
('Hello'),
('SQL2025'),
('Version9'),
('Test'),
('abc123xyz');


SELECT *
FROM SampleData
WHERE TextValue LIKE '%[0-9]%';



select ceiling(-5.2)

select floor(-5.2)

select round(123.4567, -2);--output 100.0000

SELECT ROUND(123.4567, 2);

select sqrt(25)

select rand()*100;

select power(2,3)-1;

select  isnumeric('123'); 

SELECT (10%3); -- Returns 1

SELECT CONVERT(VARCHAR(10), 12345);

SELECT CONVERT(DATE, '20251006', 112); -- Style 112 is yyyymmdd


SELECT CONVERT(DATE, GETDATE());


SELECT CONVERT(int, 25.65);

CREATE TABLE student2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    subject1_marks INT,
    subject2_marks INT,
    subject3_marks INT,
    standard VARCHAR(10),
    staff_id INT
);


INSERT INTO student2 (id, name, date_of_birth, subject1_marks, subject2_marks, subject3_marks, standard, staff_id)
VALUES
(58, 'Ali', '2009-05-15', 85, 92, 78, '10', 101);


INSERT INTO student  select * from student2 

select * from student



ALTER TABLE student
ADD total int , average int, grade varchar(3);

update student set total=subject1_marks +subject2_marks +subject3_marks;    

update student set average=(subject1_marks +subject2_marks +subject3_marks)/3;    


UPDATE student
SET grade = 
    CASE 
        WHEN average >= 90 THEN 'A'
        WHEN average >= 80 and average<=90 THEN 'B'
       WHEN average >= 70 and average<=80 THEN 'B'
       WHEN average >= 60 and average<=70 THEN 'B'
       WHEN average >= 50 and average<=60 THEN 'B'
       ELSE 'F'
    END;
update student set id=6 where name='Ali';



ALTER TABLE student
ADD AIR int;

ALTER TABLE student
DROP COLUMN AIR;


SELECT
   name ,
   total,
    RANK() OVER (ORDER BY total DESC) AS AIR
FROM
     student;


select distinct(grade) from  student

select top 1 name,total from student order by total desc


select grade,count(*)  from student
group by grade 
having count(*)>2

--unique check defalut

create table sales(productid int primary key ,expdate date not null, 
prdname varchar(50) unique,check(expdate>getdate()),stock varchar(50) default 'out of stcok' );

--drop table department

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE ,
    salary DECIMAL(10,2) CHECK (salary > 0) not null unique,-- multiples contraints for single coloumn
     department_id INT DEFAULT 1 ,FOREIGN KEY (department_id) REFERENCES department (departmentid)
);



create table department(
    departmentid int primary key,
    departmentname  varchar(50) unique,
    count_empl int
);

insert into department values(1,'abc',50),(2,'abcd',50);

select * from employees



