Quick view on files availables and used here :

`tree`{{execute}}

* `.env` : Environment variables used in `docker-compose.yml` file
* `docker-compose.yml` : Contains all services list to launch
* `elasticsearch.yml` : Elasticsearch configuration
* `logstash.yml` & `logstash.conf` : Logstash configuration (used to insert source data)
* `data.csv` : Data initialization

```
docker-compose --project-name elasticsearch-data-migration up -d
```{{execute}}

```
docker-compose --project-name elasticsearch-data-migration ps
```{{execute}}
