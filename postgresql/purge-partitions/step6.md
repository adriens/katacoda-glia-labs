Let's take a quick look and compare execution plan while trying to 
select a given month.

On the partitionned table:

```
explain
    select * from logs
    where log_date = '2020-12-20';
```{{execute}}

... then on the classical one:

```
explain
    select * from logs_dumb
    where log_date = '2020-12-20';
```{{execute}}

Now take a closer look at the cost.

On my laptop, its going from `(cost=0.00..39841.71` for the partitionned one...
to `(cost=0.00..115778.93` for the dumb version. All that without having any index to manage.

Cool isn't it ?