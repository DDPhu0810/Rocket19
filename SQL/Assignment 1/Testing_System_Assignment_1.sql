DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
	DepartmenID		INT,
    DepartmentName	VARCHAR(20)
    );
    
CREATE TABLE `Position`(
	PositionID		INT,
    PositionName	VARCHAR(20)
    );
    
CREATE TABLE `Account`(
	AcountID		INT,
    Email			VARCHAR(50),
    UserName		VARCHAR(10),
    FullName		VARCHAR(20),
    DepartmentID	INT,
    PositionID		INT,
    CreateDate		DATE
    );
    
CREATE TABLE `Group`(
	GroupID		INT,
    GroupName	VARCHAR(50),
    CreatorID	INT,
    CreateDate	DATE
    );
    
CREATE TABLE GroupAccount(
	GroupID		INT,
    AccountID	INT,
    JoinDate	DATE
	);
    
CREATE TABLE TypeQuestion(
	TypeID		INT,
    TypeName	VARCHAR(20)
);

CREATE TABLE CategoryQuestion(
	CategoryID		INT,
    CategoryName	VARCHAR(50)
    );
    
CREATE TABLE Question(
	QuestionID	INT,
    Content		VARCHAR(50),
    CategoryID	INT,
    TypeID		INT,
    CreatorID	INT,
    CreatDate	Date
    );
    
CREATE TABLE Answer(
	AnswerID	INT,
    Content		VARCHAR(50),
    QuestionID	INT,
    isCorrect	VARCHAR(10)
    );
    
CREATE TABLE EXAM(
	ExamID		INT,
    `Code`		INT,
    Title		VARCHAR(20),
	CategoryID	INT,
    Duration	DATETIME,
    CreatorID	INT,
    CreateDate	DATE
    );
    
CREATE	TABLE	ExamQuestion(
	ExamID		INT,
    QuestionID	INT);