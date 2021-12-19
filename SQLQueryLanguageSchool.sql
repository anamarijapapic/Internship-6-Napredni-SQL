CREATE DATABASE LanguageSchool

USE LanguageSchool


CREATE TABLE Languages (
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Language] nvarchar(25) UNIQUE NOT NULL
)

CREATE TABLE ProficiencyLevels (
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Level] nvarchar(2) UNIQUE NOT NULL,
)

CREATE TABLE Classrooms (
	Id int IDENTITY(1,1) PRIMARY KEY,
	ClassroomNumber int NOT NULL
)

CREATE TABLE Teachers (
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(25) NOT NULL,
	LastName nvarchar(25) NOT NULL,
	DateOfBirth datetime2 NOT NULL
)

CREATE TABLE Courses (
	Id int IDENTITY(1,1) PRIMARY KEY,
	CourseLanguageId int FOREIGN KEY REFERENCES Languages(Id) NOT NULL,
	ProficiencyLevelId int FOREIGN KEY REFERENCES ProficiencyLevels(Id) NOT NULL,
	ClassroomId int FOREIGN KEY REFERENCES Classrooms(Id) NOT NULL,
	TotalPrice int NOT NULL
)

CREATE TABLE TeachersCourses (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TeacherId int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	CourseId int FOREIGN KEY REFERENCES Courses(Id) NOT NULL
)

CREATE TABLE Lectures (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TeachersCoursesId int FOREIGN KEY REFERENCES TeachersCourses(Id) NOT NULL,
	StartOfLecture datetime2 NOT NULL,
	EndOfLecture datetime2 NOT NULL
)

CREATE TABLE Students (
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(25) NOT NULL,
	LastName nvarchar(25) NOT NULL,
	DateOfBirth datetime2 NOT NULL
)

CREATE TABLE StudentsLectures (
	Id int IDENTITY(1,1) PRIMARY KEY,
	StudentId int FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	LectureId int FOREIGN KEY REFERENCES Lectures(Id) NOT NULL,
	NumberOfPaidInstallments int DEFAULT 0 NOT NULL,
	PaidAmountSoFar int DEFAULT 0 NOT NULL
)