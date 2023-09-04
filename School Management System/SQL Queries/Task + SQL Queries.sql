-- Tables Provided:
-- 1. course_d 
-- 2. employee_d 
-- 3. class_d 
-- 4. student_d 
-- 5. ratings_d 

                                                           ## PART 1

                                                         #-- Section 1
#-- Consider the scenario when school management wants to evaluate which employee will get the next promotion,
#-- based on their time in school, their designation along with their performance (which they evaluate based on feedback from students or their parents.)

-- Identify the age of the employee when they joined the school within the Employee_d table
-- Calculate the total employees belonging to each age/age-group.


SELECT employee_since - year(employee_birthdate) As joining_age, count(*)
FROM employee_d 
GROUP BY joining_age;


-- Calculate the min and max of age of employees.


SELECT "Maximum Age" AS Age_Range, max(age) AS Age
FROM employee_d
UNION ALL 
SELECT "Minimum Age" AS Age_Range, min(age) AS Age 
FROM employee_d;


-- Identify the time spent by employees in school grouped by their designation.


SELECT employee_id, employee_name, employee_designation, year(now()) - employee_since AS years_in_school
FROM employee_d 
ORDER BY employee_designation;


-- Calculate following feedback statistics:
-- 1. Total number of feedbacks for an employee on employee id


SELECT employee_id, count(rating) AS no_of_feedback
FROM ratings_d
GROUP BY employee_id;


-- 2. Average rating of an employee having at least 3 feedbacks. 


SELECT employee_id, avg(rating) AS average_rating 
FROM ratings_d
GROUP BY employee_id
HAVING count(rating) >= 3;



                                                           #-- Section 2													
#-- School wants to determine if they have to divide a class to create more sections or they have to merge multiple sections 
#-- into one based on their strength. (If there are too many students in class then it would create chaos in class while 
#-- if there are less students then it will be a waste of resources for school).

-- Identify the total number of students by

-- 1.1 Class_Id 


SELECT class_id, count(student_id) AS class_strength
FROM student_d
GROUP BY class_id;


-- 1.2 Class_Id and Student_Class


SELECT CONCAT(class_id," ", Student_Class) AS class_section, count(student_id) AS section_strength
FROM student_d
GROUP BY class_section;


-- Question 2

-- School provides bus services to different locations of Delhi-NCR for employees and students. 
-- School management wants to optimise the bus services in a way that we get no seat left in buses and everybody gets picked up. 
-- Provide following stats for internal evaluation of school:

-- 1. Total number of employees by Employee designation.


SELECT employee_designation, count(employee_id) AS employee_count
FROM employee_d
GROUP BY employee_designation;


-- 2. Total number of students by each city.


SELECT student_city, count(student_id) AS city_wise_student_strength
FROM student_d
GROUP BY student_city;


                                                            #-- Section 3
#-- Consider the scenario that the school is hosting an annual event where they will be distributing the prizes to students for various things.
#-- For instance, best performer in studies or sports or arts or some extra - curricular activities. Now answer the following:


-- Question 1:
-- Class 9A and 10B students from Delhi are fantastic musicians and just gave an outstanding performance in a national level event.
-- Get the name of the students. 


SELECT CONCAT(class_id, " ", student_class) AS class_section, student_name
FROM student_d
WHERE student_city = "Delhi"
AND class_id IN (9,10);


-- Question 2:
-- Professor from Gurgaon who has been with us since 2006 and 2020 has been a fantastic duo to carry out the science projects 
-- on state level with school students and got a prize from the state CM. Get the name of professors.


SELECT employee_name, employee_designation, employee_since
FROM employee_d 
WHERE employee_designation = "professor"
AND employee_since IN (2006, 2020);


                                                            #-- Section 4
-- Q1. School management wants to identify professor info who are currently mapped to a course. 


SELECT employee_id, employee_name, employee_designation
FROM employee_d 
WHERE employee_id IN 
    (SELECT professor_id
    FROM course_d
    );


-- Question 2:
-- School management wants to identify the class teachers to give them proper resources.

-- a. Get the total professors that are currently a class teacher.


SELECT count(employee_id) AS total_class_teacher
FROM employee_d
WHERE employee_id IN 
    (SELECT classteacher 
    FROM class_d 
    );


-- b. Get the id and name of professors who are currently a class teacher.


SELECT employee_id, employee_name
FROM employee_d
WHERE employee_id IN 
    (SELECT classteacher 
    FROM class_d 
    );


-- c. Find the total Assignments and paper by each class teacher in a class.


SELECT professor_id, sum(course_assignments) AS total_assignments, sum(course_paper) AS total_papers
FROM course_d 
GROUP BY professor_id 
HAVING professor_id IN 
    (SELECT employee_id
    FROM employee_d
    WHERE employee_id IN 
        (SELECT classteacher 
        FROM class_d 
        )
    );


-- Question 3
-- School management wants to know the employees having the birth date on the same day to plan for the leaves they provide to employees.
-- Check which of the 2 employees in Employee_d table have a birth date on the same day. 


SELECT e1.employee_id, e1.employee_name, e1.employee_birthdate
FROM employee_d AS e1 
JOIN employee_d As e2 
ON e2.employee_birthdate = e1.employee_birthdate
AND e2.employee_id != e1.employee_id;


-- Question 4
-- Get the TOP 2 employees' names and their ratings (who got the best overall ratings from students). 


SELECT e.employee_id, e.employee_name, avg(r.rating) AS average_rating
FROM employee_d AS e 
JOIN ratings_d AS r 
ON r.employee_id = e.employee_id 
GROUP BY e.employee_id, e.employee_name
ORDER BY average_rating DESC 
LIMIT 2;


                                                           ## PART 2

-- Let’s suppose the school wants to open up career counselling sessions for students. 
-- For that they will not have professionals from industry guiding the students, 
-- but also professors having good bonding with students along with professors for administrative work. 

-- Please identify the following:

-- Question 1
-- Get the professors that aren’t involved in any courses as of now.


SELECT e.employee_id, e.employee_name, e.employee_designation
FROM employee_d AS e 
LEFT JOIN course_d AS c 
ON c.professor_id = e.employee_id 
WHERE c.professor_id IS NULL
AND e.employee_designation = "professor";


-- Question 2
-- Professors are busy with assignments and papers they have given to students and may not have the time to attend counselling. 
-- Get the employee name where the average paper >=3 and assignments >20.


SELECT e.employee_id, e.employee_name, avg(c.course_paper) AS avg_course_paper, avg(c.course_assignments) AS avg_course_assignments
FROM employee_d AS e 
JOIN course_d AS c 
ON c.professor_id = e.employee_id 
GROUP BY e.employee_id, e.employee_name
HAVING avg_course_paper >= 3 
AND avg_course_assignments > 20;


-- Question 3
-- Get the employees that are rated by students.
-- a. Get the employees with more than 2 students ratings. [Note: Identify number of students]


SELECT employee_id, count(student_id) AS student_rating_count
FROM ratings_d 
GROUP BY employee_id
HAVING student_rating_count > 2;


-- b. Get the employees with an average rating of more than 4 and are rated by more than 3 students.


SELECT e.employee_id, e.employee_name, avg(r.rating) AS average_rating, count(r.student_id) AS student_rating_count
FROM ratings_d AS r
JOIN employee_d AS e 
ON e.employee_id = r.employee_id
GROUP BY e.employee_id
HAVING average_rating >= 4 
AND student_rating_count > 3;
