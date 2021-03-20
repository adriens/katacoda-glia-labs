Create some views to make reporting easier to use :


# Nb. of tests by month

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

# Nb active cases by day

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

# Nb active cases by month

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


# Daily confirmed vs. remissions

```
create view report_nb_confirmes_vs_remis_days
as
select to_char(jour, 'YYYY-MM-DD') as "Day",
max(nb_confi) as nb_confirmed,
max(nb_remis) as nb_remissions
from covid_nc_data
group by to_char(jour, 'YYYY-MM-DD')
order by to_char(jour, 'YYYY-MM-DD') desc;

COMMENT ON VIEW report_nb_confirmes_vs_remis_days IS 'Daily confirmed vs. remissions';
```{{execute}}

Test it :

```
select *
from report_nb_confirmes_vs_remis_days
limit 10;
```{{execute}}

# Monthly confirmed vs. remissions

```
create view report_nb_confirmes_vs_remis_month
as
select to_char(jour, 'YYYY-MM') as "Month",
max(nb_confi) as nb_confirmed,
max(nb_remis) as nb_remissions
from covid_nc_data
group by to_char(jour, 'YYYY-MM')
order by to_char(jour, 'YYYY-MM') desc;

COMMENT ON VIEW report_nb_confirmes_vs_remis_month IS 'Monthly confirmed vs. remissions';
```{{execute}}

And give it a try :

```
select *
from report_nb_confirmes_vs_remis_month;
```{{execute}}

# Nb. tests by Day of week

```
create view report_nb_tests_dow
as
select 
to_char(jour, 'dy') as dow,
sum(nb_tests_jour) as nb_tests
from covid_nc_data
group by to_char(jour, 'dy')
order by to_char(jour, 'dy') desc;

COMMENT ON VIEW report_nb_tests_dow IS 'Nb tests by day of week';
```{{execute}}

Take a look at it :

```
select *
from report_nb_tests_dow;
```{{execute}}

# Vaccines

```
create view report_nb_vaccines_daily as
select
to_char(jour, 'YYYY-MM-DD') as day,
nb_prem_inject,
nb_deux_inject
from covid_nc_data
where jour > '2021-01-25'
order by jour desc;
COMMENT ON VIEW report_nb_vaccines_daily IS 'Nb of daily vaccines since 2021-01-25';
```{{execute}}

And give it a try :

```
select *
from report_nb_vaccines_daily
limit 30;
```{{execute}}

Next some monthly aggregates :

```
create view report_nb_vaccines_monthly as
select
to_char(jour, 'YYYY-MM') as month,
max(nb_prem_inject) as nb_prem_inject,
max(nb_deux_inject) as nb_deux_inject
from covid_nc_data
group by to_char(jour, 'YYYY-MM')
having to_char(jour, 'YYYY-MM') > '2020-11'
order by to_char(jour, 'YYYY-MM') desc;

COMMENT ON VIEW report_nb_vaccines_monthly IS 'Nb of monthly vaccines since 2020-11';
```{{execute}}

And give it a try :

```
select *
from report_nb_vaccines_monthly;
```{{execute}}


These reportings are pretty cool not really sexy : let's put some fun into the experience !