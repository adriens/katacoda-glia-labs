# Explain plan

For now, we did not create a single index. This point is very important as
in the next lines we'll se, thanks to execution plan, how the optimizer
works on our two tables... even with a very low amount of rows.

During this course, I'll use the explain command. 
Please check the [official EXPLAIN](https://www.postgresql.org/docs/current/using-explain.html)
from PostgreSQL. It's a crucial command, for developers and DBAs.


```
explain
select * from logs
    where log_date = '2020-12-20';
```{{execute}}

See, it automatically fetched the right partition:

```
QUERY PLAN
Seq Scan on logs_2020_12 logs  (cost=0.00..23.00 rows=5 width=50)
  Filter: (log_date = '2020-12-20 00:00:00'::timestamp without time zone)
(2 rows)
```