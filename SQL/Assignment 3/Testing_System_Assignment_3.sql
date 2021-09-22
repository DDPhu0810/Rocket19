DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
	DepartmentID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName	VARCHAR(20) UNIQUE KEY NOT NULL
    );
    
CREATE TABLE `Position`(
	PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
    );
    
CREATE TABLE `Account`(
	AccountID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email			VARCHAR(50) UNIQUE KEY NOT NULL,
    UserName		VARCHAR(20) UNIQUE KEY NOT NULL,
    FullName		VARCHAR(20) NOT NULL,
    DepartmentID	TINYINT REFERENCES Department(DepatmentID),
    PositionID		TINYINT REFERENCES `Position`(PositionName),
    CreateDate		DATETIME DEFAULT NOW()
    );
    
CREATE TABLE `Group`(
	GroupID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName	VARCHAR(50) UNIQUE KEY NOT NULL,
    CreatorID	TINYINT REFERENCES `Account`(AcountID),
    CreateDate	DATETIME DEFAULT NOW()
    );
    
CREATE TABLE GroupAccount(
	GroupID		TINYINT REFERENCES `Group`(GroupID),
    AccountID	TINYINT REFERENCES `Account`(AccountID),
    JoinDate	DATETIME DEFAULT NOW()
	);
    
CREATE TABLE TypeQuestion(
	TypeID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName	ENUM('Essay', 'Multiple-Choice')
);

CREATE TABLE CategoryQuestion(
	CategoryID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName	VARCHAR(20) NOT NULL
    );
    
CREATE TABLE Question(
	QuestionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content		VARCHAR(50) NOT NULL,
    CategoryID	TINYINT REFERENCES CategoryQuestion(CategoryID),
    TypeID		TINYINT REFERENCES TypeQuestion(TypeID),
    CreatorID	TINYINT REFERENCES `Account`(AccounID),
    CreatDate	DATETIME DEFAULT NOW()
    );
    
CREATE TABLE Answer(
	AnswerID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content		VARCHAR(50) NOT NULL,
    QuestionID	TINYINT REFERENCES Question(QuestionID),
    isCorrect	ENUM('TRUE', 'FALSE')
    );
    
CREATE TABLE Exam(
	ExamID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`		TINYINT NOT NULL,
    Title		VARCHAR(20) NOT NULL,
	CategoryID	TINYINT REFERENCES CategoryQuestion(CategoryID),
    Duration	TINYINT NOT NULL,
    CreatorID	TINYINT REFERENCES `Account`(AccountID),
    CreateDate	DATETIME DEFAULT NOW()
    );
    
CREATE	TABLE	ExamQuestion(
	ExamID		TINYINT REFERENCES Exam(ExamID),
    QuestionID	TINYINT REFERENCES Question(QuestionID)
    );
    
-- Question 1
INSERT INTO Department(DepartmentName)
VALUES	('Sale'),
		('Marketing'),
        ('Security'),
        ('AI'),
        ('Test'),
        ('Data'),
        ('AI2'),
        ('Event'),
        ('Test2'),
        ('Loading');

INSERT INTO `Position`(PositionName)
VALUES	('Dev'),
		('Test'),
		('Scrum Master'),
		('Dev'),
        ('PM');
        
INSERT INTO `Account`(Email, UserName, FullName, DepartmentID, PositionID, CreateDate)
VALUES	('phu08102000@gmail.com', 'phu0810', 'Duong Doan Phu', 1, 2, '2020-12-22 12-22-00'),
		('phu0810@gmail.com', 'phu2000', 'Duong Phu', 2, 3, '2020-01-22 1-22-00'),
        ('abcx@gmail.com', 'abcx', 'nguyen abc', 3, 4, '2019-12-31 05-00-00'),
        ('azza@gmail.com', 'azza', 'hoang az', 4, 5, '2010-02-05 15-14-13'),
        ('jqk@gmail.com', 'jqk', 'tien jqk', 5, 1, '2021-08-27 23-00-00'),
        ('vti@gmail.com', 'vti', 'vti vti', 6, 1, '2021-08-27 23-00-00'),
        ('onlyu@gmail.com', 'onlyu', 'only u', 7, 2, '2022-03-12 11-00-00'),
        ('nohope@gmail.com', 'nohope', 'no hope', 8, 3, '2021-01-15 02-02-00'),
        ('nobrain@gmail.com', 'nobrain', 'no brain', 9, 2, '2022-09-29 03-00-00'),
        ('hongthatcong@gmail.com', 'hongthatcong', 'hong that cong', 10, 4, '2020-05-25 15-15-00');
        
INSERT INTO `Group`(GroupName, CreatorID, CreateDate)
VALUES	('Group1', '1', '2022-08-29 07-00-00'),
		('Chua', '3', '2020-07-01 09-30-00'),
        ('Ngheo', '5', '2021-01-29 22-14-00'),
        ('Bip', '2', '2019-11-11 01-05-00'),
        ('Hay', '3', '2020-10-20 13-21-00'),
        ('Nhan Su', '6', '2022-12-20 12-21-00'),
        ('Phat trien', '8', '2021-11-21 11-11-00'),
        ('Quan tri', '7', '2020-05-25 15-25-00'),
        ('The thao', '9', '2020-10-20 13-25-00'),
        ('Cheff', '10', '2018-01-21 17-11-00');
	
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate)
VALUES	(1, 2, '2020-10-20 13-25-00'),
		(2, 4, '2021-08-08 03-15-00'),
        (3, 3, '2019-01-01 20-00-00'),
        (1, 5, '2020-12-12 12-25-00'),
        (5, 3, '2022-06-01 10-59-00'),
        (6, 10, '2021-02-01 11-59-00'),
        (7, 7, '2020-08-08 09-59-00'),
        (8, 9, '2022-04-24 14-19-00'),
        (9, 6, '2021-01-20 08-00-00'),
        (10, 8, '2022-11-21 21-12-00');
	
INSERT INTO TypeQuestion(TypeName)
VALUES	('Essay'),
        ('Multiple-Choice');
        
INSERT INTO CategoryQuestion(CategoryName)
VALUES	('Java'),
		('SQL'),
		('Postman'),
        ('Ruby'),
        ('JS'),
        ('CSS'),
        ('C'),
        ('C+'),
        ('C++'),
        ('C#');
        
INSERT INTO	Question(Content, CategoryID, TypeID, CreatorID, CreatDate)
VALUES	('insert convert', 1, 2, 3, '2022-06-01 10-59-00'),
		('filt covert', 2, 1, 4, '2021-01-05 21-11-00'),
        ('delete data', 3, 1, 5, '2020-12-06 12-50-00'),
        ('backup data', 4, 2, 2, '2022-02-02 01-59-00'),
        ('collect data', 5, 1, 2, '2023-06-06 13-59-00'),
        ('collect server', 6, 2, 1, '2021-01-06 11-51-00'),
        ('test', 6, 2, 6, '2022-02-06 12-29-00'),
        ('delete server', 7, 2, 7, '2022-02-06 13-52-00'),
        ('create object', 8, 1, 8, '2023-02-03 03-00-00'),
        ('delete object', 10, 1, 9, '2021-06-01 11-11-00');

INSERT INTO Answer(Content, QuestionID, isCorrect)
VALUES	('insert success', 2, 'TRUE'),
		('1+1=2', 1, 'TRUE'),
        ('only only', 2, 'FALSE'),
        ('delete all', 3, 'FALSE'),
        ('select all', 4, 'TRUE'),
        ('update', 5, 'FALSE'),
        ('drop', 6, 'TRUE'),
        ('insert', 7, 'TRUE'),
        ('code', 8, 'FALSE'),
        ('create table', 9, 'TRUE');
        
INSERT INTO Exam(`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES	(3, 'thi tot nghiep', 2, 90, 1, '2022-06-02 13-59-00'),
        (4, 'thi hoc phan', 1, 90, 4, '2021-01-01 08-00-00'),
		(4, 'thi tot nghiep', 2, 90, 1, '2022-06-02 14-00-00'),
        (1, 'thi dau vao', 5, 60, 5, '2020-11-06 11-12-00'),
        (5, 'thi thu', 3, 90, 3, '2019-02-14 22-59-00'),
        (6, 'thi thu', 3, 90, 4, '2022-02-14 20-00-00'),
        (7, 'thi tot nghiep', 7, 120, 6, '2021-02-11 12-19-00'),
        (8, 'thi giua ki', 8, 90, 7, '2020-08-18 18-50-00'),
        (9, 'thi 15p', 10, 15, 8, '2022-02-22 02-00-00'),
        (10, 'thi 1 tiet', 6, 45, 10, '2022-09-19 17-51-00');
        
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES	(1, 2),
		(2, 3),
		(2, 4),
        (3, 5),
        (4, 1),
        (5, 1),
        (6, 5),
        (7, 9),
        (8, 8),
        (9, 10);

-- Question 2
SELECT DepartmentName FROM Department
ORDER BY DepartmentName;

-- Question 3
SELECT DepartmentID FROM Department
WHERE DepartmentName='Sale';

-- Question 4
SELECT * FROM `Account`
WHERE LENGTH(FullName)=(SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- Question 5
SELECT * FROM `Account`
JOIN Department ON `Account`.DepartmentID=Department.DepartmentID
WHERE LENGTH(FullName)=(SELECT MAX(LENGTH(FullName)) FROM `Account`) AND Department.DepartmentID=3;

-- Question 6
SELECT GroupName FROM `Group`
WHERE DAY(CreateDate)<20 AND MONTH(CreateDate)<=12 AND YEAR(CreateDate)<=2019;

-- Question 7
SELECT Question.QuestionID FROM Question
JOIN Answer ON Question.QuestionID=Answer.QuestionID
Group By Question.QuestionID 
HAVING COUNT(Question.QuestionID)>=4;

-- Question 8
SELECT `Code` FROM Exam
WHERE Duration>=60 AND DAY(CreateDate)<20 AND MONTH(CreateDate)<=12 AND YEAR(CreateDate)<=2019;

-- Question 9
SELECT * FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10
SELECT COUNT(AccountID) FROM `Account`
JOIN Department ON `Account`.DepartmentID=Department.DepartmentID
WHERE `Account`.DepartmentID=2;

-- Question 11
SELECT FullName FROM `Account`
WHERE FullName LIKE "D%" AND "%o";

-- Question 12
DELETE FROM Exam
WHERE DAY(CreateDate)<20 AND MONTH(CreateDate)<=12 AND YEAR(CreateDate)<=2019;

-- Question 13
DELETE FROM Question
WHERE Content="câu hỏi";

-- Question 14
UPDATE `Account`
SET Email = 'loc.nguyenba@vti.com', FullName = 'Nguyễn Bá Lộc'
WHERE AccountID=5;

-- Question 15
UPDATE GroupAccount
SET GroupID=4
WHERE AccountID=5;


UPDATE GroupAccount
RIGHT JOIN `Account` ON GroupAccount.AccountID = `Account`.AccountID
SET GroupID=4
WHERE GroupAccount.AccountID=5;

