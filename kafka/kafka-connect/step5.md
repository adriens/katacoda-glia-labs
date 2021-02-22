Data visualisations on differents steps.

## Topic

First, we consume the topic `demo.json.sms`...

```
echo "Open in Consumer terminal"
```{{execute T3}}

```
docker run --net=host --rm wurstmeister/kafka:2.11-2.0.0 sh opt/kafka_2.11-2.0.0/bin/kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --topic demo.json.sms \
    --from-beginning
```{{execute T3}}

## Database

... And the final destination in the postgreSQL database. Let's running a pgsql container

```
echo "Open in PostgreSQL terminal"
```{{execute T4}}

```
docker run --name postgres-psql -it --rm --network host postgres psql -h localhost -p 5433 -U user -d db
```{{execute T4}}

Fill the password

```
password
```{{execute T4}}

And ensure all messages are stored on sink database

```
select
    to_timestamp(timestamp) AT TIME ZONE 'Pacific/Noumea' as upddate,
    "phoneNumberReceiver" receiver,
    message,
    "phoneNumberEmitter" emitter
from sms
order by timestamp desc;
```{{execute T4}}
