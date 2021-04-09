On initialization, we inject the sample data via [Logstash](https://www.elastic.co/fr/logstash/).
Ensure the data is in the source elasticsearch database *(port 9201)* :

```
curl -XGET http://localhost:9201/contrat/_search?pretty
```{{execute}}

And had nothing in the destination *(port 9200)* :

```
curl -XGET http://localhost:9200/contrat/_search?pretty
```{{execute}}

## One-line command migration

We use the endpoint [`_reindex`](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-reindex.html) and define the source and the destination configuration in the http request body :

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

Take a look in the sink elasticsearch database *(port 9200)* :

```
curl -XGET http://localhost:9200/contrat/_search?pretty
```{{execute}}
