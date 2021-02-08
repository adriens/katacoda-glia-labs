Install some prerequisites:


```
sudo apt-get update
sudo apt-get install -y wget curl zip unzip tar
```{{execute}}

Install Java 8 with SDKMAN :

```
curl -s "https://get.sdkman.io" | bash
```{{execute}}

```
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
```{{execute}}

```
sdk list java
sdk install java 8.0.275.open-adpt
```{{execute}}

```
sdk default java 8.0.275.open-adpt
```{{execute}}

Test java env :

```
sdk current java
java -version
```{{execute}}

Now let's install Kafka itself.

First, setup some versions :

```
export KAFKA_VERSION=2.7.0
export KAFKA_SCALA_VERSION=2.12
```{{execute}}

And get Kafka :

```
wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz
tar -xzf kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz
ln -s kafka_2.12-2.7.0 kafka
bin/zookeeper-server-start.sh config/zookeeper.properties
```{{execute}}