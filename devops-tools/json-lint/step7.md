Validate a json file using a schema


Let's see the schema file, it shows what we expect regarding the data file.

```
cat schemas/data.schema.json
```{{execute}}


```
jsonlint wrong-schema-format.json --validate schemas/data.schema.json
```{{execute}}

There is a problem with the "name" property, we have a boolean instead of string

Let's fix it

```
sed -i '3s/.*/    "name": "Jean",/' wrong-schema-format.json
```{{execute}}

```
cat wrong-schema-format.json
```{{execute}}

That's it !
```
jsonlint wrong-schema-format.json --validate schemas/data.schema.json | jq
```{{execute}}
