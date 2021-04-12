Wrong braces syntax

```
clear
```{{execute}}

```
cat wrong-braces-syntax.json
```{{execute}}

Here we missed the brace on the 8th line.

```
jsonlint wrong-braces-syntax.json
```{{execute}}

Let's fix this typo.

```
sed -i '8s/.*/        {"uuid": "9f5e468a-aa72-4cd0-937d-a0845bd053e4", "name": "kayak"}/' wrong-braces-syntax.json
```{{execute}}

```
cat wrong-braces-syntax.json
```{{execute}}

That's it !
```
jsonlint wrong-braces-syntax.json | jq
```{{execute}}
