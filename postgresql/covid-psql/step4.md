Create some views to make reporting easier to use :


```
create view report_tests_by_month
as
select to_char(jour, 'YYYY-MM') as "Month",
sum(nb_tests_jour) as "Nb. Tests"
from covid_nc_data
group by to_char(jour, 'YYYY-MM')
order by to_char(jour, 'YYYY-MM') desc;
```{{execute}}

And put some comment on it :

```
COMMENT ON VIEW report_tests_by_month IS 'Nb. of tests by month';
```{{execute}}

Finally use the report :

```
select * from report_tests_by_month;
```{{execute}}

Create some other view :

```
create view report_nb_active_cases
as
select to_char(jour, 'YYYY-MM-DD') as "Month",
nb_confi - nb_remis as nb_actives
from covid_nc_data
order by jour desc;
COMMENT ON VIEW report_nb_active_cases IS 'Nb active cases';
```{{execute}}

And query it to test it :

```
select * from report_nb_active_cases
limit 10;
```{{execute}}

And finally this one:

```
create view report_nb_active_cases_month
as
select to_char(jour, 'YYYY-MM') as "Month",
max(nb_confi - nb_remis) as max_nb_actives
from covid_nc_data
group by to_char(jour, 'YYYY-MM')
order by to_char(jour, 'YYYY-MM') desc;

COMMENT ON VIEW report_nb_active_cases_month IS 'Peak of active cases by month';
```{{execute}}

Test it :

```
select * from report_nb_active_cases_month;
```{{execute}}