Here we will a basic example scenario

## Stop kafka-connect

```
docker stop confluent-connect
```{{execute T1}}

## Start the daemon

```
curl -X POST -H "Content-Type: application/vnd.kafka.jsonschema.v2+json" \
   -H "Accept: application/vnd.kafka.v2+json" \
   --data '{"value_schema": "{\"type\":\"object\",\"properties\":{\"timestamp\":{\"type\": \"integer\"},\"phoneNumberEmitter\":{\"type\":\"string\"},\"phoneNumberReceiver\":{\"type\":\"string\"},\"message\":{\"type\":\"string\"}},\"additionalProperties\":false}}", "records": [{"value": {"timestamp": 123456789,"phoneNumberEmitter":"665544","phoneNumberReceiver":"998877","message":"Talk is cheap. Show me the code"}}]}' \
   "http://localhost:8082/topics/demo.json.sms"
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