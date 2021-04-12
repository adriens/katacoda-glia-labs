Wrong bracket syntax

```
clear
```{{execute}}

```
cat wrong-brackets-syntax.json
```{{execute}}

Here we used the wrong bracket on the 5th line.

```
jsonlint wrong-brackets-syntax.json
```{{execute}}

Let's fix this typo.

```
sed -i '5s/.*/    "hobbies": [/' wrong-brackets-syntax.json
```{{execute}}

```
cat wrong-brackets-syntax.json
```{{execute}}

That's it !
```
jsonlint wrong-brackets-syntax.json | jq
```{{execute}}
