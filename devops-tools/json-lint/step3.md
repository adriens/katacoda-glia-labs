Let's see the most "popular" errors when writing a json file 

Missing colon

```
cat missing-colon.json
```{{execute}}

Here we missed the colon on the 3rd line.

```
jsonlint missing-colon.json
```{{execute}}

Let's fix this typo.

```
sed -i '3s/.*/    "name": "Jean",/' missing-colon.json
```{{execute}}

```
cat missing-colon.json
```{{execute}}

That's it !
```
jsonlint -p missing-colon.json | jq
```{{execute}}
