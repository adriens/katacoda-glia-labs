Let's make things a bit more interesting by putting data.

With the following boilerplate code, we create rows. No need
to understand this part.


```
-- remove any existing line
DELETE FROM logs;
-- make things clean
vacuum full analyse logs;
-- do the insert
INSERT INTO logs (log_date, mesg, log_level)
SELECT 
date('2020-10-01') + (random() * (NOW() +'90 days' - NOW()))  +'30 days',
'hello ', -- || generate_series,
generate_series
FROM generate_series(1, 10000000);
```{{execute}}


And also put the same data into the dumb (non partitionned) table :

```
-- remove any existing line
DELETE FROM logs_dumb;
-- make things clean
vacuum full analyse logs_dumb;
-- do the insert
INSERT INTO logs_dumb
select * from logs;
```{{execute}}


Now we have exactly the same amount of rows on the two tables.

Let's take a look at how we filled our tables, from statistics.
Data distribution per month :

```
SELECT schemaname,
    relname,
    n_live_tup
FROM pg_stat_user_tables
    where relname like 'logs_%'
ORDER BY relname DESC ;
```{{execute}}