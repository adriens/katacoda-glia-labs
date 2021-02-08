Now let's consume events :

```
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```{{execute T6}}

Feel free to experiment: for example switch back to your producer terminal (previous step, `terminal 5`)
 to write additional events, and see how the events immediately show up in your current consumer terminal.

Because events are durably stored in Kafka, they can be read as many times and by as many consumers
as you want. You can easily verify this by opening yet another terminal session and re-running the
previous command again.

