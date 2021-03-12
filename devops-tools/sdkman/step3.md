# Install from Java.net

Let's say we want to use Java 8 from Java.net.

First, pick the Java distriubution you want:

```
sdk list java | more
```{{execute}}

For example install `java 8.0.282-open`:

```
sdk install java 8.0.282-open
```{{execute}}

... and set if by default by hitting `ENTER`.

Next, test you are now using this latest one :

```
java -version
```{{execute}}

Pay good attention to :

- distributor
- java version

Check all the installed versions and the one you are currently using :

```
sdk list java | more
```{{execute}}

# Install Java 11 from Java.net

As seen previsously, just :

```
sdk install java 11.0.10-open
```{{execute}}

... and set if by default by hitting `ENTER`.

Test your java environment now (you have switched to `11.0.10-open`).

Since now, let's use dedicated `sdk` commands to manage our environment.
Take a look at what we are currently using :

```
sdk current
```{{execute}}
