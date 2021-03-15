Make your first chart from terminal for the terminal :

```
clear
termgraph  /tmp/report_tests_by_month.csv --title "Tests by month." --color green
```{{execute}}

Then a new one :

```
termgraph  /tmp/report_nb_active_cases_month.csv --title "Nb. active cases by month"
```{{execute}}


# Labels

First add labels to the top of the file :

```
echo -e "@ NbConfirmed, NbRemissions \n$(cat /tmp/report_nb_confirmes_vs_remis_month.csv)" > /tmp/report_nb_confirmes_vs_remis_month.csv
```{{execute}}

... Then chart it :

```
termgraph /tmp/report_nb_confirmes_vs_remis_month.csv --stacked --title "Monthly confirmed vs. remissions cases" --color {blue,red}
```{{execute}}

# Nb tests by day of week

```
termgraph /tmp/report_nb_tests_dow.csv --custom-tick "🏃" --width 20 --title "Nb. tests by day of week"
```{{execute}} 


# Calendar heatmap
 
Finally, display the calendar heatmap of active cases :

``` 
termgraph --calendar --start-dt 2020-03-18 /tmp/report_nb_active_cases.csv --title "Nb. Monthly active cases Calendar heatmap since March 2020"
```{{execute}}