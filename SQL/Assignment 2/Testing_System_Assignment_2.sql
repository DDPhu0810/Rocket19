USE TestingSystem;
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
	DepartmenID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName	VARCHAR(20) UNIQUE KEY NOT NULL
    );
    
CREATE TABLE `Position`(
	PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
    );
    
CREATE TABLE `Account`(
	AcountID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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
    
-- INSERT RECORD
INSERT INTO Department(DepartmentName)
VALUES	('Sale'),
		('Marketing'),
        ('Security'),
        ('AI'),
        ('Test');

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
        ('jqk@gmail.com', 'jqk', 'tien jqk', 5, 1, '2021-08-27 23-00-00');
        
INSERT INTO `Group`(GroupName, CreatorID, CreateDate)
VALUES	('Group1', '1', '2022-08-29 07-00-00'),
		('Chua', '3', '2020-07-01 09-30-00'),
        ('Ngheo', '5', '2021-01-29 22-14-00'),
        ('Bip', '2', '2024-11-11 01-05-00'),
        ('Hay', '3', '2020-10-20 13-21-00');
	
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate)
VALUES	(1, 2, '2020-10-20 13-25-00'),
		(2, 4, '2021-08-08 03-15-00'),
        (3, 3, '2023-01-01 20-00-00'),
        (1, 5, '2020-12-12 12-25-00'),
        (5, 3, '2022-06-01 10-59-00');
	
INSERT INTO TypeQuestion(TypeName)
VALUES	('Essay'),
		('Essay'),
        ('Multiple-Choice'),
        ('Multiple-Choice'),
        ('Essay');
        
INSERT INTO CategoryQuestion(CategoryName)
VALUES	('Java'),
		('SQL'),
		('Postman'),
        ('Ruby'),
        ('JS');
        
INSERT INTO	Question(Content, CategoryID, TypeID, CreatorID, CreatDate)
VALUES	('insert convert', 1, 2, 3, '2022-06-01 10-59-00'),
		('filt covert', 2, 3, 4, '2021-01-05 21-11-00'),
        ('delete data', 3, 4, 5, '2020-12-06 12-50-00'),
        ('backup data', 4, 5, 2, '2022-02-02 01-59-00'),
        ('collect data', 5, 1, 2, '2023-06-06 13-59-00');

INSERT INTO Answer(Content, QuestionID, isCorrect)
VALUES	('insert success', 2, 'TRUE'),
		('1+1=2', 1, 'TRUE'),
        ('only only', 2, 'FALSE'),
        ('delete all', 3, 'FALSE'),
        ('abc xyz', 2, 'TRUE');
        
INSERT INTO Exam(`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES	(3, 'thi tot nghiep', 2, 90, 1, '2022-06-02 13-59-00'),
        (4, 'thi hoc phan', 1, 90, 4, '2021-01-01 08-00-00'),
		(4, 'thi tot nghiep', 2, 90, 1, '2022-06-02 14-00-00'),
        (1, 'thi dau vao', 5, 60, 5, '2020-11-06 11-12-00'),
        (5, 'thi thu', 3, 90, 3, '2022-02-14 22-59-00');
        
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES	(1, 2),
		(2, 3),
		(2, 4),
        (3, 5),
        (4, 1);
        
        