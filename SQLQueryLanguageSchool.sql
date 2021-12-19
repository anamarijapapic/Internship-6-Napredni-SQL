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


INSERT INTO Languages([Language]) VALUES
('engleski'),
(N'njemaèki'),
('talijanski'),
('francuski'),
(N'španjolski'),
('portugalski'),
(N'švedski'),
('ruski'),
('turski'),
('kineski')

SELECT * FROM Languages

INSERT INTO ProficiencyLevels([Level]) VALUES
('A1'),
('A2'),
('B1'),
('B2'),
('C1'),
('C2')

SELECT * FROM ProficiencyLevels

INSERT INTO Classrooms(ClassroomNumber) VALUES
(101),
(102),
(103),
(201),
(202),
(203),
(301),
(302),
(303)

SELECT * FROM Classrooms

INSERT INTO Teachers(FirstName, LastName, DateOfBirth) VALUES
('Neda', 'Wind', '1992-07-18 13:45:05'),
('Ade', 'Poytheras', '1986-08-31 00:53:33'),
('Gayler', 'Francesch', '1988-10-18 19:42:45'),
('Traver', 'Rollings', '1995-03-28 22:33:11'),
('Violetta', 'Illiston', '1987-06-25 03:43:18'),
('Edward', 'MacGillivray', '1981-05-28 19:36:25'),
('Johnath', 'Wilkenson', '1990-08-03 17:49:37'),
('Malory', 'Worley', '1973-09-15 21:44:30'),
('Charyl', 'Laffling', '1984-07-02 01:32:05'),
('Clarabelle', 'Bellamy', '1978-12-16 00:11:40')

SELECT * FROM Teachers

INSERT INTO Courses(CourseLanguageId, ProficiencyLevelId, ClassroomId, TotalPrice) VALUES
(1, 1, 1, 1000),
(1, 3, 1, 2000),
(1, 5, 1, 3000),
(1, 6, 1, 3500),
(2, 4, 4, 2500), 
(2, 6, 4, 3500),
(3, 2, 7, 1500),
(3, 4, 7, 2500), 
(4, 1, 2, 1000),
(4, 3, 2, 2000),
(5, 2, 3, 1500),
(5, 6, 3, 3500),
(6, 1, 3, 1000),
(7, 1, 5, 1000),
(8, 1, 6, 1000),
(9, 1, 8, 1000),
(10, 1, 9, 1000)

SELECT * FROM Courses

INSERT INTO TeachersCourses(TeacherId, CourseId) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(3, 5),
(4, 5),
(4, 6),
(5, 7), 
(6, 8),
(7, 9),
(7, 10),
(8, 11),
(8, 12),
(8, 13),
(9, 14),
(9, 15),
(10, 16), 
(10, 17)

SELECT * FROM TeachersCourses

INSERT INTO Lectures(TeachersCoursesId, StartOfLecture, EndOfLecture) VALUES
(1, '2021-10-01 16:00:00', '2021-10-01 17:30:00'),
(1, '2021-10-02 16:00:00', '2021-10-02 17:30:00'),
(1, '2021-10-03 16:00:00', '2021-10-03 17:30:00'),
(1, '2021-10-04 16:00:00', '2021-10-04 17:30:00'),
(1, '2021-10-05 16:00:00', '2021-10-05 17:30:00'),
(2, '2021-10-01 20:00:00', '2021-10-01 21:30:00'),
(2, '2021-10-02 20:00:00', '2021-10-02 21:30:00'),
(2, '2021-10-03 20:00:00', '2021-10-03 21:30:00'),
(2, '2021-10-04 20:00:00', '2021-10-04 21:30:00'),
(2, '2021-10-05 20:00:00', '2021-10-05 21:30:00'),
(3, '2021-10-06 16:00:00', '2021-10-06 17:30:00'),
(3, '2021-10-07 16:00:00', '2021-10-07 17:30:00'),
(3, '2021-10-08 16:00:00', '2021-10-08 17:30:00'),
(3, '2021-10-09 16:00:00', '2021-10-09 17:30:00'),
(3, '2021-10-10 16:00:00', '2021-10-10 17:30:00'),
(4, '2021-10-06 20:00:00', '2021-10-06 21:30:00'),
(4, '2021-10-07 20:00:00', '2021-10-07 21:30:00'),
(4, '2021-10-08 20:00:00', '2021-10-08 21:30:00'),
(4, '2021-10-09 20:00:00', '2021-10-09 21:30:00'),
(4, '2021-10-10 20:00:00', '2021-10-10 21:30:00'),
(5, '2021-10-02 09:00:00', '2021-10-02 10:30:00'),
(5, '2021-10-04 09:00:00', '2021-10-04 10:30:00'),
(5, '2021-10-06 09:00:00', '2021-10-06 10:30:00'),
(5, '2021-10-08 09:00:00', '2021-10-08 10:30:00'),
(5, '2021-10-10 09:00:00', '2021-10-10 10:30:00'),
(6, '2021-10-01 09:00:00', '2021-10-01 10:30:00'),
(6, '2021-10-03 09:00:00', '2021-10-03 10:30:00'),
(6, '2021-10-05 09:00:00', '2021-10-05 10:30:00'),
(6, '2021-10-07 09:00:00', '2021-10-07 10:30:00'),
(6, '2021-10-09 09:00:00', '2021-10-09 10:30:00'),
(7, '2021-10-01 11:00:00', '2021-10-01 12:30:00'),
(7, '2021-10-05 11:00:00', '2021-10-05 12:30:00'),
(8, '2021-10-10 11:00:00', '2021-10-10 12:30:00'),
(8, '2021-10-15 11:00:00', '2021-10-15 12:30:00'),
(9, '2021-10-20 11:00:00', '2021-10-20 12:30:00'),
(9, '2021-10-25 11:00:00', '2021-10-25 12:30:00'),
(10, '2021-10-11 18:30:00', '2021-10-11 20:00:00'),
(10, '2021-10-12 18:30:00', '2021-10-12 20:00:00'),
(11, '2021-10-13 18:30:00', '2021-10-12 20:00:00'),
(11, '2021-10-14 18:30:00', '2021-10-13 20:00:00'),
(12, '2021-10-15 08:30:00', '2021-10-15 10:00:00'),
(12, '2021-10-16 08:30:00', '2021-10-16 10:00:00'),
(12, '2021-10-17 08:30:00', '2021-10-17 10:00:00'),
(12, '2021-10-18 08:30:00', '2021-10-18 10:00:00'),
(12, '2021-10-19 08:30:00', '2021-10-19 10:00:00'),
(12, '2021-10-20 08:30:00', '2021-10-20 10:00:00'),
(13, '2021-10-06 16:00:00', '2021-10-06 17:30:00'),
(13, '2021-10-07 16:00:00', '2021-10-07 17:30:00'),
(13, '2021-10-08 16:00:00', '2021-10-08 17:30:00'),
(13, '2021-10-09 16:00:00', '2021-10-09 17:30:00'),
(13, '2021-10-10 16:00:00', '2021-10-10 17:30:00'),
(14, '2021-10-06 20:00:00', '2021-10-06 21:30:00'),
(14, '2021-10-07 20:00:00', '2021-10-07 21:30:00'),
(14, '2021-10-08 20:00:00', '2021-10-08 21:30:00'),
(14, '2021-10-09 20:00:00', '2021-10-09 21:30:00'),
(14, '2021-10-10 20:00:00', '2021-10-10 21:30:00'),
(15, '2021-10-02 09:00:00', '2021-10-02 10:30:00'),
(15, '2021-10-04 09:00:00', '2021-10-04 10:30:00'),
(15, '2021-10-06 09:00:00', '2021-10-06 10:30:00'),
(15, '2021-10-08 09:00:00', '2021-10-08 10:30:00'),
(15, '2021-10-10 09:00:00', '2021-10-10 10:30:00'),
(16, '2021-10-01 09:00:00', '2021-10-01 10:30:00'),
(16, '2021-10-03 09:00:00', '2021-10-03 10:30:00'),
(16, '2021-10-05 09:00:00', '2021-10-05 10:30:00'),
(16, '2021-10-07 09:00:00', '2021-10-07 10:30:00'),
(16, '2021-10-09 09:00:00', '2021-10-09 10:30:00'),
(17, '2021-10-01 11:00:00', '2021-10-01 12:30:00'),
(17, '2021-10-05 11:00:00', '2021-10-05 12:30:00'),
(18, '2021-10-10 11:00:00', '2021-10-10 12:30:00'),
(18, '2021-10-15 11:00:00', '2021-10-15 12:30:00'),
(19, '2021-10-20 11:00:00', '2021-10-20 12:30:00'),
(19, '2021-10-25 11:00:00', '2021-10-25 12:30:00'),
(20, '2021-10-11 18:30:00', '2021-10-11 20:00:00'),
(20, '2021-10-12 18:30:00', '2021-10-12 20:00:00'),
(21, '2021-10-13 18:30:00', '2021-10-12 20:00:00'),
(21, '2021-10-14 18:30:00', '2021-10-13 20:00:00'),
(22, '2021-10-15 08:30:00', '2021-10-15 10:00:00'),
(22, '2021-10-16 08:30:00', '2021-10-16 10:00:00'),
(22, '2021-10-17 08:30:00', '2021-10-17 10:00:00'),
(22, '2021-10-18 08:30:00', '2021-10-18 10:00:00'),
(22, '2021-10-19 08:30:00', '2021-10-19 10:00:00'),
(22, '2021-10-20 08:30:00', '2021-10-20 10:00:00')

SELECT * FROM Lectures

INSERT INTO Students(FirstName, LastName, DateOfBirth) VALUES
('Cairistiona', 'Rubertis', '1997-02-15 04:30:19'),
('Verney', 'Deddum', '2009-01-08 05:21:30'),
('Katusha', 'Madill', '2000-06-30 15:48:46'),
('Ron', 'Hawkswood', '1998-07-01 08:41:52'),
('Tamar', 'Mompesson', '1962-06-28 02:55:06'),
('Kingston', 'Christofides', '1976-11-15 03:22:22'),
('Nicholle', 'Depport', '1974-10-17 20:58:29'),
('Norri', 'Mountain', '1967-05-03 16:37:54'),
('Adelaide', 'Grossman', '2011-04-11 00:11:06'),
('Vannie', 'Fearnall', '1980-10-21 13:50:47'),
('Nyssa', 'Dent', '2010-02-06 15:09:01'),
('Tyrus', 'Peakman', '1956-02-03 20:27:38'),
('Stearne', 'Milburn', '1954-12-21 16:33:13'),
('Andrea', 'Hallford', '1984-08-09 13:54:39'),
('Kameko', 'Beddo', '1995-02-10 01:35:58'),
('Isaak', 'Rogez', '1969-11-29 23:55:08'),
('Darsey', 'Lindenman', '1953-08-25 11:06:34'),
('Julita', 'Hollington', '1978-11-19 14:02:54'),
('Tammie', 'Lamborn', '1946-12-03 15:21:59'),
('Normand', 'Phillip', '1953-03-24 21:12:25'),
('Pearla', 'McElvine', '1977-01-28 09:01:40'),
('Melinda', 'Baroch', '1962-11-16 11:30:01'),
('Ximenes', 'Hains', '2008-04-14 21:53:20'),
('Philomena', 'Reisk', '2013-08-24 09:35:07'),
('Izzy', 'Skyram', '1987-10-08 12:51:41'),
('Quintina', 'Vasyanin', '1965-03-20 21:54:53'),
('Kayne', 'Leander', '1971-05-04 12:51:10'),
('Maximilien', 'Labat', '2000-11-21 21:41:31'),
('Alison', 'Pittman', '1965-12-23 10:10:50'),
('Florella', 'Shillan', '1967-10-11 13:24:29')

SELECT * FROM Students

INSERT INTO StudentsLectures(StudentId, LectureId, NumberOfPaidInstallments, PaidAmountSoFar) VALUES
(1, 1, 0, 0),
(1, 2, 1, 500),
(1, 3, 2, 1000),
(1, 4, 2, 1000),
(1, 5, 2, 1000),
(1, 69, 1, 500),
(1, 70, 1, 500),
(2, 6, 0, 0),
(2, 8, 0, 0),
(2, 9, 0, 0),
(2, 10, 0, 0),
(3, 6, 1, 500),
(3, 7, 1, 500),
(3, 8, 1, 500),
(3, 9, 2, 1000),
(3, 10, 2, 1000),
(4, 2, 0, 0),
(5, 1, 0, 0),
(6, 1, 2, 1000),
(7, 11, 0, 0),
(7, 11, 0, 0),
(7, 11, 0, 0),
(7, 11, 0, 0),
(7, 11, 0, 0),
(8, 11, 0, 0),
(8, 11, 1, 500),
(8, 11, 0, 0),
(8, 11, 0, 0),
(8, 11, 0, 0),
(9, 12, 0, 0),
(9, 69, 2, 1000),
(10, 21, 0, 0),
(10, 22, 0, 0),
(10, 23, 0, 0),
(11, 21, 0, 0),
(11, 23, 0, 0),
(11, 28, 0, 0),
(12, 30, 1, 500),
(13, 29, 1, 500),
(14, 30, 0, 0),
(14, 40, 0, 0),
(15, 13, 0, 0),
(15, 14, 0, 0),
(15, 15, 0, 0),
(15, 25, 0, 0),
(15, 26, 0, 0),
(16, 15, 1, 500),
(16, 16, 1, 500),
(17, 16, 0, 0),
(20, 19, 0, 0), 
(20, 20, 0, 0),
(20, 29, 0, 0),
(20, 30, 0, 0),
(21, 32, 0, 0),
(22, 32, 1, 500),
(23, 36, 2, 1000),
(24, 52, 0, 0),
(25, 53, 0, 0),
(26, 60, 0, 0),
(26, 61, 0, 0),
(26, 62, 2, 1000),
(27, 66, 0, 0),
(28, 71, 0, 0),
(29, 71, 0, 0),
(30, 78, 0, 0),
(30, 79, 1, 500),
(30, 80, 1, 500)

SELECT * FROM StudentsLectures


/*raspored odrzavanja tecajeva u skoli za odredeni vremenski period*/
SELECT [Language], [Level], StartOfLecture
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
WHERE StartOfLecture BETWEEN '2021-10-01'AND '2021-10-10'
ORDER BY CourseLanguageId

/*raspored odrzavanja tecaja za pojedinu grupu polaznika za odredeni vremenski period*/
SELECT [Language], [Level], StartOfLecture
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
WHERE [Language] = 'engleski' AND [Level] = 'A1' AND StartOfLecture BETWEEN '2021-10-01'AND '2021-10-10'

/*raspored rada pojedinog nastavnika za odredeni vremenski period*/
SELECT [Language], [Level], StartOfLecture
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Teachers t ON tc.TeacherId = t.Id
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
WHERE t.Id = 1 AND StartOfLecture BETWEEN '2021-10-01'AND '2021-10-15'

/*izvjestaj za pojedinog polaznika za odredeni vremenski period, koji ukljucuje podatke o tecajevima stranih jezika koje slusa, 
stupnjevima koje je zavrsio, nastavnicima koji mu predaju, prisutnosti na nastavi te ratama koje je uplatio*/
SELECT [Language], [Level], t.FirstName, t.LastName, StartOfLecture, EndOfLecture, LectureId, NumberOfPaidInstallments, PaidAmountSoFar
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Teachers t ON tc.TeacherId = t.Id
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
WHERE s.Id = 9 AND StartOfLecture BETWEEN '2021-10-01'AND '2021-10-31'

/*izvjestaj o brojnosti polaznika i posjecenosti nastave na pojedinom tecaju u odreðenom vremenskom periodu*/
SELECT [Language], [Level], COUNT(sl.StudentId) AS 'Total number of students'
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Teachers t ON tc.TeacherId = t.Id
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
WHERE StartOfLecture BETWEEN '2021-10-01'AND '2021-10-10'
GROUP BY [Language], [Level]

/*pregled brojnosti polaznika na pojedinim tecajevima po starosnim skupinama*/
SELECT [Language], [Level],
	(SELECT CASE 
		WHEN DATEDIFF(YEAR, s.DateOfBirth, CAST(GETDATE() AS date)) <= 17 THEN N'uèenik'
		WHEN DATEDIFF(YEAR, s.DateOfBirth, CAST(GETDATE() AS date)) > 17 AND DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) <= 27 THEN 'student'
		WHEN DATEDIFF(YEAR, s.DateOfBirth, CAST(GETDATE() AS date)) > 27 AND DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) <= 66 THEN 'radnik'
		WHEN DATEDIFF(YEAR, s.DateOfBirth, CAST(GETDATE() AS date)) > 66 THEN 'penzioner'
	END) AS [Status], COUNT(*) AS 'Total number of students'
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
GROUP BY [Language], [Level], s.DateOfBirth
ORDER BY [Language]

/*ispis imena najstarijeg polaznika koji pohaða vise od dva jezika*/
SELECT TOP 1 CONCAT(s.FirstName , ' ' , s.LastName) AS 'Student', s.DateOfBirth
FROM StudentsLectures sl
JOIN Students s ON s.Id = sl.StudentId
GROUP BY s.Id, CONCAT(s.FirstName , ' ' , s.LastName), s.DateOfBirth
HAVING COUNT(*) >= 2
ORDER BY s.DateOfBirth ASC

/*sortiranje tecajeva po broju polaznika koji imaju manje od 20 godina*/
SELECT [Language], [Level]
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
WHERE DATEDIFF(YEAR, s.DateOfBirth, CAST(GETDATE() AS date)) < 20
GROUP BY [Language], [Level]
ORDER BY COUNT(s.Id) ASC

/*ispis statusa polaznika:
ucenik(za osobu mladu od 17 godina)
student(za osobu stariju od 18, a mladu od 27)
radnik(za osobu stariju od 28, a mladu od 66)
penzioner(za osobu stariju od 67)*/
SELECT Id, FirstName, LastName, DateOfBirth,
	(SELECT CASE 
		WHEN DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) <= 17 THEN N'uèenik'
		WHEN DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) > 17 AND DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) <= 27 THEN 'student'
		WHEN DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) > 27 AND DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) <= 66 THEN 'radnik'
		WHEN DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS date)) > 66 THEN 'penzioner'
	END) AS [Status]
FROM Students

/*ispis svih polaznika koji polazu bilo koji od tecajeva za odreden jezik*/
SELECT DISTINCT s.FirstName, s.LastName
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
WHERE [Language] = 'engleski'

/*ispis svih polaznika koji su bili u odredenoj ucionici*/
SELECT DISTINCT s.FirstName, s.LastName
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
JOIN Classrooms cl ON c.ClassroomId = cl.Id
WHERE ClassroomNumber = 103

/*ispis svih polaznika i nastavnika za zadanom jeziku*/
SELECT DISTINCT s.FirstName, s.LastName
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
JOIN StudentsLectures sl ON le.Id = sl.LectureId
JOIN Students s ON sl.StudentId = s.Id
WHERE [Language] = 'engleski'
UNION
SELECT DISTINCT FirstName, LastName
FROM Courses c
JOIN Languages la ON c.CourseLanguageId = la.Id
JOIN ProficiencyLevels p ON c.ProficiencyLevelId = p.Id
JOIN TeachersCourses tc ON c.Id = tc.CourseId
JOIN Teachers t ON tc.TeacherId = t.Id
JOIN Lectures le ON tc.Id = le.TeachersCoursesId
WHERE [Language] = 'engleski'