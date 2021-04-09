Before to transfer the data, we have to prepare the ground like copy [mapping](https://www.elastic.co/guide/en/elasticsearch/reference/7.12/mapping.html), [settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-get-settings.html), [analyzer](https://www.elastic.co/guide/en/elasticsearch/reference/current/analyzer.html), etc.

For this, we use the [elasticdump](https://github.com/elasticsearch-dump/elasticsearch-dump) tool :

Mapping

```
docker run --rm -ti elasticdump/elasticsearch-dump \
  --input=http://localhost:9201/contrat \
  --output=http://localhost:9200/contrat \
  --type=mapping
```{{execute}}

The destination is now ready to receive the data :

```
curl -X GET http://localhost:9200/contrat/_mapping?pretty
```{{execute}}
