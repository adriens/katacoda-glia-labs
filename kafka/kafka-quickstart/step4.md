Let's write some events into the topic.

 A Kafka client communicates with the Kafka brokers via the network for writing (or reading)
 events. Once received, the brokers will store the events in a durable and fault-tolerant
 manner for as long as you need—even forever.

Run the console producer client to write a few events into your topic. By default, each
line you enter will result in a separate event being written to the topic. 

```
clear
bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
```{{execute T5}}

Now, let's put a first event :

`This is my first event`{{execute}}

`This is my second event`{{execute}}

**You can stop the producer client with `Ctrl-C` at any time.**

Stop it now :

`^C`{{execute ctrl-seq}}
