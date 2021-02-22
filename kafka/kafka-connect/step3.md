
Create the `postgresql-sms-sink.json` connector.

## Plugin installation

Download and extract `confluentinc-kafka-connect-jdbc` plugin

```
clear
wget https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-jdbc/versions/10.0.1/confluentinc-kafka-connect-jdbc-10.0.1.zip \
--directory-prefix plugins
unzip -qq  plugins/confluentinc-kafka-connect-jdbc-10.0.1.zip -d plugins/
```{{execute}}

Restart `Kafka-connect` container

```
docker restart confluent-connect
```{{execute T1}}

## Check Kafka-connect status

First, we ensure if `kafka-connect` is up and ready

```
docker logs -f confluent-connect | grep "Kafka Connect started"
```{{execute T1}}

Exit the logging viewer

`^C`{{execute ctrl-seq}}

```
clear
```{{execute T1}}

## Send configuration file

```
curl http://localhost:8083/connectors \
    -X POST \
    -H "Content-Type: application/json" \
    --data @postgresql-sms-sink.json | jq
```{{execute T1}}

It is in the [postgresql-sms-sink.json](https://github.com/adriens/presentation-kafka-connect/blob/main/connectors/postgresql-sms-sink.json) where configuration like output database, table, etc. and credentials are defined.

## Connector status

Check connector's state :

```
curl -X GET http://localhost:8083/connectors/postgresql-sms-sink-connector/status | jq
```{{execute T1}}

> Kafka and the postgreSQL are now *linked*
