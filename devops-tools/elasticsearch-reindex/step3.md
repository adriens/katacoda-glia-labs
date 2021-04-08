On initialization, we inject the sample data via [Logstash](https://www.elastic.co/fr/logstash/).
Ensure the data is in the source elasticsearch database :

```
curl -XGET http://localhost:9201/contrat/_search?pretty
```{{execute}}

## One-line command migration

We use the endpoint [`_reindex`](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-reindex.html) and we define the source and the destination configuration in the http request body :

```
{
    "source": {
        "remote": {
            "host": "http://es-source:9201"
        },
        "index": "contrat",
        "query": {
            "match_all": {}
        }
    },
    "dest": {
        "index": "contrat"
    }
}
```

```
curl -XPOST http://localhost:9200/_reindex?pretty \
    -H "Content-Type: application/json" \
    -d '{"source":{"remote":{"host":"http://es-source:9201"},"index":"contrat","query":{"match_all":{}}},"dest":{"index":"contrat"}}'
```{{execute}}

```
curl -XGET http://localhost:9200/contrat/_search?pretty
```{{execute}}