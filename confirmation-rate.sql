select s.user_id, coalesce(tmp.cnt, 0) as confirmation_rate from signups s
left join (
  select user_id, round(avg(case when action = 'confirmed' then 1 else 0 end), 2) as cnt from confirmations
  group by user_id
) tmp 
on s.user_id = tmp.user_id;