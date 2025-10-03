-- Stored Procedure
DELIMITER $$

CREATE PROCEDURE IncreaseSalaryByDept (
    IN deptName VARCHAR(50),
    IN percentage DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * (percentage / 100))
    WHERE Department = deptName;
END $$

DELIMITER ;

-- Stored Function
DELIMITER $$

CREATE FUNCTION GetAnnualSalary (
    emp_id INT
) RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE annual_salary DECIMAL(12,2);
    SELECT Salary * 12 INTO annual_salary
    FROM Employees
    WHERE EmpID = emp_id;
    RETURN annual_salary;
END $$

DELIMITER ;
