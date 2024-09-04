ashok@master:~$ mysql -u ashok -p
Enter password: 


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
