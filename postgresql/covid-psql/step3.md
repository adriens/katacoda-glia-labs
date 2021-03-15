First create the target table that will hold the data :

```
CREATE TABLE covid_nc_data (
  jour DATE,
  nb_confi int,
  nb_quarant int,
  nb_remis int,
  nb_deces int,
  nb_tests_jour int,
  nb_prem_inject int,
  nb_deux_inject int,
  PRIMARY KEY (jour)
);
```{{execute}}

Then document table and its columns :

```
COMMENT ON TABLE covid_nc_data IS 'New-Caledonia COVID-19 historical data';
COMMENT ON COLUMN covid_nc_data.jour IS 'Date of the data';
COMMENT ON COLUMN covid_nc_data.nb_confi IS 'Total number of confirmed covid cases, since the beginning of the crise';
COMMENT ON COLUMN covid_nc_data.nb_quarant IS 'Nb. of people in quarantine';
COMMENT ON COLUMN covid_nc_data.nb_remis IS 'Nb. of people who are ok now';
COMMENT ON COLUMN covid_nc_data.nb_deces IS 'Nb. of deaths ;-(';
COMMENT ON COLUMN covid_nc_data.nb_tests_jour IS 'Nb. or performed test that day';
COMMENT ON COLUMN covid_nc_data.nb_prem_inject IS 'Nb. of people who have been vaccinated since 2021/01/20';
COMMENT ON COLUMN covid_nc_data.nb_deux_inject IS 'Nb. of people who git their second vaccine injection';
```{{execute}}

The table is created but it empty :

```
select * from covid_nc_data ;
```{{execute}}


Now load the file into the table

Make the magic happen :

```
COPY covid_nc_data
FROM '/tmp/covid19-nc.csv'
DELIMITER ','
CSV HEADER;
```{{execute}}

And get the last 10 days : 

```
select * from covid_nc_data
order by jour desc
limit 10;
```{{execute}}