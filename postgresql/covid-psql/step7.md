Make your first chart from terminal for the terminal :

```
clear
termgraph  /tmp/report_tests_by_month.csv --title "Nb. tests by month." --color green
```{{execute}}


# Nb tests by day of week

```
termgraph /tmp/report_nb_tests_dow.csv --custom-tick "😷" --width 20 --title "Nb. tests by day of week"
```{{execute}}

# Vaccines

Prepare the file :

```
echo -e "@ NbFirst, NbSecond \n$(cat /tmp/report_nb_vaccines_daily.csv)" > /tmp/report_nb_vaccines_daily.csv
```{{execute}}

Then chart it :

```
termgraph /tmp/report_nb_vaccines_daily.csv --stacked --title "Daily vaccines" --color {blue,red}
```{{execute}}

Finally, prepare the monthly chart's data :

Same for monthly :

```
echo -e "@ NbFirst, NbSecond \n$(cat /tmp/report_nb_vaccines_monthly.csv)" > /tmp/report_nb_vaccines_monthly.csv
```{{execute}}

Then chart it :

```
termgraph /tmp/report_nb_vaccines_monthly.csv --stacked --title "Monthly vaccines" --color {blue,red}
```{{execute}}

# Nb. of active cases by month

```
clear
termgraph  /tmp/report_active_cases_by_month.csv --title "Nb. active cases by month." --color green
```{{execute}}

# Cumulative quarantine by month

```
clear
termgraph  /tmp/report_quarantine_evolution_by_month.csv --title "Cumulative quarantine by month." --color green
```{{execute}}


# Conclusion

```
echo "Vaccinez-vous 🙌" | boxes -d boy
```{{execute}}