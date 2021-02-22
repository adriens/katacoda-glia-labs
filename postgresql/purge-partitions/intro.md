Very often you have to :

- store large amount of data
- read them (no modification)
- delete them on a given criteria (date, id, flag, text,...)

When you do this with classic tables, you will :

- potentially spend a lot of time to "delete" the data
- face [bloat](https://dba.stackexchange.com/questions/126258/what-is-table-bloating-in-databases/126286) (and then performance) issues
- plan `vacuum` operations which can be complex and lock tables... which is not always possible

In this scenario, you'll be able to compare different approaches to achieve these goals in a 
very efficient way, with real data.

**bloat definition** : Once there is no dependency on those dead tuples with the already
running transactions, the dead tuples are no longer needed. Thus, PostgreSQL runs VACUUM on
 such Tables. ...
 The space occupied by these dead tuples may be referred to as Bloat