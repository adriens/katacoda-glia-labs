Previously we could perform our month base purge strategy on our tables.

Job done but:

- The delete action is transaction consuming (it's a transaction)
- Generate WALs...
- We have to run a VACUUM to get space back: we'd rather not to have to do this (let's get lazy)

We want to drop the data faster and not in a transactional way, without locking
the parent table.

Be aware that vacuum full is very efficient but comes at a cost.

We want to get the same performances...without the cost.

With partitionned tables it's very easy :

This allows further operations to be performed on the data before it is dropped.
For example, this is often a useful time to back up the data using COPY, pg_dump, or similar tools.
It might also be a useful time to aggregate data into smaller formats, perform other
data manipulations, or run reports.

See how to drop december, 2020. 

First, detach the december partition :

```
alter table logs detach partition logs_2020_12;
```{{execute}}

Now logs_2020_12 since is a classic table, not linked to the parent anymore,
we can perform any management task without impacting the parent `logs` table.

For example, rename it :

```
alter table logs_2020_12 rename to arch_logs_2020_12;
```{{execute}}

Let's take a closer look at the vacuum process:

```
vacuum full verbose analyse logs;
```{{execute}}

Look for the december partition `2020-12`, see ? It's not managed anymore by the parent table.
The consequence is that :

- Parent table `logs` has been purged from december 2020
- There is no required maintenance task
- The parent table is clean : no `removable rows`
- You can do whatever you want with the detached/archived partition without impacting (eg. locking) your live table


Finally then drop december, 2020 :

```
drop table arch_logs_2020_12;
```{{execute}}

 And take a look at your tables now :

data distribution per month:

 ```
SELECT schemaname,
    relname,
    n_live_tup
FROM pg_stat_user_tables
where relname like '%logs%'
ORDER BY relname DESC ;
```{{execute}}

Job done. You have purged your datas :
- wihtout any side effect
- at no cost
- wihtout having locked any table
- without any `vacuum`