
Now, we can launch the environment using [`docker-compose`](https://docs.docker.com/compose/)

```
clear
docker-compose --project-name kafka-connect-pgsql -f kafka-connect.yml up -d
```{{execute T1}}

List containers and show their status

```
docker-compose --project-name kafka-connect-pgsql -f kafka-connect.yml ps
```{{execute T1}}

> The `docker-compose` file can be viewed [here](https://github.com/adriens/presentation-kafka-connect/blob/main/uses-case.yml).

## Explanations

With this single line command, we have :

- a minimalist `kafka` environment with `zookeeper`
- an up and running [`postgreSQL`](https://www.postgresql.org/) database
- the new [`confluent`](https://www.confluent.io/) elements :
  - [schema-registry](https://docs.confluent.io/platform/current/schema-registry/index.html) - *"It provides a RESTful interface for storing and retrieving your Avro, JSON Schema, and Protobuf schemas."*
  - [`kafka-connect`](https://docs.confluent.io/platform/current/connect/index.html) - *"Kafka Connect is a tool for scalably and reliably streaming data between Apache Kafka and other data systems."*

