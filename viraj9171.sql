-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE E_Learning_Platform;

-- to work on it, you need to use it first
USE E_Learning_Platform;

-- delete database
-- DROP DATABASE E_Learning_Platform;


-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table  1 Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
SELECT * FROM Students;

-- to delete the tables
drop table students;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  student_id  , first_name from students;
  
  -- 2. Select students  in a Specific department_name
  select*from students where firstname='Aarav';
  
  -- 3. select  students  order by  departnent_id 
  select*from students order by studentid desc;
  
  -- 4.  Count the Number of students 
  select count(*) as total_student from students ;
  
  -- 5 count the number of students  in each  deparment_name 
  select count(*) as students from students group by firstname ;
  
  -- 6 Select students with department_id Count Greater Than a Certain Number
  select*from students where studentid >=4 ;
  
 -- 7  Select students with Names that Have More than 6 Characters
 select*from students where char_length(firstname  )>=6 ;
 
 -- 8 Add a column 
Alter table students
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table students
modify column studentid varchar(20) ;

-- 10.  Drop column 
alter table students 
drop column location;

-- 11.rename column 
alter table students
change column firstname name  varchar(100) ;

-- 12. add defult values in exisiting column 
alter table students
alter column studentid set default 1;

-- 13. delete a reacords base on condition
delete from students
where name  ='arjun';

-- 14. Delete Records with studentsid Below a Certain number
delete from students 
where studentid < 5;

-- 15. Delete Records Established Before a Certain Date
delete  from students 
where studentid < 6 ;

-- 16 Delete Records with a Specific name 
delete  from students 
where name  =' arnav';

-- 17. Delete Records with a Specific Employee Count
delete from students 
where studentid_count = 0;

-- 18. Delete Records Based on Multiple Conditions
delete from students
where studentid ='3' and name='arjun';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  studentid Column
alter table students rename column studentid TO mg_ID ;

-- 20. Rename the studentsid Column
alter table students rename column firstname to ID;

-------------------------------------------------- table 2 quires --------------------------------------------------------------------------------------------------
 -- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- to display/retrieve table data
SELECT * FROM Teachers;

-- to delete the tables
drop table Teachers;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  teacherid  , firstname from Teachers;
  
  -- 2. Select Teachers  in a Specific department_name
  select*from Teachers where firstname='rajesh';
  
  -- 3. select  Teachers  order by  departnent_id 
  select*from Teachers order by teacherid desc;
  
  -- 4.  Count the Number of Teachers 
  select count(*) as total_teacher from Teachers ;
  
  -- 5 count the number of Teachers  in each  firstname
  select count(*) as Teachers from Teachers group by firstname ;
  
  -- 6 Select Teachers with teacher_id Count Greater Than a Certain Number
  select*from Teachers where teacherid >=4 ;
  
 -- 7  Select Teachers with Names that Have More than 6 Characters
 select*from Teachers where char_length(firstname  )>=6 ;
 
 -- 8 Add a column 
Alter table Teachers
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Teachers
modify column teacherid varchar(20) ;

-- 10.  Drop column 
alter table Teachers 
drop column location;

-- 11.rename column 
alter table Teachers
change column firstname name  varchar(100) ;

-- 12 
alter table Teachers
alter column teacherid set default 1;


-- 13. delete a reacords base on condition
delete from Teachers
where name  ='anita';

-- 14. Delete Records with studentsid Below a Certain number
delete from Teachers 
where teacherid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Teachers 
where teacherid < 6 ;

-- 16 Delete Records with a Specific name 
delete  from Teachers 
where name  =' rajesh';

-- 17. Delete Records with a Specific Employee Count
delete from Teachers 
where teacherid_count = 0;

-- 18. Delete Records Based on Multiple Conditions
delete from Teachers
where teacherid ='3' and name ='sanjay';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  studentid Column
alter table Teachers rename column teacherid TO name_ID ;

-- 20. Rename the studentsid Column
alter table Teachers rename column firstname to ID;


-------------------------------------------------- table 3 --------------------------------------------------------------------------------------------------------------
-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

INSERT INTO Courses (CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status) VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

-- to display/retrieve table data
SELECT * FROM Courses ;

-- to delete the tables
drop table Courses ;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  Courseid  , firstname from Courses ;
  
  -- 2. Select Courses   in a Specific department_name
  select*from Courses  where coursename='english Grammar';
  
  -- 3. select  Courses   order by  departnent_id 
  select*from Courses  order by courseid desc;
  
  -- 4.  Count the Number of Courses  
  select count(*) as total_course from Courses  ;
  
  -- 5 count the number of Courses   in each  firstname
  select count(*) as coursename from courses ;
  
  -- 6 Select Courses  with Courses id Count Greater Than a Certain Number
  select*from Courses  where courseid >=4 ;
  
 -- 7  Select Courses  with Names that Have More than 6 Characters
 select*from Courses  where char_length(coursename  )>=6 ;
 
 -- 8 Add a column 
Alter table Courses 
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Courses 
modify column courseid varchar(20) ;

-- 10.  Drop column 
alter table Courses  
drop column location;

-- 11.rename column 
alter table Courses 
change column coursename name  varchar(100) ;

-- 12 
alter table Courses 
alter column courseid set default 1;


-- 13. delete a reacords base on condition
delete from Courses 
where name  ='anita';

-- 14. Delete Records with studentsid Below a Certain number
delete from Courses  
where courseid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Courses  
where courseid < 6 ;

-- 16 Delete Records with a Specific name 
delete  from Courses  
where name  =' english Grammar';

-- 17. Delete Records with a Specific Employee Count
delete from Courses  
where courseid_count = 0;

-- 18. Delete Records Based on Multiple Conditions
delete from Courses 
where courseid ='9' and name ='english Grammar';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  d  column Courses
alter table Courses  rename column courseid TO name_ID ;

-- 20. Rename the studentsid Column
alter table Courses  rename column coursename to ID;


-------------------------------- table 4 --------------------------------------------------------------------------------------------------------
-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus) VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');


-- to display/retrieve table data
SELECT * FROM Enrollments ;

-- to delete the tables
drop table Enrollments ;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  EnrollmentID  , grade from Enrollments ;
  
  -- 2. Select Enrollments   in a Specific status
  select*from Enrollments  where status='in progress';
  
  -- 3. select  Enrollments   order by  enrollment_id 
  select*from Enrollments  order by enrollmentid desc;
  
  -- 4.  Count the Number of Enrollments  
  select count(*) as total_enrollment from Enrollments  ;
  
  -- 5 count the number of Enrollments   in each grade
  select count(*) as grade from Enrollments ;
  
  -- 6 Select Enrollments  with enrollment id Count Greater Than a Certain Number
  select*from Enrollments  where enrollmentid >=4 ;
  
 -- 7  Select Enrollments  with feedback that Have More than 6 Characters
 select*from Enrollments  where char_length(feedback )>=6 ;
 
 -- 8 Add a column 
Alter table Enrollments 
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Enrollments 
modify column enrollmentid varchar(20) ;

-- 10.  Drop column 
alter table Enrollments  
drop column location;

-- 11.rename column 
alter table Enrollments 
change column progress  name  varchar(100) ;

-- 12 
alter table Enrollments 
alter column enrollmentid set default 1;


-- 13. delete a reacords base on condition
delete from Enrollments 
where enrollmentid  ='3';

-- 14. Delete Records with studentsid Below a Certain number
delete from Enrollments  
where courseid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Enrollments  
where enrollmentid < 6 ;

-- 16 Delete Records with a Specific name
delete  from Enrollments  
where name  =' doing well ';

-- 17. Delete Records with a Specific enrollment id
delete from enrollments
where enrollmentid_count = 0;

-- 18. Delete Records Based on Multiple Conditions
delete from Enrollments 
where enrollmentid ='9' and name ='doing well';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  d  column Enrollments
alter table Enrollments  rename column enrollmentid TO number_ID ;

-- 20. Rename the studentsid Column
alter table Enrollments  rename column grade to marks;



-------------------------------------------------- table 5 -------------------------------------------------------------------------------------------------------------
-- Table 5: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT,
    CourseID INT,
    TeacherID INT,
    Semester VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


INSERT INTO Classes (ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate) VALUES
(101, 'Math A', 'Mon-Wed 10am', 'R101', 30, 1, 1, '2023S1', '2023-06-01', '2023-08-31'),
(102, 'Science B', 'Tue-Thu 11am', 'R102', 25, 2, 2, '2023S1', '2023-06-01', '2023-08-31'),
(103, 'English C', 'Mon-Wed 2pm', 'R103', 20, 3, 3, '2023S1', '2023-06-01', '2023-08-31'),
(104, 'History D', 'Tue-Thu 1pm', 'R104', 30, 4, 4, '2023S1', '2023-06-01', '2023-08-31'),
(105, 'Geography E', 'Fri 9am', 'R105', 15, 5, 5, '2023S1', '2023-06-01', '2023-08-31'),
(106, 'Python F', 'Mon 3pm', 'R106', 20, 6, 6, '2023S1', '2023-06-01', '2023-08-31'),
(107, 'Physics G', 'Wed 10am', 'R107', 25, 7, 7, '2023S1', '2023-06-01', '2023-08-31'),
(108, 'Chemistry H', 'Thu 2pm', 'R108', 20, 8, 8, '2023S1', '2023-06-01', '2023-08-31'),
(109, 'Economics I', 'Fri 11am', 'R109', 30, 9, 9, '2023S1', '2023-06-01', '2023-08-31'),
(110, 'Botany J', 'Tue 4pm', 'R110', 15, 10, 10, '2023S1', '2023-06-01', '2023-08-31');


-- to display/retrieve table data
SELECT * FROM Classes ;

-- to delete the tables
drop table Classes ;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  classid  , classname from Classes ;
  
  -- 2. Select Classes   in a Specific status
  select*from Classes  where classname='math a';
  
  -- 3. select  Classes   order by  enrollment_id 
  select*from Classes  order by classid desc;
  
  -- 4.  Count the Number of Classes  
  select count(*) as total_class from Classes  ;
  
  -- 5 count the number of Classes   in each class name
  select count(*) as classname from Classes ;
  
  -- 6 Select Classes  with class id Count Greater Than a Certain Number
  select*from Classes  where classid >=4 ;
  
 -- 7  Select Classes  with feedback that Have More than 6 Characters
 select*from Classes  where char_length(classname)>=6 ;
 
 -- 8 Add a column 
Alter table Classes 
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Classes 
modify column classid varchar(20) ;

-- 10.  Drop column 
alter table Classes  
drop column location;

-- 11.rename column 
alter table Classes 
change column classname  name  varchar(100) ;

-- 12 
alter table Classes 
alter column classid set default 1;


-- 13. delete a reacords base on condition
delete from Classes 
where classid  ='3';

-- 14. Delete Records with studentsid Below a Certain number
delete from Classes  
where classid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Classes  
where classid < 6 ;

-- 16 Delete Records with a Specific name
delete  from Classes  
where name  =' math a ';

-- 17. Delete Records with a Specific enrollment id
delete from Classes
where classid_count = 4;

-- 18. Delete Records Based on Multiple Conditions
delete from Classes 
where classid ='9' and name ='math a';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  d  column Enrollments
alter table Classes  rename column classid TO number_ID ;

-- 20. Rename the studentsid Column
alter table Classes  rename column classname to nameclass;

--------------------------------- -------- table 6 --------------------------------------------------------------------------------------------------
-- Table 6: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    CourseID INT,
    ClassID INT,
    MaxMarks INT,
    AssignedDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Assignments (AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink) VALUES
(1, 'Algebra HW', 'Practice algebra problems', '2023-07-15', 1, 101, 100, '2023-06-15', 'Open', 'link1'),
(2, 'Physics Quiz', 'Concepts of motion', '2023-07-20', 7, 107, 50, '2023-06-18', 'Open', 'link2'),
(3, 'Essay', 'Write on World Wars', '2023-07-25', 4, 104, 100, '2023-06-20', 'Open', 'link3'),
(4, 'Python Project', 'Basic calculator app', '2023-07-30', 6, 106, 100, '2023-06-22', 'Open', 'link4'),
(5, 'Grammar Test', 'Tenses exercise', '2023-07-10', 3, 103, 50, '2023-06-10', 'Open', 'link5'),
(6, 'Botany Diagram', 'Label plant parts', '2023-07-12', 10, 110, 30, '2023-06-12', 'Open', 'link6'),
(7, 'Chemistry Lab', 'Acid-base reactions', '2023-07-28', 8, 108, 70, '2023-06-25', 'Open', 'link7'),
(8, 'Economic Report', 'Indian GDP growth', '2023-07-22', 9, 109, 80, '2023-06-19', 'Open', 'link8'),
(9, 'Geography Map', 'Continents labeling', '2023-07-17', 5, 105, 60, '2023-06-16', 'Open', 'link9'),
(10, 'Science Experiment', 'Simple circuits', '2023-07-18', 2, 102, 90, '2023-06-14', 'Open', 'link10');


-- to display/retrieve table data
SELECT * FROM Assignments ;

-- to delete the tables
drop table Assignments ;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  assignmentid  , title from Assignments ;
  
  -- 2. Select Assignments   in a Specific status
  select*from Assignments  where title='Physics Quiz';
  
  -- 3. select  Assignments   order by  enrollment_id 
  select*from Assignments  order by Assignmentid desc;
  
  -- 4.  Count the Number of Assignments  
  select count(*) as total_assignment from Assignments  ;
  
  -- 5 count the number of Assignments   in each assigmentid
  select count(*) as title from Assignments ;
  
  -- 6 Select Assignments  with class id Count Greater Than a Certain Number
  select*from Assignments  where Assignmentid >=4 ;
  
 -- 7  Select Assignments  with title that Have More than 6 Characters
 select*from Assignments  where char_length(title)>=6 ;
 
 -- 8 Add a column 
Alter table Assignments 
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Assignments 
modify column assignmentid varchar(20) ;

-- 10.  Drop column 
alter table Assignments  
drop column location;

-- 11.rename column 
alter table Assignments 
change column title name  varchar(100) ;

-- 12 
alter table Assignments 
alter column assignmentid set default 1;


-- 13. delete a reacords base on condition
delete from Assignments 
where Assignmentid  ='3';

-- 14. Delete Records with studentsid Below a Certain number
delete from Assignments  
where Assignmentid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Assignments  
where Assignmentid < 6 ;

-- 16 Delete Records with a Specific name
delete  from Assignments  
where name  ='Chemistry Lab';

-- 17. Delete Records with a Specific assignment id
delete from Assignments
where Assignmentid = 4;

-- 18. Delete Records Based on Multiple Conditions
delete from Assignments 
where assignmentid ='9' and name ='chemistry lab';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  d  column assignmenet
alter table Assignments  rename column enrollmentid TO number_ID ;

-- 20. Rename the assignment Column
alter table Assignments  rename column status to  onboarding;

----------------------------------------------------------------- table 7 -----------------------------------------------------------------------------------------------------
-- Table 7: Submissions
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate DATE,
    MarksObtained INT,
    Feedback TEXT,
    Status VARCHAR(20),
    FileLink VARCHAR(255),
    PlagiarismScore DECIMAL(5,2),
    LateSubmission BOOLEAN,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Submissions (SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission) VALUES
(1, 1, 1, '2023-07-14', 90, 'Excellent work', 'Graded', 'sub_link1', 5.00, FALSE),
(2, 2, 2, '2023-07-19', 45, 'Good effort', 'Graded', 'sub_link2', 10.00, FALSE),
(3, 3, 3, '2023-07-24', 70, 'Needs clarity', 'Graded', 'sub_link3', 0.00, FALSE),
(4, 4, 4, '2023-07-29', 95, 'Outstanding project', 'Graded', 'sub_link4', 2.50, FALSE),
(5, 5, 5, '2023-07-09', 48, 'Improve grammar', 'Graded', 'sub_link5', 15.00, TRUE),
(6, 6, 6, '2023-07-11', 25, 'Incomplete submission', 'Graded', 'sub_link6', 0.00, TRUE),
(7, 7, 7, '2023-07-27', 60, 'Well done', 'Graded', 'sub_link7', 5.00, FALSE),
(8, 8, 8, '2023-07-21', 78, 'Very detailed', 'Graded', 'sub_link8', 7.50, FALSE),
(9, 9, 9, '2023-07-16', 55, 'Good attempt', 'Graded', 'sub_link9', 3.00, FALSE),
(10, 10, 10, '2023-07-17', 65, 'Nice experiment', 'Graded', 'sub_link10', 12.00, FALSE);

 -- to display/retrieve table data
SELECT * FROM Submissions ;

-- to delete the tables
drop table Submissions ;

-- all 20 queries--
  -- 1. Select Specific Columns
  select  Submissionid  ,studentid from Submissions ;
  
  -- 2. Select Submission   in a Specific feedback
  select*from Submissions  where feedback='Excellent work';
  
  -- 3. select  Submission   order by  submissionid
  select*from Submissions  order by submissionid desc;
  
  -- 4.  Count the Number of Submission  
  select count(*) as total_submission from Submissions  ;
  
  -- 5 count the number of Submission   in each Submissionid
  select count(*) as Submissionid from Submissions ;
  
  -- 6 Select Submission  with submission  id Count Greater Than a Certain Number
  select*from Submissions  where Submissionid >=4 ;
  
 -- 7  Select Submission with title that Have More than 6 Characters
 select*from Submissions  where char_length(feedback)>=6 ;
 
 -- 8 Add a column 
Alter table Submissions 
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table Submissions 
modify column submissionid varchar(20) ;

-- 10.  Drop column 
alter table Submissions  
drop column location;

-- 11.rename column 
alter table Submissions 
change column feedback name  varchar(100) ;

-- 12 
alter table Submissions 
alter column submissionid set default 1;


-- 13. delete a reacords base on condition
delete from Submissions 
where submissionid  ='3';

-- 14. Delete Records with studentsid Below a Certain number
delete from Submissions  
where submissionid < 5;

-- 15. Delete Records Established Before a Certain id
delete  from Submissions  
where Submissionid < 6 ;

-- 16 Delete Records with a Specific name
delete  from Submissions  
where name  ='Good effort';

-- 17. Delete Records with a Specific a
delete from Submissions
where submissionid = 4;

-- 18. Delete Records Based on Multiple Conditions
delete from Submissions 
where submissionid ='2' and name ='good effort';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  d  column assignmenet
alter table Submissions  rename column submissiontid TO number_ID ;

-- 20. Rename the assignment Column
alter table Submissions  rename column status to  onboarding;

-------------------------- table 8 --------------------------------------------------------------------------------------------------------0000000000
-- Table 8: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(100),
    Date DATE,
    DurationMinutes INT,
    TotalMarks INT,
    CourseID INT,
    ClassID INT,
    Type VARCHAR(30),
    Status VARCHAR(20),
    ResultPublished BOOLEAN,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Exams (ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished) VALUES
(1, 'Math Midterm', '2023-07-20', 90, 100, 1, 101, 'Written', 'Completed', TRUE),
(2, 'Science Quiz', '2023-07-22', 60, 50, 2, 102, 'Online', 'Completed', TRUE),
(3, 'English Final', '2023-07-30', 120, 100, 3, 103, 'Written', 'Upcoming', FALSE),
(4, 'History Exam', '2023-07-28', 90, 100, 4, 104, 'Written', 'Completed', TRUE),
(5, 'Geography Test', '2023-07-25', 60, 50, 5, 105, 'Online', 'Upcoming', FALSE),
(6, 'Python Practical', '2023-07-29', 90, 100, 6, 106, 'Practical', 'Upcoming', FALSE),
(7, 'Physics Theory', '2023-07-23', 90, 100, 7, 107, 'Written', 'Completed', TRUE),
(8, 'Chemistry Lab', '2023-07-27', 60, 50, 8, 108, 'Practical', 'Upcoming', FALSE),
(9, 'Economics Exam', '2023-07-24', 90, 100, 9, 109, 'Written', 'Completed', TRUE),
(10, 'Botany Assessment', '2023-07-26', 60, 50, 10, 110, 'Written', 'Upcoming', FALSE);

-- to display/retrieve table data
SELECT * FROM Exams ;
-- to delete the table 
drop table exams;
  -- 1. Select Specific Columns
  select  student_id  , first_name from students;
  
  -- 2. Select students  in a Specific department_name
  select*from students where firstname='Aarav';
  
  -- 3. select  students  order by  departnent_id 
  select*from students order by studentid desc;
  
  -- 4.  Count the Number of students 
  select count(*) as total_student from students ;
  
  -- 5 count the number of students  in each  deparment_name 
  select count(*) as students from students group by firstname ;
  
  -- 6 Select students with department_id Count Greater Than a Certain Number
  select*from students where studentid >=4 ;
  
 -- 7  Select students with Names that Have More than 6 Characters
 select*from students where char_length(firstname  )>=6 ;
 
 -- 8 Add a column 
Alter table students
add column location  varchar(100) ;

-- 9. Modify an Existing Column
alter table students
modify column studentid varchar(20) ;

-- 10.  Drop column 
alter table students 
drop column location;

-- 11.rename column 
alter table students
change column firstname name  varchar(100) ;

-- 12. add defult values in exisiting column 
alter table students
alter column studentid set default 1;

-- 13. delete a reacords base on condition
delete from students
where name  ='arjun';

-- 14. Delete Records with studentsid Below a Certain number
delete from students 
where studentid < 5;

-- 15. Delete Records Established Before a Certain Date
delete  from students 
where studentid < 6 ;

-- 16 Delete Records with a Specific name 
delete  from students 
where name  =' arnav';

-- 17. Delete Records with a Specific Employee Count
delete from students 
where studentid_count = 0;

-- 18. Delete Records Based on Multiple Conditions
delete from students
where studentid ='3' and name='arjun';

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 19. Rename the  studentid Column
alter table students rename column studentid TO mg_ID ;

-- 20. Rename the studentsid Column
alter table students rename column firstname to ID;

-------------------------------------------------- table 2 quires --------------------------------------------------------------------------------------------------
 -- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- to display/retrieve table data
SELECT * FROM Teachers;

-- to delete the tables
drop table Teachers;

-- all 20 queries--
  -- 1. Select Specific Columns
  
