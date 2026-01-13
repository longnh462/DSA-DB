-- Write your PostgreSQL query statement below
select distinct l1.num as ConsecutiveNums
from Logs l1 
inner join Logs l2 on l1.id = l2.id-1
inner join Logs l3 on l1.id = l3.id+1
where l1.num = l2.num and l1.num = l3.num

-- Use CTE
with ConsecutiveNums AS (
    select 
        num, 
        lead(num) over (order by id) as next_num,
        lag(num) over (order by id) as prev_num
    from Logs l1
)
select distinct num
from ConsecutiveNums
where num = next_num and num = prev_num;