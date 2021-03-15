# Notice

Due to font issues, the charts won't have the aspect they mau have in real life on a real
and well setup environment.

For nice output samples, please visit the [termgraph project](https://github.com/mkaz/termgraph)

```
termgraph  /tmp/report_tests_by_month.csv --title "Tests by month."
```{{execute}}

Then a new one :

```
termgraph  /tmp/report_nb_active_cases_month.csv --title "Nb. active cases by month"
```{{execute}}


Then a new one with labels :

First add labels to the top of the file :

```
echo -e "@ Month, NbActive\n$(cat /tmp/report_nb_active_cases_month.csv)" > /tmp/report_nb_active_cases_month.csv
```{{execute}}

... and chart it :

```
termgraph /tmp/report_nb_active_cases_month.csv --color {red,green}
```{{execute}} 
 
Finally, display the calendar heatmap of active cases :

``` 
termgraph --calendar --start-dt 2020-03-18 /tmp/report_nb_active_cases.csv
```{{execute}}