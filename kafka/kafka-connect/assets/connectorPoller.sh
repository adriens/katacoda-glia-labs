#!/bin/sh

while true; do

    curl -X GET http://localhost:8083/connectors/postgresql-sms-sink-connector/status | jq
    sleep 2;

done

