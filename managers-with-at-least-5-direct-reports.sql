select name from employee 
where id in (
  select managerId as cnt from employee
  group by managerId
  having count(1) >= 5
);