USE TestingSystem;

-- Question 1
		-- VIEW
DROP VIEW IF EXISTS v_Question1;

CREATE VIEW v_Question1 AS	SELECT * FROM Department d
							JOIN `Account` a USING (DepartmentID)
							WHERE d.DepartmentName='Sale';

SELECT * FROM  v_Question1;

	-- CTE
WITH cte_Question1 AS	(SELECT * FROM Department
						JOIN `Account` a USING (DepartmentID)) 
						
SELECT * FROM cte_Question1
WHERE DepartmentName='Sale';
    
-- Question 2
	-- VIEW
DROP VIEW IF EXISTS v_Question2;

CREATE VIEW v_Question2 AS	SELECT ga.AccountID, COUNT(ga.AccountID) AS Accs
							FROM GroupAccount ga
							JOIN `Account` a USING (AccountID)
							GROUP BY ga.AccountID;
			
SELECT * FROM v_Question2
WHERE Accs=(SELECT MAX(Accs) FROM v_Question2);

	-- CTE
WITH cte_Question2 AS ( SELECT * FROM v_Question2 
						WHERE Accs=(SELECT MAX(Accs) FROM v_Question2))
                        
SELECT * FROM cte_Question2;

-- Question 3
	-- VIEW
DROP VIEW IF EXISTS v_Question3;

CREATE VIEW v_Question3 AS  SELECT * FROM Question
							HAVING LENGTH(Content)<5;
                            
BEGIN WORK;

DELETE FROM Question
WHERE QuestionID IN ( SELECT QuestionID FROm v_Question3);

ROLLBACK;

	-- CTE
BEGIN WORK;

WITH cte_Question3 AS ( SELECT QuestionID FROM v_Question3)

DELETE FROM Question
WHERE QuestionID=(SELECT QuestionID FROM cte_question3);

ROLLBACK;

-- Question 4
	-- VIEW
DROP VIEW IF EXISTS v_Question4;

CREATE VIEW v_Question4 AS SELECT *, COUNT(a.AccountID) AS Accs FROM Department d
							JOIN `Account` a USING (DepartmentID)
							GROUP BY d.DepartmentName
							HAVING COUNT(a.AccountID);

SELECT * FROM v_Question4 
WHERE Accs=(SELECT MAX(Accs) FROM v_Question4);

	-- CTE
WITH cte_Question4 AS ( SELECT * FROM v_Question4)

SELECT * FROM cte_Question4
WHERE Accs=(SELECT MAX(Accs) FROM cte_Question4);

-- Question 5
	-- VIEW
DROP VIEW IF EXISTS v_Question5;

CREATE VIEW v_Question5 AS	SELECT * FROM Question q
							JOIN `Account` a ON q.CreatorID=a.AccountID;

SELECT QuestionID, Content, CategoryID, TypeID, CreatorID, CreatDate
FROM v_Question5
WHERE FullName LIKE 'Nguyễn%';

	-- CTE
WITH cte_Question5 AS ( SELECT * FROM v_Question5)

SELECT QuestionID, Content, CategoryID, TypeID, CreatorID, CreatDate
FROM cte_Question5
WHERE FullName LIKE 'Nguyễn%';


    

    