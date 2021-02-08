Let's create a topic to store events.


Kafka is a distributed event streaming platform that lets you read, write, store, 
and process [events](https://kafka.apache.org/documentation/#messages) (also called
records or messages in the documentation) across many machines.

Example events are payment transactions, geolocation updates from mobile phones, shipping orders,
sensor measurements from IoT devices or medical equipment, and much more.

These events are organized and stored in [topics](https://kafka.apache.org/documentation/#intro_topics).
Very simplified, a topic is similar to a
folder in a filesystem, and the events are the files in that folder.

So before you can write your first events, you must create a topic.

Let's open another terminal session and run: 

```
cd kafka
bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
```{{execute T4}}

All of Kafka's command line tools have additional options. You can run the `kafka-topics.sh` command without
any arguments to display usage information:

```
bin/kafka-topics.sh
```{{execute T4}}

If we want to get info about our newly created `quickstart-events` topic, just :

```
bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
```{{execute T4}}

