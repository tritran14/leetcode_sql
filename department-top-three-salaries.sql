select Department, Employee, Salary from (
  select d.name as Department, e.name as Employee, e.salary as Salary, dense_rank() over(partition by departmentId order by salary desc) as rank from employee e
  join department d
  on e.departmentId = d.id
)
where rank <= 3;