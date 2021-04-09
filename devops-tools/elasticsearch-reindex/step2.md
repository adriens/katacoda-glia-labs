Launch services :

```
docker-compose --project-name elasticsearch-data-migration up -d
```{{execute}}

On waiting for it, a quick view on files availables and used here :

* **.env** : Environment variables used in `docker-compose.yml` file
* **docker-compose.yml** : Contains all services (Elasticsearch, etc.) list to launch
* **elasticsearch.yml** : [Elasticsearch](https://www.elastic.co/elasticsearch/) configuration
* **logstash.yml** & **logstash.conf** : [Logstash](https://www.elastic.co/logstash/) configuration files (used to insert source data)
* **data.csv** : Sample data

Once finished, show the list containers' statuses

```
clear
docker-compose --project-name elasticsearch-data-migration ps
```{{execute}}

Ensure Logstash is completely up & running to inject data from the `data.csv` file...

```
docker logs logstash --follow | grep started
```{{execute}}

... And have a similar output :

```
[2021-04-09T04:41:52,047][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9600}
```

Then exit the logging viewer

`^C`{{execute ctrl-seq}}