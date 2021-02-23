Here we will a basic example scenario

## Stop kafka-connect

```
docker stop confluent-connect
```{{execute T1}}

## Start the daemon

```
bash "sendSMSDaemon.sh"
```{{execute T5}}

## Database operations

```
create table bi_sms as select * from sms where 1=0;
```{{execute T4}}

```
insert into bi_sms select * from sms;
```{{execute T4}}

```
truncate sms;
vacuum full analyze sms;
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