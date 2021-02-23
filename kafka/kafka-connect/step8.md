Here we will a basic example scenario

## Stop kafka-connect

```
docker stop confluent-connect
```{{execute T1}}

## Start the daemon

```
sh "sendSMSDaemon.sh"
```{{execute T5}}

```
curl -X POST -H "Content-Type: application/vnd.kafka.jsonschema.v2+json" \
   -H "Accept: application/vnd.kafka.v2+json" \
   --data '{"value_schema": "{\"type\":\"object\",\"properties\":{\"timestamp\":{\"type\": \"integer\"},\"phoneNumberEmitter\":{\"type\":\"string\"},\"phoneNumberReceiver\":{\"type\":\"string\"},\"message\":{\"type\":\"string\"}},\"additionalProperties\":false}}", "records": [{"value": {"timestamp": 123456789,"phoneNumberEmitter":"665544","phoneNumberReceiver":"998877","message":"Talk is cheap. Show me the code"}}]}' \
   "http://localhost:8082/topics/demo.json.sms"
```{{execute T2}}

## Database operations

```
create table bi_sms as select * from sms where 1=0;
```{{execute T4}}

```
insert into bi_sms select * from sms;
```{{execute T4}}

```
truncate sms
vacuum full analyze sms
```{{execute T4}}

## Start kafka-connect

```
docker start confluent-connect
```{{execute T1}}


```
select
    to_timestamp(timestamp) AT TIME ZONE 'Pacific/Noumea' as upddate,
    "phoneNumberReceiver" receiver,
    message,
    "phoneNumberEmitter" emitter
from sms
order by timestamp desc;
```{{execute T4}}