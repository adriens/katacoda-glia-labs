Go back to **remote** `home` directory :

`cd`{{execute}}


And get a somes indivual files locally then exit :

```
get schemacrawler-16.14.1-distribution.zip schemacrawler-16.14.1-distribution.zip.SHA-512
exit
```{{execute}}

Now that we're back on our terminal, let's check files integrity :

```
ls -ltr
sha512sum schemacrawler-16.14.1-distribution.zip
cat schemacrawler-16.14.1-distribution.zip.SHA-512
```{{execute}}

You have just downloaded files locally.

Finally make some local cleanup :

```
rm *
clear
ls
```{{execute}}