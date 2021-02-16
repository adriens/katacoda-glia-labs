In the case where the sink database is not operational but the messsages continue to be produced on the topic, let's see the data's behaviour on recovery.

## Stop the database

```
docker stop postgres-sink
```{{execute T1}}

## Produce some data

```
{"phoneNumberEmitter":"123546","phoneNumberReceiver":"321654","message":"Il est bon ou quoi?"}
{"phoneNumberEmitter":"654987","phoneNumberReceiver":"789456","message":"Net"}
{"phoneNumberEmitter":"112233","phoneNumberReceiver":"445566","message":"Sakébon"}
{"phoneNumberEmitter":"665544","phoneNumberReceiver":"998877","message":"Kalolo alors"}
{"phoneNumberEmitter":"789987","phoneNumberReceiver":"456654","message":"Ok tal"}
```{{execute T2}}

## Check topic

At this state, we can read `demo.json.sms` topic to be sure if the messages are in it.
Go to `Consumer` tab to view it.

#### Restart the sink database

```
docker start postgres-sink
```{{execute T1}}

## Restart kafka-connect task

```
curl -X GET http://localhost:8083/connectors/postgresql-sms-sink-connector/status | jq
```{{execute T1}}

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
select "phoneNumberReceiver" receiver, message, "phoneNumberEmitter" emitter from sms;
```{{execute T4}}