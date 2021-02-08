First, start Zookeeper :

```
cd kafka
bin/zookeeper-server-start.sh config/zookeeper.properties
```{{execute T2}}

```
cd kafka
bin/kafka-server-start.sh config/server.properties
```{{execute T3}}

A this step, Zookeeper and server are both running in background process.

We can interact with them.

