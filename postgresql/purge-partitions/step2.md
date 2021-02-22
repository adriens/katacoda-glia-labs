# Create tables

We'll create two kind of tables : 

- classical one
- partitionned one

Both have the same columns. Let's create them.


First, create the partitioned table and describe it:

```
CREATE TABLE logs (
    log_date        timestamp not null,
    mesg            varchar(10),
    log_level       int
) PARTITION BY RANGE (log_date);
\dt
```{{execute}}

Also create a dumb non-partitionned table:


```
CREATE TABLE logs_dumb (
    log_date        timestamp not null,
    mesg            varchar(10),
    log_level       int
);
\dt
```{{execute}}

See ? They look the same.

Now let's deal with partitioning, we'll work on a month based strategy, based on the `log_date` column.

Therefore we create partitions that inherit from parent table with constraints.

Create December strict partition :

```
CREATE TABLE logs_2020_12 PARTITION OF logs
    FOR VALUES FROM ('2020-12-01') TO ('2021-01-01');
```{{execute}}


And again, list all tables:

`\dt`{{execute}}

Do you see the partition appear as a table ?

Now, let's put some data in it :

Insert any day of december 2020:

```
insert into logs
    values ('2020-12-22', 'hello', 1);
```{{execute}}


Select and target the parent table :

```
select from logs;
```{{execute}}


Directly target the underlying partition :

```
select * from logs_2020_12;
```{{execute}}



Now... let's try to put unexpected datas : put rows from 2021:


let's try to put some 2021 stuff :

```
insert into logs
    values ('2021-01-01', 'hello 2021', 1);
```{{execute}}

See what happens ? Out of bound, works as expected.

Nothing goes in the parent table.

