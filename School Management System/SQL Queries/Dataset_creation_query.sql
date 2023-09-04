## Creating the table "class_d"

CREATE TABLE class_d(
   Class_Id     INTEGER  NOT NULL PRIMARY KEY 
  ,ClassTeacher INTEGER  NOT NULL
  ,Class_Name   VARCHAR(20) NOT NULL
);
INSERT INTO class_d(Class_Id,ClassTeacher,Class_Name) VALUES (8,21,'Class8');
INSERT INTO class_d(Class_Id,ClassTeacher,Class_Name) VALUES (9,12,'Class9');
INSERT INTO class_d(Class_Id,ClassTeacher,Class_Name) VALUES (10,19,'Class10');


## Creating the table "course_d"

CREATE TABLE course_d(
   Course_Id          INTEGER  NOT NULL PRIMARY KEY 
  ,CourseName         VARCHAR(20) NOT NULL
  ,Course_Assignments INTEGER  NOT NULL
  ,Course_Paper       INTEGER  NOT NULL
  ,Professor_Id       INTEGER  NOT NULL
  ,Class_Id           INTEGER  NOT NULL
);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (1,'Hindi1',20,2,21,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (2,'English1',18,2,14,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (3,'Science1',22,2,12,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (4,'EVS1',16,2,13,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (5,'Maths1',20,2,9,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (6,'SST',24,2,2,8);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (7,'Hindi2',23,2,21,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (8,'English2',21,2,14,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (9,'Science2',21,2,12,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (10,'EVS2',16,2,13,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (11,'Maths2',19,2,9,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (12,'SST',19,2,2,9);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (13,'Hindi3',20,3,21,10);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (14,'English3',22,3,14,10);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (15,'Science3',25,3,12,10);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (16,'EVS3',21,3,13,10);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (17,'Maths3',24,3,19,10);
INSERT INTO course_d(Course_Id,CourseName,Course_Assignments,Course_Paper,Professor_Id,Class_Id) VALUES (18,'SST',20,3,2,10);


## Creating the table "employee_d"

CREATE TABLE employee_d(
   Employee_Id          INTEGER  NOT NULL PRIMARY KEY 
  ,Employee_Name        VARCHAR(10) NOT NULL
  ,Employee_City        VARCHAR(7) NOT NULL
  ,Employee_Birthdate   DATETIME  NOT NULL
  ,Employee_designation VARCHAR(13) NOT NULL
  ,Employee_since       INTEGER  NOT NULL
  ,age                  INTEGER  NOT NULL
  ,Date_Time            DATETIME  NOT NULL
);
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (1,'Priya','Gurgaon','1992-06-06','Professor',2020,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (2,'Komal','Gurgaon','1992-04-29','Professor',2021,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (3,'Sharda','Jaipur','1970-06-08','Principal',2012,53,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (4,'Lokesh','Jaipur','1988-06-30','VicePrincipal',2010,35,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (5,'Anagh','Delhi','2000-09-29','Professor',2022,23,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (6,'Pravesh','Alwar','1992-06-06','Professor',2015,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (7,'Samyara','Delhi','1994-10-15','Professor',2022,29,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (8,'Somesh','Noida','1990-10-31','Peon',2018,33,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (9,'Gyanesh','Noida','1992-11-02','Professor',2016,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (10,'Mahesh','Noida','1998-05-01','Clerk',2018,25,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (11,'Saniya','Noida','1965-06-29','Assistant',2001,58,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (12,'Javed','Churu','1992-10-06','Professor',2007,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (13,'Suman','Churu','1992-03-15','Professor',2002,31,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (14,'Rajesh','Gurgaon','1993-01-24','Professor',2006,30,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (15,'Abhishek','Alwar','2000-11-18','Assistant',2022,23,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (16,'Muskan','Hisar','1999-12-16','Peon',2004,24,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (17,'Shashank','Bhiwadi','1998-08-26','Professor',2022,25,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (18,'Nikita','Delhi','1991-07-30','Professor',2015,32,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (19,'Amrinder','Hisar','1985-10-28','Professor',2013,38,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (20,'Sukhvinder','Jaipur','1988-03-17','Professor',2019,35,'2023-08-03T04:25:36');
INSERT INTO employee_d(Employee_Id,Employee_Name,Employee_City,Employee_Birthdate,Employee_designation,Employee_since,age,Date_Time) VALUES (21,'Uday','Bhiwadi','1997-09-26','Professor',2019,26,'2023-08-03T04:25:36');


## Creating the table "ratings_d"

CREATE TABLE ratings_d(
   Employee_Id INTEGER  NOT NULL 
  ,Student_Id  INTEGER  NOT NULL
  ,Rating      INTEGER  NOT NULL
);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (2,2,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (2,9,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (2,21,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (2,29,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (9,5,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (9,16,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (9,19,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (12,1,4);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (12,3,4);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (12,6,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (13,7,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (13,11,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (19,11,4);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (19,17,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (19,19,4);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (21,3,3);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (21,4,5);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (21,25,4);
INSERT INTO ratings_d(Employee_Id,Student_Id,Rating) VALUES (21,26,3);


## Creating the table "student_d"

CREATE TABLE student_d(
   Student_Id        INTEGER  NOT NULL PRIMARY KEY 
  ,Student_Name      VARCHAR(20) NOT NULL
  ,Student_Birthdate DATETIME  NOT NULL
  ,Student_Class     VARCHAR(2) NOT NULL
  ,Student_City      VARCHAR(20) NOT NULL
  ,Class_Id          INTEGER  NOT NULL
);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (1,'Abhimanyu','2007-04-13','A','Gurgaon',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (2,'Abhishek','2007-04-17','A','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (3,'Abhilash','2007-05-08','A','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (4,'Chinmay','2007-06-01','A','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (5,'Chinki','2007-06-25','A','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (6,'Priyank','2007-07-04','B','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (7,'Somesh','2007-09-07','B','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (8,'Sarvesh','2007-10-06','B','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (9,'Vishal','2007-10-29','B','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (10,'Vaishali','2007-12-07','B','Delhi',8);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (11,'Abhilasha','2007-12-24','A','Delhi',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (12,'Anushka','2008-02-13','A','Delhi',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (13,'Karuna','2008-06-15','A','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (14,'Priya','2008-07-24','A','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (15,'Sukhvinder','2008-08-01','A','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (16,'Tanya','2008-08-07','B','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (17,'Vishakha','2008-10-19','B','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (18,'Vaijyanti','2008-11-07','B','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (19,'Vishnu','2008-11-23','B','Noida',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (20,'Veer','2008-11-24','B','Gurgaon',9);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (21,'Ankur','2009-01-27','A','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (22,'Ali','2009-03-03','A','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (23,'Axar','2009-06-06','A','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (24,'Bhavika','2009-06-09','A','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (25,'Komal','2009-06-11','A','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (26,'Karun','2009-06-30','B','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (27,'Pouroushi','2009-10-15','B','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (28,'Somya','2009-12-13','B','Gurgaon',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (29,'Sanyam','2010-01-05','B','Delhi',10);
INSERT INTO student_d(Student_Id,Student_Name,Student_Birthdate,Student_Class,Student_City,Class_Id) VALUES (30,'Sanya','2010-07-24','B','Delhi',10);
