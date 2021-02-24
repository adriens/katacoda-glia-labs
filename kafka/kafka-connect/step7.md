In the case where the sink database is not operational but the messsages continue to be produced on the topic, let's see the data's behaviour on recovery.

## Stop the database

```
docker stop postgres-sink
```{{execute T1}}

## Produce some data

```
./produceMessage.sh 123546 321654 "Il est bon ou quoi?"
./produceMessage.sh 654987 789456 "Net"
./produceMessage.sh 112233 445566 "Sakébon"
./produceMessage.sh 112233 998877 "Kalolo alors"
./produceMessage.sh 112233 998877 "Ok tal"
```{{execute T2}}

## Check topic

At this state, we can read `demo.json.sms` topic to be sure if the messages are in it.
Go to `Consumer` tab to view it.

## Check Kafka-connect status

```
curl -X GET http://localhost:8083/connectors/postgresql-sms-sink-connector/status | jq
```{{execute T1}}

#### Restart the sink database

```
docker start postgres-sink
```{{execute T1}}

## Restart kafka-connect task

The task `0` is on a [`FAILED`](https://docs.confluent.io/home/connect/monitoring.html#connector-and-task-status) state, we have to restart it to send all message stayed in the topic

```
curl -X POST http://localhost:8083/connectors/postgresql-sms-sink-connector/tasks/0/restart
```{{execute T1}}

```
curl -X GET http://localhost:8083/connectors/postgresql-sms-sink-connector/status | jq
```{{execute T1}}

## Check table

Let's check it out the database to ensure all messages are there.

```
select
    to_timestamp(timestamp) AT TIME ZONE 'Pacific/Noumea' as upddate,
    "phoneNumberReceiver" receiver,
    message,
    "phoneNumberEmitter" emitter
from sms
order by timestamp desc;
```{{execute T4}}