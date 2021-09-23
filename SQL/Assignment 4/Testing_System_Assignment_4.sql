USE TestingSystem;

-- Exercise 1: JOIN
-- Question 1
SELECT a.AccountID, a.Email, a.UserName, a.FullName, a.DepartmentID, a.PositionID, a.CreateDate, d.DepartmentName
FROM `Account` a
LEFT JOIN Department d ON a.DepartmentID=d.DepartmentID;

-- Question 2
SELECT * FROM `Account`
WHERE (YEAR(CreateDate)=2010 AND MONTH(CreateDate)>12 AND DAY(CreateDate)>20) OR YEAR(CreateDate)>2010;

-- Question 3
SELECT a.AccountID, a.Email, a.UserName, a.FullName, a.DepartmentID, a.PositionID, a.CreateDate, p.PositionName
FROM `Account` a
JOIN Position p ON a.PositionID=p.PositionID
WHERE p.PositionName='Dev';

-- Question 4
SELECT d.DepartmentID, d.DepartmentName
FROM Department d
JOIN `Account` a ON d.DepartmentID=a.DepartmentID
GROUP BY d.DepartmentID
HAVING COUNT(d.DepartmentID)>3;

-- Question 5
SELECT q.QuestionID
FROM Question q
JOIN ExamQuestion e ON q.QuestionID = e.QuestionID
GROUP BY q.QuestionID
HAVING COUNT(q.QuestionID)=(SELECT MAX(CS)
							FROM
								(SELECT QuestionID, COUNT(QuestionID) AS CS
								FROM ExamQuestion
								GROUP BY QuestionID) AS CountQuestion
							);

-- Question 6
SELECT c.CategoryID, COUNT(c.CategoryID) AS Used
FROM CategoryQuestion c
JOIN Question q ON c.CategoryID=q.CategoryID
GROUP BY c.CategoryID
HAVING COUNT(c.CategoryID);

-- Question 7
SELECT QuestionID, COUNT(ExamID) AS Used
FROM ExamQuestion
GROUP BY QuestionID;

-- Question 8
SELECT q.QuestionID
FROM Question q
JOIN Answer a ON q.QuestionID=a.QuestionID
GROUP BY q.QuestionID
HAVING COUNT(AnswerID)=(SELECT MAX(Answers)
						FROM	(SELECT q.QuestionID, COUNT(a.AnswerID) AS Answers
								FROM Question q
								JOIN Answer a ON q.QuestionID=a.QuestionID
								GROUP BY q.QuestionID) AS TongAnswer);

-- Question 9
SELECT GroupID, COUNT(AccountID) AS Accs
FROM GroupAccount
GROUP BY GroupID;

-- Question 10
SELECT p.PositionID
FROM Position p
JOIN `Account` a ON p.PositionID=a.PositionID
GROUP BY p.PositionID
HAVING COUNT(AccountID)=(SELECT MIN(Accs)
						FROM	(SELECT p.PositionID, COUNT(a.AccountID) AS Accs
								FROM Position p
								JOIN `Account` a ON p.PositionID=a.PositionID
								GROUP BY p.PositionID) AS SumAccs);
                                
-- Question 11
SELECT p.PositionName, COUNT(a.AccountID) AS Accs
FROM Position p
JOIN `Account` a ON p.PositionID=a.PositionID
GROUP BY p.PositionName;

-- Question 12
SELECT * FROM Question q
LEFT JOIN TypeQuestion tp USING (TypeID)
LEFT JOIN CategoryQuestion cq USING (CategoryID)
LEFT JOIN `Account` a ON q.CreatorID=a.AccountID
LEFT JOIN Answer ans USING (QuestionID);

-- Question 13
SELECT t.TypeName, COUNT(q.QuestionID)
FROM TypeQuestion t
JOIN Question q ON t.TypeID=q.TypeID
GROUP BY t.TypeName;

-- Question 14
SELECT GroupID
FROM GroupAccount
WHERE AccountID IS NULL;

-- Question 16
SELECT q.QuestionID
FROM Question q
LEFT JOIN Answer a ON q.QuestionID=a.QuestionID
WHERE a.Content IS NULL;

-- Exercise 2: UNION
-- Question 17
SELECT AccountID
FROM GroupAccount
WHERE GroupID=1
UNION
SELECT AccountID
FROM GroupAccount
WHERE GroupID=2;

-- Question 18
SELECT AccountID
FROM GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)>5
UNION ALL
SELECT AccountID
FROM GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)<7