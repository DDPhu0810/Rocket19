USE TestingSystem;
-- Question 1
DROP TRIGGER IF EXISTS tg_Question1;

DELIMITER $$
CREATE TRIGGER tg_Question1
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
	IF (NEW.CreateDate < date_sub(now(), interval 1 Year)) THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'createDate khong dung';
        END IF;
END$$
DELIMITER ;

INSERT INTO `GROUP` (`GroupName`, `CreatorID`, `CreateDate`)
VALUES ('a', '11', '2020-09-24');

-- Question 2
DROP TRIGGER IF EXISTS tg_Question2;

DELIMITER $$
CREATE TRIGGER tg_Question2
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	IF(NEW.DepartmentID=(SELECT DepartmentID FROM `Account` a
						JOIN Department d USING (DepartmentID)
                        WHERE d.DepartmentName='Sale'))
	THEN
    SIGNAL SQLSTATE '12223'
    SET MESSAGE_TEXT='"Department "Sale" cannot add more user"';
    END IF;
END$$
DELIMITER ;

INSERT INTO `Account` (Email, UserName, DepartmentID, PositionID, CreateDate)
VALUES ('vti1@gmail.com', 'vti1 vti1', '1', '1', '2021-08-27 23:00:00');

-- Question 3
DROP VIEW IF EXISTS v_Question3; 
CREATE VIEW v_Question3 AS SELECT GroupID, COUNT(AccountID) AS CountAcc FROM GroupAccount
							GROUP BY GroupID;
DROP TRIGGER IF EXISTS tg_Question3;

DELIMITER $$
CREATE TRIGGER tg_Question3
BEFORE INSERT ON GroupAccount
FOR EACH ROW
BEGIN
IF (NEW.GroupID IN (SELECT GroupID FROM v_Question3) AND (SELECT CountAcc FROM v_Question3
															WHERE GroupID=NEW.GroupID)>=5)
THEN
	SIGNAL SQLSTATE '12121'
    SET MESSAGE_TEXT='MAX User on each Group is 5';
END IF;
END$$
DELIMITER ;

BEGIN WORK;
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES (1, 3, '2021-08-27 23:00:00');
ROLLBACK;

-- Question 4
DROP VIEW IF EXISTS v_Question4; 
CREATE VIEW v_Question4 AS SELECT ExamID, COUNT(QuestionID) AS CountQuestion FROM ExamQuestion
							GROUP BY ExamID;
DROP TRIGGER IF EXISTS tg_Question4;

DELIMITER $$
CREATE TRIGGER tg_Question4
BEFORE INSERT ON ExamQuestion
FOR EACH ROW
BEGIN
IF ((SELECT CountQuestion FROM v_Question4 WHERE ExamID=NEW.ExamID)>=10)
THEN
	SIGNAL SQLSTATE '12122'
    SET MESSAGE_TEXT='MAX Question on each Exam is 10';
END IF;
END$$
DELIMITER ;

BEGIN WORK;
INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES (1, 3);
ROLLBACK;

-- Question 5
DROP TRIGGER IF EXISTS tg_Question5;

DELIMITER $$
CREATE TRIGGER tg_Question5
BEFORE DELETE ON `Account`
FOR EACH ROW
BEGIN
	IF(OLD.Email='admin@gmail.com') THEN
    SIGNAL SQLSTATE '12134'
    SET MESSAGE_TEXT='It is Admin, Use cannot delete it';
    END IF;
END$$
DELIMITER ;

BEGIN WORK;
DELETE FROM `Account`
WHERE Email='admin@gmail.com';
ROLLBACK;

-- Question 6
DROP TRIGGER IF EXISTS tg_Question6;

DELIMITER $$
CREATE TRIGGER tg_Question6
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	IF(NEW.DepartmentID IS NULL)
    THEN SET NEW.DepartmentID = 0;
    END IF;
END$$
DELIMITER ;

BEGIN WORK;
INSERT INTO `Account`(Email, UserName, FullName, PositionID, CreateDate)
VALUES('phu0209@gmail.com', 'phu0209', 'Duong Doan Phuha', 2, '2020-12-22 12:22:00');
ROLLBACK;

-- Question 7
DROP VIEW IF EXISTS v_Question7; 
CREATE VIEW v_Question7 AS	SELECT QuestionID, COUNT(AnswerID) AS CountAnswer 
							FROM Answer
							GROUP BY QuestionID;
DROP TRIGGER IF EXISTS tg_Question7;

DELIMITER $$
CREATE TRIGGER tg_Question7
BEFORE INSERT ON Answer
FOR EACH ROW
BEGIN
DECLARE var_CountisCorrect TINYINT UNSIGNED;
SELECT COUNT(isCorrect) INTO var_CountisCorrect
FROM Answer
WHERE QuestionID=NEW.QuestionID AND isCorrect=New.isCorrect
GROUP BY isCorrect;
IF ((SELECT CountAnswer FROM v_Question7 WHERE QuestionID=NEW.QuestionID)>=4
	OR var_CountisCorrect>=2)
THEN
	SIGNAL SQLSTATE '12129'
    SET MESSAGE_TEXT='MAX Answer on each Question is 10 and MAX isCorrect is 2';
END IF;
END$$
DELIMITER ;

BEGIN WORK;
INSERT INTO Answer (AnswerID, Content, QuestionID, isCorrect)
VALUES (11,'1', 2, 'TRUE');
ROLLBACK;

-- Question 8
DROP TRIGGER IF EXISTS tg_Question8;

DELIMITER $$
CREATE TRIGGER tg_Question8
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	IF(NEW.Gender='Nam') THEN
    SET NEW.Gender='M';
    ELSEIF(NEW.Gender='Nu') THEN
    SET NEW.Gender='F';
    ELSEIF(NEW.Gender='Chưa xác định') THEN
    SET NEW.Gender='U';
    END IF;
END$$;
DELIMITER ;

-- Question 9
DROP TRIGGER IF EXISTS tg_Question9;

DELIMITER $$
CREATE TRIGGER tg_Question9
BEFORE DELETE ON Exam
FOR EACH ROW
BEGIN
	IF(OLD.CreateDate > DATE_SUB(now(), INTERVAL 2 DAY)) THEN
    SIGNAL SQLSTATE '21202'
    SET MESSAGE_TEXT='You cannot delete Exam';
    END IF;
END$$;
DELIMITER ;

BEGIN WORK;
DELETE FROM Exam WHERE ExamID=11;
ROLLBACK;

-- Question 10
		-- UPDATE
DROP TRIGGER IF EXISTS tg_Question10;

DELIMITER $$
CREATE TRIGGER tg_Question10
BEFORE UPDATE ON Question
FOR EACH ROW
BEGIN

	IF(NEW.QuestionID NOT IN (SELECT QuestionID FROM Question
LEFT JOIN ExamQuestion USING (QuestionID)
WHERE ExamID IS NULL)) THEN
    SIGNAL SQLSTATE '21203'
    SET MESSAGE_TEXT='You cannot update Question';
    END IF;
END$$;
DELIMITER ;

BEGIN WORK;
UPDATE  Question
SET QuestionID=11
WHERE QuestionID=2;
ROLLBACK;

		-- DELETE

DROP TRIGGER IF EXISTS tg_Question10;

DELIMITER $$
CREATE TRIGGER tg_Question10
BEFORE DELETE ON Question
FOR EACH ROW
BEGIN
DECLARE var_CountQuestion TINYINT UNSIGNED;
SELECT Count(QuestionID) INTO var_CountQuestion FROM ExamQuestion
WHERE QuestionID=OLD.QuestionID;
	IF var_CountQuestion>=1 THEN
	SIGNAL SQLSTATE '21203'
    SET MESSAGE_TEXT='You cannot update Question';
    END IF;
END$$;
DELIMITER ;

BEGIN WORK;
DELETE FROM  Question
WHERE QuestionID=2;
ROLLBACK;

-- Question 11
SELECT	ExamID, `Code`, Title, CategoryID, 
		CASE 
        WHEN Duration<=30 THEN 'Short time'
        WHEN Duration<=60 THEN 'Medium time'
        ELSE 'Long time' END AS Duration, CreatorID, CreateDate FROM Exam;

--  Question 12
SELECT	COUNT(AccountID) AS CountAcccountID,
		CASE WHEN COUNT(AccountID)<=5 THEN 'few'
        WHEN COUNT(AccountID)<=20 THEN'normal'
        ELSE 'higher' END AS the_number_user_amount
FROM GroupAccount
GROUP BY GroupID;

-- Question 13
SELECT d.DepartmentID, CASE WHEN COUNT(AccountID)=0 THEN 'Không có User'
					ELSE COUNT(AccountID) END AS CountUser
FROM Department d
LEFT JOIN `Account` a USING (DepartmentID)
GROUP BY d.DepartmentID;