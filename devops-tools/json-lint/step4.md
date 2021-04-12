Missing key

```
clear
```{{execute}}

```
cat missing-key.json
```{{execute}}

Here we missed the key on the 4th line.

```
jsonlint missing-key.json
```{{execute}}

Let's fix this typo.

```
sed -i '4s/.*/    "firstName": "Doe",/' missing-key.json
```{{execute}}

```
cat missing-key.json
```{{execute}}

That's it !
```
jsonlint missing-key.json | jq
```{{execute}}
