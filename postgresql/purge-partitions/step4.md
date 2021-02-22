Let's create some more partitions. I want to rotate my logs and always keep
logs that have been inserted the last month online... considering we
currently are in december.



```
-- Create November strict partition
CREATE TABLE logs_2020_11 PARTITION OF logs
    FOR VALUES FROM ('2020-11-01') TO ('2020-12-01');
-- Create October strict partition
CREATE TABLE logs_2020_10 PARTITION OF logs
    FOR VALUES FROM ('2020-10-01') TO ('2020-11-01');
-- Create September strict partition
CREATE TABLE logs_2020_09 PARTITION OF logs
    FOR VALUES FROM ('2020-09-01') TO ('2020-10-01');
```{{execute}}

... also create January 2021:

```
CREATE TABLE logs_2021_01 PARTITION OF logs
    FOR VALUES FROM ('2021-01-01') TO ('2021-02-01');
```{{execute}}

# Showing partitions

As paritions are tables, they are stored as tables and thus can be shown as classic tables:


`\dt`{{execute}}