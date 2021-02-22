# Delete operations and bloat

Now, let's perform some dummy purge action.

Let's remove October rows with a "dumb" delete

Do the delete the DUMB way (be patient of course), less than 7 seconds on my laptop.


First, set timing on:

```
\timing
```{{execute}}


Delete december 2020 and pay attention to the time required to
dumb delete December on each table

```
delete from logs
    where to_char (log_date, 'YYYY-MM') = '2020-12';
delete from logs_dumb
    where to_char (log_date, 'YYYY-MM') = '2020-12';
```{{execute}}

Now we have a lot of bloat... but centralized in a single table.

Let's check that our target month has properly disappeared.
Pay good attention on how easy it is to check that on the partitionned table:


```
SELECT schemaname,
    relname,
    n_live_tup
FROM pg_stat_user_tables
    where relname like 'logs_%'
ORDER BY relname DESC ;
```{{execute}}

next, let's perform vacuum to put bloat away :

Beware that during this period the table is locked

```
vacuum full verbose analyse logs;
vacuum full verbose analyse logs_dumb;
```{{execute}}


Here is the kind of interesting thing, the rows identified as removable :

`INFO:  "logs_2020_12": found 3792522 removable,`

Compare removables by table.

if `vacuum` is played again, getting that kind of message for each table/partition :

`"logs_...": found 0 removable`

This is the target situation : get as less `removable` as possible, if possible
without having to deal with `vacuum full`.