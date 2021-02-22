> Optional, only for live transfer viewing

## Produce messages

```
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"123546\",\"phoneNumberReceiver\":\"321654\",\"message\":\"Testing is easier than debugging\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"654987\",\"phoneNumberReceiver\":\"789456\",\"message\":\"A clever person solves a problem.\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"112233\",\"phoneNumberReceiver\":\"445566\",\"message\":\"Real programmers don\'t comment their code.\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"665544\",\"phoneNumberReceiver\":\"998877\",\"message\":\"Talk is cheap. Show me the code\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"789987\",\"phoneNumberReceiver\":\"456654\",\"message\":\"The computer was born to solve problems\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
```{{execute T2}}

Check it out the Consumer tabs !

## Take a look on Sink database

```
select
    to_timestamp(timestamp) AT TIME ZONE 'Pacific/Noumea' as upddate,
    "phoneNumberReceiver" receiver,
    message,
    "phoneNumberEmitter" emitter
from sms
order by timestamp desc;
```{{execute T4}}
