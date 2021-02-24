Here we will a basic example scenario

## Stop kafka-connect

```
docker stop confluent-connect
```{{execute T1}}

## Start the daemon

To send to topic kafka messages continuously

```
bash "sendSMSDaemon.sh"
```{{execute T5}}

## Database operations

### Create business and persistent data table

```
create table bi_sms as select * from sms where 1=0;
```{{execute T4}}

### Insert ALL rows from sms landing table to the business table

```
insert into bi_sms select * from sms;
```{{execute T4}}

### Clean the langing table

```
truncate sms;
vacuum full analyze sms;
```{{execute T4}}

## Restart kafka-connect

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