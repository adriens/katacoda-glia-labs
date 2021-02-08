Prepare input topic and start Kafka producer.


Next, we create the input topic named streams-plaintext-input and the
output topic named streams-wordcount-output: 



```
cd kafka
bin/kafka-topics.sh --create \
    --bootstrap-server localhost:9092 \
    --replication-factor 1 \
    --partitions 1 \
    --topic streams-plaintext-input
```{{execute T4}}

Note: we create the output topic with compaction enabled because the output
stream is a changelog stream (cf. explanation of application output below). 

```
bin/kafka-topics.sh --create \
    --bootstrap-server localhost:9092 \
    --replication-factor 1 \
    --partitions 1 \
    --topic streams-wordcount-output \
    --config cleanup.policy=compact
```{{execute}}

Finally describe the created topics :

```
bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe
```{{execute}}

Start the Wordcount Application and let it run in background :

```
bin/kafka-run-class.sh org.apache.kafka.streams.examples.wordcount.WordCountDemo
```{{execute}}


The demo application will read from the input topic streams-plaintext-input, perform
the computations of the WordCount algorithm on each of the read messages, and continuously
write its current results to the output topic streams-wordcount-output. Hence there
won't be any STDOUT output except log entries as the results are written back into in Kafka. 

Now we can start the console producer in a separate terminal to write some input data to this topic: 

```
cd kafka
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic streams-plaintext-input
```{{execute T7}}

and inspect the output of the WordCount demo application by reading from its output
topic with the console consumer in a separate terminal: 

```
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic streams-wordcount-output \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer
```{{execute T8}}



Finally, process some data.

Now let's write some message with the console producer into the input topic streams-plaintext-input by entering a single line of text and then hit <RETURN>. This will send a new message to the input topic, where the message key is null and the message value is the string encoded text line that you just entered (in practice, input data for applications will typically be streaming continuously into Kafka, rather than being manually entered as we do in this quickstart): 


```
cd kafka
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic streams-plaintext-input
```{{execute T9}}

ANd put a message :

```
all streams lead to kafka and kafka is cool
```{{execute}}


Go back to `Terminal 8` and check the Stream being processed.