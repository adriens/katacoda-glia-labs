# Install Developer tools

Let's install [maven](https://maven.apache.org/).

List available maven versions:

```
sdk list maven
```{{execute}}

... and pick the default one :

```
sdk install maven
```{{execute}}

Install [Gradle](https://gradle.org/) :

```
sdk install gradle
```{{execute}}

Finally check our overall (Java and build tools) environment :

```
sdk current
```{{execute}}

That's all, your JVM development environment is setup, and ready to be managed.