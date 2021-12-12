-- Member total posting
select distinct sender, count(*) as total_posting from lyzer group by sender order by 2 desc;

SELECT word, count(*)
FROM ( 
  SELECT regexp_split_to_table(content, '\s') as word
  FROM lyzer
) t
GROUP BY word order by 2 desc;

SELECT word, count(*)
FROM ( 
  SELECT regexp_split_to_table(content, '\s') as word
  FROM lyzer
) t
WHERE 
    word ilike '%cyin%'
GROUP BY word order by 2 desc;

SELECT word, count(*)
FROM ( 
  SELECT regexp_split_to_table(target.content, '\s') as word
  FROM 
    (
        select content from lyzer where sender ilike '%sudrajat%'
    ) target 
) t
GROUP BY word order by 2 desc;
select distinct 
    sender, 
    extract(year from date) as yr, 
    extract(month from date) as mo, 
    count(*) as co
from 
    lyzer 
group by
    sender, mo, yr
order by
    sender, yr, mo;


select distinct 
    extract(year from date) as yr, 
    extract(month from date) as mo, 
    count(*) as co
from 
    lyzer
group by
    yr, mo
order by
    jumlah_posting desc;

SELECT word, count(*)
FROM ( 
  SELECT regexp_split_to_table(target.content, '\s') as word
  FROM 
    (
        select content from lyzer where sender ilike '%sudrajat%'
        and extract(hour from date) >=7 and extract(hour from date) <=11
    ) target 
) t
GROUP BY word order by 2 desc;

select
    distinct sender,
    sum(sub_total) as sum_tot
from
(
    select 
        sender, 
        count(*) as sub_total
    from 
        lyzer 
    where 
        content ilike '%toosa%'
    group by
        sender,
        content
) yippie
group by
    sender
order by
    sum_tot desc;

select distinct 
    date::date as dt, 
    count(*) as co 
from 
    lyzer
group by
   dt 
order by
    co desc
limit 10;

select
     *
from
(
     select distinct
         date::date as dt,
         count(*) as co
     from
         lyzer
     group by
        dt
     order by
         co desc
     limit 1
) yippie
join 
    lyzer on lyzer.date::date = lyzer.dt
order by
    lyzer.date asc;
select 
    age(max(date)::date, min(date)::date)
from
    lyzer;
 
-- member, max_posting_month, min_posting_month, avg_post_per_month
