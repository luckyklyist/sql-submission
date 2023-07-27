-- @block

-- Create the "University" database
CREATE DATABASE University;

-- Switch to the "University" database
USE University;

-- Create the "Students" table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE CHECK (DateOfBirth <= CURDATE()),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F'))
);

-- Create the "Courses" table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits SMALLINT
);

-- Create the "Enrollments" table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade DECIMAL(4, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID)
);

-- Create the "GradeEnum" ENUM type
CREATE TYPE GradeEnum AS ENUM ('A', 'B', 'C', 'D', 'E', 'F');

-- Alter the "Grade" column in the "Enrollments" table to use the "GradeEnum" type
ALTER TABLE Enrollments
ALTER COLUMN Grade GradeEnum;

-- Create the "Professors" table
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE CHECK (DateOfBirth <= CURDATE()),
    Gender CHAR(1),
    Specialization VARCHAR(100)
);

-- Create the "Departments" table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    HeadProfessorID INT,
    FOREIGN KEY (HeadProfessorID) REFERENCES Professors(ProfessorID)
);

-- Create the "Prerequisites" table
CREATE TABLE Prerequisites (
    PrerequisiteID INT PRIMARY KEY,
    CourseID INT,
    PrerequisiteCourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

-- Create the "StudentGrades" view
CREATE VIEW StudentGrades AS
SELECT 
    s.StudentID,
    s.FirstName,
