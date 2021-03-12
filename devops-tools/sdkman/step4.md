# Switch Java runtimes

Now you have a lot of Java runtimes. Check them :


```
sdk list java | more
```{{execute}}


 According to your needs, you may need to switch

 - JVM Distributor (Oracle, OpenJDK, SAP, Alibaba, Amazon, GraalVM)
 - the version

 Therefore you have to switch between java environments.

Currenlty, we aree running on `11.0.10-open` but we want to switch on `8.0.282-open`.

# Switch version in current shell only

To do that, simply hit :

```
sdk use java 8.0.282-open
sdk current java
```{{execute}}

And check that it does not affect other sessions by opening a new terminal :

`sdk current java`{{execute T2}}


Check the differences between the two sessions by yourself.

# Permanently switch version

If you want to share this java version with all your sessions, then :

```
sdk default java 8.0.282-open
sdk current java
```{{execute}}

Open a new terminal and check the Java environment :

```
sdk current java
```{{execute T3}}


# Remove version

To unistall a Java environment, just pick your `Identifier` (`11.0.10.hs-adpt` in my case) and :

 ```
 sdk uninstall java 11.0.10.hs-adpt
 ```{{execute}}

# Global SDKMAN! environemnt

 You can install a lot of jvm related software with `SDKMAN!`. To get a status,
 simply :

 ```
 sdk current
 ```{{execute}}