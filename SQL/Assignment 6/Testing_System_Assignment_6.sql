USE TestingSystem;
-- SET GLOBAL log_bin_trust_function_creators = 1
-- Question 1
	-- PROCEDURE
DROP PROCEDURE IF EXISTS p_Question1;

DELIMITER $$
CREATE PROCEDURE p_Question1(IN in_DepartmentName VARCHAR(20))
BEGIN
	SELECT * FROM `Account` a
    JOIN Department d USING (DepartmentID)
    WHERE d.DepartmentName=in_DepartmentName;
END$$
DELIMITER ;

CALL p_Question1('Sale');

-- Question 2
DROP PROCEDURE IF EXISTS p_Question2;

DELIMITER $$
CREATE PROCEDURE p_Question2( OUT out_GroupID TINYINT UNSIGNED, out_CountAcc TINYINT UNSIGNED)
BEGIN
	SELECT GroupID, COUNT(AccountID)  FROM GroupAccount
	GROUP BY GroupID;
END$$
DELIMITER ;

CALL p_Question2(@GroupID, @CountAcc);

-- Question 3
	-- PROCEDURE
DROP PROCEDURE IF EXISTS p_Question3;

DELIMITER $$
CREATE PROCEDURE p_Question3 (IN in_Month TINYINT UNSIGNED, in_Year INT UNSIGNED)
BEGIN
	SELECT tq.TypeID, tq.TypeName, COUNT(QuestionID) AS CountQuestion
    FROM Question q
    JOIN TypeQuestion tq USING (TypeID)
    WHERE q.CreatDate IN	(SELECT q.CreatDate
							FROM Question q
							JOIN TypeQuestion tq USING (TypeID)
							HAVING MONTH(q.CreatDate)=in_Month) AND YEAR(q.CreatDate)=(in_Year)
	GROUP BY tq.TypeID;
END$$
DELIMITER ;

CALL p_Question3(Month(now()),Year(now()));

-- Question 4
	-- PROCEDURE
DROP VIEW IF EXISTS v_p_Question4;

CREATE VIEW v_p_Question4 AS	SELECT tq.TypeID, COUNT(QuestionID) AS CountQuestion
								FROM TypeQuestion tq
								JOIN Question q USING (TypeID)
								GROUP BY tq.TypeID;

DROP PROCEDURE IF EXISTS p_Question4;

DELIMITER $$
CREATE PROCEDURE p_Question4 (OUT out_TypeID TINYINT UNSIGNED)
BEGIN
	SELECT TypeID INTO out_TypeID FROM v_p_Question4
	WHERE CountQuestion = ( SELECT MAX(CountQuestion) FROM v_p_Question4);
END$$
DELIMITER ;

CALL p_Question4(@TypeID);
SELECT @TypeID;

	-- FUNCTION
DROP FUNCTION IF EXISTS f_Question4;

DELIMITER $$
CREATE FUNCTION f_Question4 () RETURNS TINYINT UNSIGNED
BEGIN
	DECLARE v_TypeID TINYINT UNSIGNED;
	SELECT TypeID INTO v_TypeID
	FROM v_p_Question4
    WHERE CountQuestion = (SELECT MAX(CountQuestion) FROM v_p_Question4);
    RETURN v_typeID;
END$$
DELIMITER ;

SELECT f_Question4();

-- Question 5
	-- USE PROCEDURE Question 4
SELECT TypeName FROM TypeQuestion
WHERE TypeID=@typeID;

	-- USE FUNCTION Question 4
SELECT TypeName FROM TypeQuestion
WHERE TypeID=(SELECT f_Question4());

-- Question 6
	-- PROCEDURE
DROP PROCEDURE IF EXISTS p_Question6;

DELIMITER $$
CREATE PROCEDURE p_Question6 (IN in_String VARCHAR(20))
BEGIN
SELECT GroupName FROM `Group`
WHERE GroupName LIKE CONCAT("%",in_String,"%")
UNION ALL
SELECT UserName FROM `Account`
WHERE UserName LIKE CONCAT("%",in_String,"%");
END$$
DELIMITER ;

CALL p_Question6('a');

-- Question 7
DROP PROCEDURE IF EXISTS p_Question7;

DELIMITER $$
CREATE PROCEDURE p_Question7(IN in_FullName VARCHAR(50), in_Email VARCHAR(50))
BEGIN
DECLARE var_UserName VARCHAR(50);
DECLARE var_PositionID TINYINT UNSIGNED DEFAULT '11';
DECLARE var_DepartmentID TINYINT UNSIGNED DEFAULT '0';
DECLARE var_CreateDate DATETIME DEFAULT now();
SET var_UserName=SUBSTRING_INDEX(in_Email, '@', 1);
INSERT INTO `Account`(Email, UserName, FullName, DepartmentID, PositionID, CreateDate)
VALUES	(in_Email, var_UserName, in_FullName, var_DepartmentID, var_PositionID, var_CreateDate);
END$$
DELIMITER ;

BEGIN WORK;
CALL p_Question7('rim','rim0209@gmail.com');
ROLLBACK;
-- Question 8
DROP VIEW IF EXISTS v_p_Question8;
CREATE VIEW v_p_Question8 AS	SELECT *, LENGTH(Content) AS L_Content FROM TypeQuestion tq
								JOIN Question q USING (TypeID)
                                GROUP BY TypeName;
                                
DROP PROCEDURE IF EXISTS p_Question8;

DELIMITER $$
CREATE PROCEDURE p_Question8 (IN in_TypeName VARCHAR(50))
BEGIN
IF in_TypeName='Multiple-Choice' THEN
SELECT * FROM v_p_Question8
WHERE TypeName=in_TypeName;
ELSEIF in_TypeName='Essay' THEN
SELECT * FROM v_p_Question8
WHERE TypeName=in_TypeName;
END IF;
END$$
DELIMITER ;

CALL p_Question8('Essay');

-- Question 9
	-- PROCEDURE
DROP PROCEDURE IF EXISTS p_Question9;

DELIMITER $$
CREATE PROCEDURE p_Question9(IN in_ExamID TINYINT UNSIGNED)
BEGIN
DELETE FROM Exam
WHERE ExamID=in_ExamID;
END$$
DELIMITER ;

BEGIN WORK;
CALL p_Question9(1);
ROLLBACK;

-- Question 10
DROP PROCEDURE IF EXISTS p_Question10;

DELIMITER $$
CREATE PROCEDURE p_Question10()
BEGIN
DECLARE var_CountDel TINYINT UNSIGNED;
DECLARE var_IDDel TINYINT UNSIGNED;
DECLARE var_Print VARCHAR(100);
DECLARE i TINYINT UNSIGNED DEFAULT 1;
	DROP TABLE IF EXISTS DelExam;
    CREATE TABLE DelExam	(ID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
							ExamID TINYINT UNSIGNED);
	INSERT INTO DelExam(ExamID) SELECT e.ExamID FROM Exam e
								WHERE YEAR(now())-YEAR(e.CreateDate) >= 3;
    SELECT COUNT(ExamID) INTO var_CountDel FROM DelExam;
    WHILE(i<= var_CountDel) DO
    SELECT ExamID INTO var_IDDel From DelExam
    WHERE ID=i;
    CALL p_Question9(var_IDDel);
    SET i=i+1;
    END WHILE;
    SELECT CONCAT('DELETE',' ',var_CountDel,' ','IN TABLE EXAM');
    /* SELECT CONCAT('DELETE',var_CountDel,'IN TABLE EXAM') INTO var_Print;
    signal sqlstate '45000' set message_text = var_Print;*/
END$$
DELIMITER ;

BEGIN WORK;
CALL p_Question10;
ROLLBACK;
SELECT * FROM Exam;
-- Question 11
DROP PROCEDURE IF EXISTS p_Question11;

DELIMITER $$
CREATE PROCEDURE p_Question11(IN in_DepartmentName VARCHAR(50))
BEGIN
UPDATE `Account`
SET DepartmentID=0
WHERE DepartmentID=(SELECT DepartmentID
					FROM Department
					WHERE DepartmentName=in_DepartmentName);
DELETE FROM Department
WHERE DepartmentName=in_DepartmentName;
END$$
DELIMITER ;

BEGIN WORK;
CALL p_Question11('Sale');
ROLLBACK;
-- Question 12
DROP PROCEDURE IF EXISTS p_Question12;

DELIMITER $$
CREATE PROCEDURE p_Question12()
BEGIN
WITH cte_Month AS ( SELECT 1 AS MONTH
					UNION SELECT 2 AS MONTH
					UNION SELECT 3 AS MONTH
					UNION SELECT 4 AS MONTH
					UNION SELECT 5 AS MONTH
					UNION SELECT 6 AS MONTH
					UNION SELECT 7 AS MONTH
					UNION SELECT 8 AS MONTH
					UNION SELECT 9 AS MONTH
					UNION SELECT 10 AS MONTH
					UNION SELECT 11 AS MONTH
					UNION SELECT 12 AS MONTH )
SELECT `Month`, COUNT(QuestionID)  AS CountQID
FROM( SELECT * FROM cte_Month m
LEFT JOIN Question q ON m.`Month`= Month(q.CreatDate)) AS q
GROUP BY `Month`;
END$$
DELIMITER ;

CALL p_Question12;
-- Question 13
DROP PROCEDURE IF EXISTS p_Question13;

DELIMITER $$
CREATE PROCEDURE p_Question13()
BEGIN
WITH cte_Month AS ( SELECT month(now()) AS `Month`, year(now()) AS `Year`
					UNION
					SELECT month(date_sub(now(), interval 1 month)), year(date_sub(now(),interval 1 month))
					UNION
					SELECT month(date_sub(now(), interval 2 month)), year(date_sub(now(),interval 2 month))
					UNION
					SELECT month(date_sub(now(), interval 3 month)), year(date_sub(now(),interval 3 month))
					UNION
					SELECT month(date_sub(now(), interval 4 month)), year(date_sub(now(),interval 4 month))
					UNION
					SELECT month(date_sub(now(), interval 5 month)), year(date_sub(now(),interval 5 month)))
SELECT `Month`, `Year`, IF(COUNT(QuestionID)=0,'không có câu hỏi nào trong tháng',COUNT(QuestionID) )  AS CountQID
FROM( SELECT * FROM cte_Month m
LEFT JOIN Question q ON m.`Month`= Month(q.CreatDate)) AS q
GROUP BY `Month`;
END$$
DELIMITER ;

CALL p_QUestion13;
