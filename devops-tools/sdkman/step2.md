# Install Java SDK


First, Install the latest stable version of your SDK of choice
(say, Java JDK) by running the following command: 

```
sdk install java
```{{execute}}

Say `Y` (or just hit `ENTER`) when prompted if you want this version to be set as default.

`Do you want java 8u111 to be set as default? (Y/n):`

Now, check that your (first and only) Java runtime is ready to use:

```
java -version
```{{execute}}

**NB : you don't have to deal with Java alternatives, `SDKMAN!` does all the work for you.**

Now, browse the Java Runtime you just installed from `SDKMAN!`:

```
sdk list java | more
```{{execute}}

Check the output with care, especially the `Status` column.

See, by default, we :

- have installed binaries from [AdoptOPenJDK](https://adoptopenjdk.net/)
- use latest LTS