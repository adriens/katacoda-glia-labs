Missing value

```
clear
```{{execute}}

```
cat missing-value.json
```{{execute}}

Here we missed the value on the 4th line.

```
jsonlint missing-value.json
```{{execute}}

Let's fix this typo.

```
sed -i '4s/.*/    "firstName": "Doe",/' missing-value.json
```{{execute}}

```
cat missing-value.json
```{{execute}}

That's it !
```
jsonlint missing-value.json | jq
```{{execute}}
