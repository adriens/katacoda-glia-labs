Missing array item

```
cat missing-array-item.json
```{{execute}}

Here we missed the array item on the 7th line.

```
jsonlint missing-array-item.json
```{{execute}}

Let's fix this typo.

```
sed -i '7s/.*/        {"uuid": "60a7c607-7819-4679-b325-f59233154db8", "name": "design"},/' missing-value.json
```{{execute}}

```
cat missing-array-item.json
```{{execute}}

That's it !
```
jsonlint missing-array-item.json | jq
```{{execute}}
