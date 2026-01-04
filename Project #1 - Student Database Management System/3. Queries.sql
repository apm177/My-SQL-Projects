# Section A. Level 1 Questions:

#1. Get the data of all the students in the school: 
SELECT * FROM student; 

# 2. Want to get the information of a specific student. 
# Use stored procedure.
DELIMITER $$ 
CREATE PROCEDURE find_student(IN id INT)
BEGIN
	SELECT * FROM student
    WHERE student_id = id;
END $$
DELIMITER ;

CALL find_student(50);
DROP PROCEDURE find_student;

#3. Find the total number of students in the school:
SELECT COUNT(student_ID) FROM student;

#4. Find the average GPA of all students:
SELECT AVG(gpa) FROM student; 

#5. Want to find all students will low GPAs i.e less than 2.5:
SELECT * FROM student
WHERE GPA < 2.5; 

#6. Want to find all students will low attendance e i.e less than 80%:
SELECT * FROM student
WHERE Attendance < 80;

#7. Want to find all students with high GPAs.
SELECT * FROM student
WHERE GPA > 3.7; 

#8. Want to find students with great attendance.
SELECT * FROM student
WHERE Attendance > 90;

#9. Which students have a low GPA and low attendance.
SELECT * FROM student
WHERE GPA < 2.5 AND Attendance < 80; 

#10. Which students are in grade 12 and have low GPA.
SELECT * FROM student
WHERE grade_level = 12 AND GPA < 2.5;

# Section B. Level 2 Questions:

#1. Show how many students are in each grade level. 
SELECT grade_level, COUNT(student_ID) AS "Total Number of Students."
FROM student
GROUP BY grade_level
ORDER BY grade_level;

#2. Show the average GPA of students in each grade level. 
SELECT grade_level, AVG(GPA) AS "Average GPA."
FROM student
GROUP BY grade_level
ORDER BY grade_level;

#3. Find average attendance of students in each grade level.
SELECT grade_level, AVG(attendance) AS "Average Attendance"
FROM student
GROUP BY grade_level
ORDER BY grade_level;

#4. Find which students have a GPA higher than the average. 
SELECT *
FROM student 
WHERE gpa > (SELECT AVG(GPA) FROM student)
ORDER BY student_ID;

#5. Find which students have a GPA higher than the average of their grade level. 
SELECT *
FROM student as a
WHERE a.gpa > (SELECT AVG(GPA) FROM student WHERE grade_level = a.grade_level)
ORDER BY student_ID; 

#6. Make an honor roll list. 
SELECT student_Name, gpa, grade_level
FROM student 
WHERE gpa > 3.7 AND attendance > 90
ORDER BY grade_level; 










