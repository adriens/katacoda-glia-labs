Here we will see a basic example scenario

## 1. Stop kafka-connect

```
clear
docker stop confluent-connect
```{{execute T1}}

```
docker-compose --project-name kafka-connect-pgsql -f kafka-connect.yml ps
```{{execute T1}}

## 2. Start the daemon

To send to topic kafka messages continuously

```
bash sendSMSDaemon.sh
```{{execute T5}}

## 3.1 Create *business table* `bi_sms`

```
create table bi_sms as select * from sms where 1=0;
```{{execute T4}}

## 3.2 Insert ALL rows from the *landing table* `sms` to the business table

```
insert into bi_sms select * from sms;
```{{execute T4}}

## 3.3 Clean the landing table

```
truncate sms;
vacuum full verbose analyze sms;
```{{execute T4}}

## 4. Restart kafka-connect

```
docker start confluent-connect
```{{execute T1}}

Retrieve his status :

```
sh connectorPoller.sh
```{{execute T1}}

Stop the polling :

`^C`{{execute ctrl-seq}}

## 5. Check the landing table

```
select count(1) as nb_lignes from sms;
```{{execute T4}}

```
select
    to_timestamp(timestamp) AT TIME ZONE 'Pacific/Noumea' as upddate,
    "phoneNumberReceiver" receiver,
    message,
    "phoneNumberEmitter" emitter
from sms
order by timestamp desc;
```{{execute T4}}

Exit

```
q
```{{execute T4}}