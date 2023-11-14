-- Write your PostgreSQL query statement below
select request_at as Day, round(
    count(1) filter(
      where status != 'completed'
    )::numeric /
    count(1)
  ,2) as "Cancellation Rate"
from trips t
join users client on t.client_id = client.users_id
join users driver on t.driver_id = driver.users_id
where client.banned = 'No' and driver.banned = 'No'
and request_at between '2013-10-01' and '2013-10-03'
group by request_at;