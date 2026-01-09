CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
    -- Write your PostgreSQL query statement below.
    IF N <= 0 then
        RETURN QUERY SELECT NULL::INT;  
    ELSE
     RETURN QUERY

        SELECT (
            SELECT DISTINCT e.salary
            FROM Employee e
            ORDER BY e.salary DESC
            LIMIT 1 OFFSET N - 1
        );
    END IF;
END;
$$ LANGUAGE plpgsql;