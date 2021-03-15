We'll make charts that use our ready to use views so the code is easier to understand.

Now, dump each view into proper and dedicated `csv` files,
**but from the client side this time (where `psql` is running**)

```
\copy (SELECT * FROM report_tests_by_month) to '/tmp/report_tests_by_month.csv' with csv;
\copy (SELECT * FROM report_nb_active_cases) to '/tmp/report_nb_active_cases.csv' with csv;
\copy (SELECT * FROM report_nb_active_cases_month) to '/tmp/report_nb_active_cases_month.csv' with csv;
```{{execute}}

Then exit `psql` and go back to the terminal :

```
\q
```{{execute}}

And take a look at the files you have just dumped in `/tmp` :

```
cd /tmp
ls -ltr
```{{execute}}

Take a look at `/tmp/report_nb_active_cases_month.csv` :


```
cat report_nb_active_cases_month.csv
```{{execute}}

We have the required `csv` data files.