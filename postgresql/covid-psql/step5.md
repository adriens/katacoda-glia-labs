We'll make charts that use our ready to use views so the code is easier to understand.

Now, dump each view into proper and dedicated `csv` files,
**but from the client side this time (where `psql` is running**)

```
\copy (SELECT * FROM report_tests_by_month) to '/tmp/report_tests_by_month.csv' with csv;
\copy (SELECT * FROM report_nb_tests_dow) to '/tmp/report_nb_tests_dow.csv' with csv;
\copy (SELECT * FROM report_nb_vaccines_daily) to '/tmp/report_nb_vaccines_daily.csv' with csv;
\copy (SELECT * FROM report_nb_vaccines_monthly) to '/tmp/report_nb_vaccines_monthly.csv' with csv;
```{{execute}}

Then exit `psql` and go back to the terminal :

```
\q
```{{execute}}

And take a look at the files you have just dumped in `/tmp` :

```
cd /tmp
clear
ls -ltr report*
```{{execute}}

Take a look at `/tmp/report_tests_by_month.csv` :


```
cat report_tests_by_month.csv
```{{execute}}

We have the required `csv` data files.