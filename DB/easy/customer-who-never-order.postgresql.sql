select c.name as Customers
from customers c 
where c.id not in(
select c.id
from customers c inner join orders o on c.id = o.customerId
)