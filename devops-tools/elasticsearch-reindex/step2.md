```
docker-compose --project-name elasticsearch-data-migration up -d
```{{execute}}

On waiting for it, a quick view on files availables and used here :

```
clear && tree
```{{execute}}

* **.env** : Environment variables used in `docker-compose.yml` file
* **docker-compose.yml** : Contains all services (Elasticsearch, [Kibana](https://www.elastic.co/fr/kibana/), etc.) list to launch
* **elasticsearch.yml** : [Elasticsearch](https://www.elastic.co/elasticsearch/) configuration
* **logstash.yml** & **logstash.conf** : [Logstash](https://www.elastic.co/logstash/) configuration files (used to insert source data)
* **data.csv** : Sample data

`data.csv` content (with pretty output)

```
cat data.csv | column -t -s,
```{{execute}}

When finished, show the list containers' statuses

```
docker-compose --project-name elasticsearch-data-migration ps
```{{execute}}
