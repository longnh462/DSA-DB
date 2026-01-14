select ranked.dName as Department, ranked.eName as Employee, ranked.salary as Salary
from 
(
    select e.id, e.name as eName, d.name as dName, e.salary as salary,
    dense_rank() over (Partition by d.id order by e.salary desc) as rank
    from employee e inner join department d on e.departmentId = d.id
) as ranked
where rank = 1