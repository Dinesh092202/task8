# SQL Developer Internship  
## Task 8: Stored Procedures and Functions  

### 🎯 Objective  
Learn to modularize SQL logic using **stored procedures** and **functions**.  

### 🛠 Tools  
- DB Browser for SQLite  
- MySQL Workbench  

---

## 📂 Files  

- `schema.sql` → Contains table creation statements.  
- `procedures_functions.sql` → Contains stored procedure and function.  
- `ER_Diagram.png` → Entity Relationship diagram (for better understanding).  

---

## ✅ Step 1: Schema (Tables)  

```sql
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);
```

---

## ✅ Step 2: Stored Procedure  

```sql
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
```

**Usage**:  

```sql
CALL IncreaseSalaryByDept('IT', 10);
```

---

## ✅ Step 3: Stored Function  

```sql
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
```

**Usage**:  

```sql
SELECT GetAnnualSalary(101);
```

---

## 📊 Outcome  

- Created tables for Employees & Departments.  
- Implemented a **stored procedure** to increase salaries by department.  
- Implemented a **stored function** to calculate annual salary of an employee.  
- Gained experience in **modular SQL development**.  

---

✅ Task 8 Completed 🚀
