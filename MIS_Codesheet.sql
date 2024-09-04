(base) ashok@master:~$ mysql -u ashok -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> drop database CollegeData;
Query OK, 11 rows affected (0.15 sec)

mysql> create database CollegeData;
Query OK, 1 row affected (0.02 sec)

mysql> use CollegeData;
Database changed
mysql> -- Create the Students table with normalized structure
mysql> CREATE TABLE Students (
    ->     EmailAddress VARCHAR(40) PRIMARY KEY,
    ->     RollNumber VARCHAR(6) NOT NULL UNIQUE,
    ->     FullName VARCHAR(30) NOT NULL,
    ->     Gender ENUM('Male', 'Female', 'Other'),
    ->     ContactNumber VARCHAR(15) NOT NULL,
    ->     WhatsAppContactNumber VARCHAR(15),
    ->     DateOfBirth DATE,
    ->     Age INT,
    ->     Programme ENUM('Core', 'IB', 'FM', 'BDA'),
    ->     IntendedSpecialization1 ENUM('Marketing', 'Finance', 'BDA', 'IT', 'Operations', 'HR', 'Strategy'),
    ->     IntendedSpecialization2 ENUM('Marketing', 'Finance', 'BDA', 'IT', 'Operations', 'HR', 'Strategy'),
    ->     CurrentResidentialAddress VARCHAR(100),
    ->     PermanentResidentialAddress VARCHAR(100),
    ->     CityOfResidence VARCHAR(15),
    ->     StateOfResidence VARCHAR(15),
    ->     PINCode VARCHAR(6),
    ->     FathersName VARCHAR(30),
    ->     FathersOccupation VARCHAR(10),
    ->     FathersDesignation VARCHAR(10),
    ->     FathersContactNumber VARCHAR(15),
    ->     MothersName VARCHAR(30),
    ->     MothersOccupation VARCHAR(10),
    ->     MothersDesignation VARCHAR(10),
    ->     MothersContactNumber VARCHAR(15),
    ->     LanguagesKnown VARCHAR(50),
    ->     AdditionalQualifications VARCHAR(50),
    ->     LiveProjectsCompleted VARCHAR(50),
    ->     PersonalEmailAddress VARCHAR(40),
    ->     FSMEmailAddress VARCHAR(20),
    ->     LinkedInURL VARCHAR(20),
    ->     CATPercentile DECIMAL(5, 2),
    ->     XATPercentile DECIMAL(5, 2),
    ->     GMATScore INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> -- Create GraduationDetails table
mysql> CREATE TABLE GraduationDetails (
    ->     GraduationID INT PRIMARY KEY AUTO_INCREMENT,
    ->     GraduationCollegeName VARCHAR(50),
    ->     UniversityName VARCHAR(50),
    ->     GraduationCity VARCHAR(20),
    ->     GraduationDegree VARCHAR(30),
    ->     GraduationSpecialization VARCHAR(15),
    ->     GraduationCGPA DECIMAL(4, 2),
    ->     GraduationScale INT,
    ->     GraduationPercentage DECIMAL(5, 2),
    ->     GraduationCompletionDate DATE,
    ->     GraduationCompletionYear INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> -- Create SchoolingDetails table
mysql> CREATE TABLE SchoolingDetails (
    ->     SchoolingID INT PRIMARY KEY AUTO_INCREMENT,
    ->     SchoolingLevel ENUM('10th', '12th'),
    ->     SchoolName VARCHAR(50),
    ->     City VARCHAR(20),
    ->     Board VARCHAR(30),
    ->     Stream VARCHAR(20),
    ->     CGPA DECIMAL(4, 2),
    ->     Scale INT,
    ->     Percentage DECIMAL(5, 2),
    ->     CompletionDate DATE,
    ->     CompletionYear INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> -- Create WorkExperience table
mysql> CREATE TABLE WorkExperience (
    ->     ExperienceID INT PRIMARY KEY AUTO_INCREMENT,
    ->     PriorWorkExperience ENUM('Yes', 'No'),
    ->     TotalWorkExperienceMonths INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- Create ResidentialDetails table
mysql> CREATE TABLE ResidentialDetails (
    ->     ResidenceID INT PRIMARY KEY AUTO_INCREMENT,
    ->     CurrentResidentialAddress VARCHAR(100),
    ->     PermanentResidentialAddress VARCHAR(100),
    ->     CityOfResidence VARCHAR(20),
    ->     StateOfResidence VARCHAR(20),
    ->     PINCode VARCHAR(6)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- Create ParentDetails table
mysql> CREATE TABLE ParentDetails (
    ->     ParentType ENUM('Father', 'Mother'),
    ->     ParentName VARCHAR(30),
    ->     Occupation VARCHAR(20),
    ->     Designation VARCHAR(20),
    ->     ContactNumber VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> -- Create Certifications table
mysql> CREATE TABLE Certifications (
    ->     Certification VARCHAR(50),
    ->     CertificationSource VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- Create LeadershipPositions table
mysql> CREATE TABLE LeadershipPositions (
    ->     Position VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> ALTER TABLE ParentDetails
    -> ADD COLUMN ParentID INT PRIMARY KEY AUTO_INCREMENT,
    -> ADD COLUMN EmailAddress VARCHAR(40),
    -> ADD FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Certifications
    -> ADD COLUMN CertificationID INT PRIMARY KEY AUTO_INCREMENT,
    -> ADD COLUMN EmailAddress VARCHAR(40),
    -> ADD FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> ALTER TABLE LeadershipPositions
    -> ADD COLUMN LeadershipID INT PRIMARY KEY AUTO_INCREMENT,
    -> ADD COLUMN EmailAddress VARCHAR(40),
    -> ADD FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ^C
mysql> -- Alter GraduationDetails table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE GraduationDetails
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter SchoolingDetails table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE SchoolingDetails
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter WorkExperience table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE WorkExperience
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter ResidentialDetails table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE ResidentialDetails
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter ParentDetails table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE ParentDetails
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter Certifications table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE Certifications
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Alter LeadershipPositions table to add RollNumber and create the foreign key relationship
mysql> ALTER TABLE LeadershipPositions
    -> ADD COLUMN RollNumber VARCHAR(6),
    -> ADD FOREIGN KEY (RollNumber) REFERENCES Students(RollNumber);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- Remove foreign key and EmailAddress from ParentDetails table
mysql> ALTER TABLE ParentDetails
    -> DROP FOREIGN KEY ParentDetails_ibfk_1, -- This removes the foreign key constraint
    -> DROP COLUMN EmailAddress;             -- This removes the EmailAddress column
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Remove foreign key and EmailAddress from Certifications table
mysql> ALTER TABLE Certifications
    -> DROP FOREIGN KEY Certifications_ibfk_1, -- This removes the foreign key constraint
    -> DROP COLUMN EmailAddress;               -- This removes the EmailAddress column
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Remove foreign key and EmailAddress from LeadershipPositions table
mysql> ALTER TABLE LeadershipPositions
    -> DROP FOREIGN KEY LeadershipPositions_ibfk_1, -- This removes the foreign key constraint
    -> DROP COLUMN EmailAddress;                    -- This removes the EmailAddress column
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ParentDetails
    -> MODIFY Designation VARCHAR(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Students MODIFY FathersDesignation VARCHAR(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Students MODIFY MothersDesignation VARCHAR(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> ALTER TABLE Students MODIFY FSMEmailAddress VARCHAR(40);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Students MODIFY LinkedInURL VARCHAR(40);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Students MODIFY FathersOccupation VARCHAR(40);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Students (EmailAddress, RollNumber, FullName, Gender, ContactNumber, WhatsAppContactNumber, DateOfBirth, Age, Programme, IntendedSpecialization1, IntendedSpecialization2, CurrentResidentialAddress, PermanentResidentialAddress, CityOfResidence, StateOfResidence, PINCode, FathersName, FathersOccupation, FathersDesignation, FathersContactNumber, MothersName, MothersOccupation, MothersDesignation, MothersContactNumber, LanguagesKnown, AdditionalQualifications, LiveProjectsCompleted, PersonalEmailAddress, FSMEmailAddress, LinkedInURL, CATPercentile, XATPercentile, GMATScore) VALUES ('student1@example.com', '10001', 'Ananya Sharma', 'Female', '9876543210', '9876543210', '2000-01-15', 24, 'Core', 'Marketing', 'Finance', 'Flat No. 101, Lotus Apartments, MG Road', 'House No. 25, Sector 12, Noida', 'Noida', 'Uttar Pradesh', '201301', 'Rajesh Sharma', 'Engineer', 'Senior Engineer', '9876543211', 'Sunita Sharma', 'Teacher', 'Headmistress', '9876543212', 'Hindi, English', 'Data Analytics Certification', 'Marketing Campaign Project', 'ananya.sharma@gmail.com', 'ananya.sharma@fsm.edu', 'linkedin.com/in/ananyasharma', 98.5, 95.0, 700), ('student2@example.com', '10002', 'Rohit Verma', 'Male', '9876543213', '9876543213', '1999-05-23', 25, 'IB', 'Finance', 'Strategy', 'Flat No. 205, Green Valley, Andheri', 'Bungalow No. 9, Juhu', 'Mumbai', 'Maharashtra', '400049', 'Prakash Verma', 'Doctor', 'Consultant', '9876543214', 'Neha Verma', 'Homemaker', NULL, '9876543215', 'English, Marathi', 'CFA Level 1', 'Financial Analysis Project', 'rohit.verma@gmail.com', 'rohit.verma@fsm.edu', 'linkedin.com/in/rohitverma', 97.0, 93.5, 680), ('student3@example.com', '10003', 'Megha Singh', 'Female', '9876543216', '9876543216', '2001-03-10', 23, 'FM', 'Operations', 'IT', 'Flat No. 512, Brigade Road', 'Plot No. 78, Indiranagar', 'Bengaluru', 'Karnataka', '560038', 'Ajay Singh', 'Businessman', 'Owner', '9876543217', 'Poonam Singh', 'Professor', 'Lecturer', '9876543218', 'Hindi, Kannada, English', 'Six Sigma Certification', 'Supply Chain Project', 'megha.singh@gmail.com', 'megha.singh@fsm.edu', 'linkedin.com/in/meghasingh', 96.2, 92.8, 720), ('student4@example.com', '10004', 'Arjun Reddy', 'Male', '9876543219', '9876543219', '1998-11-30', 26, 'BDA', 'BDA', 'IT', 'Apartment No. 20, Jubilee Hills', 'Villa No. 45, Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'Vikram Reddy', 'Lawyer', 'Senior Advocate', '9876543220', 'Lakshmi Reddy', 'Banker', 'Branch Manager', '9876543221', 'Telugu, English', 'Python Programming', 'Data Mining Project', 'arjun.reddy@gmail.com', 'arjun.reddy@fsm.edu', 'linkedin.com/in/arjunreddy', 99.0, 94.2, 710);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE GraduationDetails MODIFY GraduationSpecialization VARCHAR(40);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO GraduationDetails (GraduationCollegeName, UniversityName, GraduationCity, GraduationDegree, GraduationSpecialization, GraduationCGPA, GraduationScale, GraduationPercentage, GraduationCompletionDate, GraduationCompletionYear, RollNumber) VALUES ('Delhi College of Engineering', 'Delhi University', 'Delhi', 'B.Tech', 'Mechanical Engineering', 8.5, 10, 85.0, '2021-06-15', 2021, '10001'), ('St. Xavier\'s College', 'Mumbai University', 'Mumbai', 'B.Com', 'Finance', 8.0, 10, 80.0, '2020-05-10', 2020, '10002'), ('RV College of Engineering', 'VTU', 'Bengaluru', 'B.Tech', 'Computer Science', 9.0, 10, 90.0, '2022-07-20', 2022, '10003'), ('Osmania University', 'Osmania University', 'Hyderabad', 'B.Sc', 'Data Science', 8.7, 10, 87.0, '2019-08-25', 2019, '10004');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO SchoolingDetails (SchoolingLevel, SchoolName, City, Board, Stream, CGPA, Scale, Percentage, CompletionDate, CompletionYear, RollNumber)
    -> VALUES
    -> ('10th', 'Delhi Public School', 'Delhi', 'CBSE', 'Science', 9.0, 10, 90.0, '2015-05-15', 2015, '10001'),
    -> ('12th', 'Delhi Public School', 'Delhi', 'CBSE', 'Science', 8.8, 10, 88.0, '2017-05-15', 2017, '10001'),
    -> ('10th', 'Jamnabai Narsee School', 'Mumbai', 'ICSE', 'Commerce', 8.5, 10, 85.0, '2014-06-10', 2014, '10002'),
    -> ('12th', 'Jamnabai Narsee School', 'Mumbai', 'ICSE', 'Commerce', 8.7, 10, 87.0, '2016-06-10', 2016, '10002');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO WorkExperience (PriorWorkExperience, TotalWorkExperienceMonths, RollNumber)
    -> VALUES
    -> ('Yes', 24, '10001'),
    -> ('Yes', 12, '10002'),
    -> ('No', 0, '10003'),
    -> ('Yes', 36, '10004');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO ParentDetails (ParentType, ParentName, Occupation, Designation, ContactNumber, RollNumber)
    -> VALUES
    -> ('Father', 'Rajesh Sharma', 'Engineer', 'Senior Engineer', '9876543211', '10001'),
    -> ('Mother', 'Sunita Sharma', 'Teacher', 'Headmistress', '9876543212', '10001'),
    -> ('Father', 'Prakash Verma', 'Doctor', 'Consultant', '9876543214', '10002'),
    -> ('Mother', 'Neha Verma', 'Homemaker', NULL, '9876543215', '10002');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Certifications (Certification, CertificationSource, RollNumber)
    -> VALUES
    -> ('Data Analytics Certification', 'Coursera', '10001'),
    -> ('CFA Level 1', 'CFA Institute', '10002'),
    -> ('Six Sigma Certification', 'Udemy', '10003'),
    -> ('Python Programming', 'edX', '10004');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO LeadershipPositions (Position, RollNumber)
    -> VALUES
    -> ('President of Marketing Club', '10001'),
    -> ('Treasurer of Finance Club', '10002'),
    -> ('Head of IT Club', '10003'),
    -> ('Vice President of Data Science Society', '10004');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0


-- Admin Role: Full access to the entire database
GRANT ALL PRIVILEGES ON CollegeData.* TO 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';

-- Placement Committee Role: Full access to all tables
GRANT ALL PRIVILEGES ON CollegeData.* TO 'place_comm'@'localhost' IDENTIFIED BY 'place_comm_password';

-- Academic Office Role: Read-only access to students, education, and schooling tables
GRANT SELECT ON CollegeData.students TO 'acad_office'@'localhost' IDENTIFIED BY 'acad_office_password';
GRANT SELECT ON CollegeData.education TO 'acad_office'@'localhost';
GRANT SELECT ON CollegeData.schooling TO 'acad_office'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;
