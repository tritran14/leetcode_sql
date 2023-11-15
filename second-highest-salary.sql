select * from (
  (select 1)
  left join
  (select salary from employee
  order by salary desc
  offset 1 limit 1)
);