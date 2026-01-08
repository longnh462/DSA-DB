SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;


select max(salary) as SecondHighestSalary
from Employee
where salary < (select Max(salary) from Employee)