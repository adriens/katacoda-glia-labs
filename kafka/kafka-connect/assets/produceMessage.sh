#!/bin/sh

urlKafkaApi="http://localhost:8082/topics/demo.json.sms"

# post
data='{"value_schema": "{\"type\":\"object\",\"properties\":{\"timestamp\":{\"type\": \"integer\"},\"phoneNumberEmitter\":{\"type\":\"string\"},\"phoneNumberReceiver\":{\"type\":\"string\"},\"message\":{\"type\":\"string\"}},\"additionalProperties\":false}}", "records": [{"value": {"timestamp": '$(date +%s)',"phoneNumberEmitter":"'$1'", "message":"'$3'", "phoneNumberReceiver":"'$2'"}}]}'
curl -s -H "Content-Type: application/vnd.kafka.jsonschema.v2+json" -H "Accept: application/vnd.kafka.v2+json" -X POST "$urlKafkaApi" -d "$data"