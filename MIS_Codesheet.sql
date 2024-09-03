ashok@master:~$ mysql -u ashok -p
Enter password: 


 -- Create the database
 CREATE DATABASE CollegeData;

 
 -- Use the newly created database
 USE CollegeData;
 
 -- Create the Students table with the provided headers
 CREATE TABLE Students (
    ->     EmailAddress VARCHAR(255) PRIMARY KEY,
    ->     RollNumber VARCHAR(20) NOT NULL UNIQUE,
    ->     FullName VARCHAR(255) NOT NULL,
    ->     Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    ->     ContactNumber VARCHAR(15) NOT NULL,
    ->     WhatsAppContactNumber VARCHAR(15),
    ->     DateOfBirth DATE,
    ->     Age INT,
    ->     Programme VARCHAR(100),
    ->     IntendedSpecialization1 VARCHAR(100),
    ->     IntendedSpecialization2 VARCHAR(100),
    ->     GraduationCollegeName VARCHAR(255),
    ->     UniversityName VARCHAR(255),
    ->     GraduationCity VARCHAR(100),
    ->     GraduationDegree VARCHAR(100),
    ->     GraduationSpecialization VARCHAR(100),
    ->     GraduationCGPA DECIMAL(4, 2),
    ->     GraduationScale VARCHAR(50),
    ->     GraduationPercentage DECIMAL(5, 2),
    ->     GraduationCompletionDate DATE,
    ->     GraduationCompletionYear INT,
    ->     Class12thSchoolName VARCHAR(255),
    ->     Class12thCity VARCHAR(100),
    ->     Class12thBoard VARCHAR(100),
    ->     Class12thStream VARCHAR(50),
    ->     Class12thPercentage DECIMAL(5, 2),
    ->     Class12thCompletionDate DATE,
    ->     Class12thCompletionYear INT,
    ->     Class10thSchoolName VARCHAR(255),
    ->     Class10thCity VARCHAR(100),
    ->     Class10thBoard VARCHAR(100),
    ->     Class10thCGPA DECIMAL(4, 2),
    ->     Class10thScale VARCHAR(50),
    ->     Class10thPercentage DECIMAL(5, 2),
    ->     Class10thCompletionDate DATE,
    ->     Class10thCompletionYear INT,
    ->     PriorWorkExperience BOOLEAN,
    ->     TotalWorkExperienceMonths INT,
    ->     CurrentResidentialAddress VARCHAR(255),
    ->     PermanentResidentialAddress VARCHAR(255),
    ->     ResidenceCity VARCHAR(100),
    ->     ResidenceState VARCHAR(100),
    ->     PINCode VARCHAR(10),
    ->     FathersName VARCHAR(255),
    ->     FathersOccupation VARCHAR(100),
    ->     FathersDesignation VARCHAR(100),
    ->     FathersContactNumber VARCHAR(15),
    ->     MothersName VARCHAR(255),
    ->     MothersOccupation VARCHAR(100),
    ->     MothersDesignation VARCHAR(100),
    ->     MothersContactNumber VARCHAR(15),
    ->     LanguagesKnown VARCHAR(255),
    ->     AdditionalQualifications VARCHAR(255),
    ->     LiveProjectsCompleted VARCHAR(255),
    ->     Certifications VARCHAR(255),
    ->     LeadershipPositions VARCHAR(255),
    ->     Achievements VARCHAR(255),
    ->     PersonalEmailAddress VARCHAR(255),
    ->     FSMEmailAddress VARCHAR(255),
    ->     SkypeID VARCHAR(100),
    ->     LinkedInURL VARCHAR(255),
    ->     CATPercentile DECIMAL(5, 2),
    ->     XATPercentile DECIMAL(5, 2),
    ->     GMATScore INT
    -> );

 CREATE TABLE Gender (
    ->     GenderID INT PRIMARY KEY AUTO_INCREMENT,
    ->     Gender VARCHAR(10) UNIQUE
    -> );

 
 INSERT INTO Gender (Gender) VALUES ('Male'), ('Female'), ('Other');

 CREATE TABLE Programme (
    ->     ProgrammeID INT PRIMARY KEY AUTO_INCREMENT,
    ->     ProgrammeName VARCHAR(100) UNIQUE
    -> );

 
 ALTER TABLE Students
    -> ADD ProgrammeID INT,
    -> ADD CONSTRAINT FK_Programme FOREIGN KEY (ProgrammeID) REFERENCES Programme(ProgrammeID);

 CREATE TABLE Specialization (
    ->     SpecializationID INT PRIMARY KEY AUTO_INCREMENT,
    ->     SpecializationName VARCHAR(100) UNIQUE
    -> );

 
 ALTER TABLE Students
    -> ADD IntendedSpecialization1ID INT,
    -> ADD IntendedSpecialization2ID INT,
    -> ADD CONSTRAINT FK_Specialization1 FOREIGN KEY (IntendedSpecialization1ID) REFERENCES Specialization(SpecializationID),
    -> ADD CONSTRAINT FK_Specialization2 FOREIGN KEY (IntendedSpecialization2ID) REFERENCES Specialization(SpecializationID);

 CREATE TABLE GraduationDetails (
    ->     GraduationID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     GraduationCollegeName VARCHAR(255),
    ->     UniversityName VARCHAR(255),
    ->     GraduationCity VARCHAR(100),
    ->     GraduationDegree VARCHAR(100),
    ->     GraduationSpecialization VARCHAR(100),
    ->     GraduationCGPA DECIMAL(4, 2),
    ->     GraduationScale VARCHAR(50),
    ->     GraduationPercentage DECIMAL(5, 2),
    ->     GraduationCompletionDate DATE,
    ->     GraduationCompletionYear INT,
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE SchoolingDetails (
    ->     SchoolingID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     SchoolingLevel VARCHAR(10),  -- '10th' or '12th'
    ->     SchoolName VARCHAR(255),
    ->     City VARCHAR(100),
    ->     Board VARCHAR(100),
    ->     Stream VARCHAR(50),
    ->     CGPA DECIMAL(4, 2),
    ->     Scale VARCHAR(50),
    ->     Percentage DECIMAL(5, 2),
    ->     CompletionDate DATE,
    ->     CompletionYear INT,
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE WorkExperience (
    ->     ExperienceID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     PriorWorkExperience BOOLEAN,
    ->     TotalWorkExperienceMonths INT,
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE ResidentialDetails (
    ->     ResidenceID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     CurrentResidentialAddress VARCHAR(255),
    ->     PermanentResidentialAddress VARCHAR(255),
    ->     CityOfResidence VARCHAR(100),
    ->     StateOfResidence VARCHAR(100),
    ->     PINCode VARCHAR(10),
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE ParentDetails (
    ->     ParentID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     ParentType VARCHAR(6),  -- 'Father' or 'Mother'
    ->     ParentName VARCHAR(255),
    ->     Occupation VARCHAR(100),
    ->     Designation VARCHAR(100),
    ->     ContactNumber VARCHAR(15),
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE Students (
    ->     EmailAddress VARCHAR(255) PRIMARY KEY,
    ->     RollNumber VARCHAR(20) NOT NULL UNIQUE,
    ->     FullName VARCHAR(255) NOT NULL,
    ->     GenderID INT,
    ->     WhatsAppContactNumber VARCHAR(15),
    ->     DateOfBirth DATE,
    ->     Age INT,
    ->     ProgrammeID INT,
    ->     IntendedSpecialization1ID INT,
    ->     IntendedSpecialization2ID INT,
    ->     LanguagesKnown VARCHAR(255),
    ->     AdditionalQualifications VARCHAR(255),
    ->     LiveProjectsCompleted VARCHAR(255),
    ->     Certifications VARCHAR(255),
    ->     LeadershipPositions VARCHAR(255),
    ->     Achievements VARCHAR(255),
    ->     PersonalEmailAddress VARCHAR(255),
    ->     FSMEmailAddress VARCHAR(255),
    ->     SkypeID VARCHAR(100),
    ->     LinkedInURL VARCHAR(255),
    ->     CATPercentile DECIMAL(5, 2),
    ->     XATPercentile DECIMAL(5, 2),
    ->     GMATScore INT,
    ->     FOREIGN KEY (GenderID) REFERENCES Gender(GenderID),
    ->     FOREIGN KEY (ProgrammeID) REFERENCES Programme(ProgrammeID),
    ->     FOREIGN KEY (IntendedSpecialization1ID) REFERENCES Specialization(SpecializationID),
    ->     FOREIGN KEY (IntendedSpecialization2ID) REFERENCES Specialization(SpecializationID)
    -> );

 CREATE TABLE Certifications (
    ->     CertificationID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     Certification VARCHAR(255),
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


 CREATE TABLE LeadershipPositions (
    ->     LeadershipID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmailAddress VARCHAR(255),
    ->     Position VARCHAR(255),
    ->     FOREIGN KEY (EmailAddress) REFERENCES Students(EmailAddress)
    -> );


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
