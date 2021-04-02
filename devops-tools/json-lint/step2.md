First, let's validate a json.

Here is the raw input :

```
cat valid-one-lined.json
```{{execute}}

Not easy to read.

But is it valid ?

```
jsonlint valid-one-lined.json
```{{execute}}


Its valid not easy to read for humans, let's fix that :

```
jsonlint --pretty-print valid-one-lined.json
```{{execute}}

Now let's say we want to keep the pretty output :

```
jsonlint --pretty-print valid-one-lined.json > pretty-valid-one-lined.json 
```{{execute}}

Then take a look at the final json :

```
cat pretty-valid-one-lined.json
```{{execute}}

... and put some colors :

```
cat pretty-valid-one-lined.json | jq
```{{execute}}