Once your data is stored in Kafka as events, you can process the data with
the [Kafka Streams](https://kafka.apache.org/documentation/streams) client library for Java/Scala.
It allows you to implement mission-critical real-time applications and microservices, where the
input and/or output data is stored in Kafka topics. Kafka Streams combines the simplicity of writing
and deploying standard Java and Scala applications on the client side with the benefits of
Kafka's server-side cluster technology to make these applications highly scalable,
elastic, fault-tolerant, and distributed. The library supports exactly-once processing,
stateful operations and aggregations, windowing, joins, processing based on event-time, and much more.

To give you a first taste, here's how one would implement the popular `WordCount` algorithm:

```java
KStream<String, String> textLines = builder.stream("quickstart-events");

KTable<String, Long> wordCounts = textLines
            .flatMapValues(line -> Arrays.asList(line.toLowerCase().split(" ")))
            .groupBy((keyIgnored, word) -> word)
            .count();

wordCounts.toStream().to("output-topic"), Produced.with(Serdes.String(), Serdes.Long()));
```


The [Kafka Streams demo](https://kafka.apache.org/25/documentation/streams/quickstart)
and the [app development tutorial](https://kafka.apache.org/25/documentation/streams/tutorial)
demonstrate how to code and run such a streaming application from start to finish.