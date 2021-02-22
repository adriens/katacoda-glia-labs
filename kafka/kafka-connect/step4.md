
In this step, we will produce messages according a specific structure :

<pre><code>{
    "type": "object",
    "properties": {
        "timestamp": {
            "type": "integer"
        },        
        "phoneNumberEmitter": {
            "type": "string"
        },
        "phoneNumberReceiver": {
            "type": "string"
        },
        "message": {
            "type": "string"
        }
    }
}</code></pre>

## Create the producer

Run a `confluentinc/cp-schema-registry:6.0.1` container in [interactive mode](https://docs.docker.com/engine/reference/commandline/run/#assign-name-and-allocate-pseudo-tty---name--it)

```
echo "Open in Producer terminal"
```{{execute T2}}

```
docker run -it --net=host --rm --name kafka-json-producer confluentinc/cp-schema-registry:6.0.1 bash
```{{execute T2}}

## Produce messages

```
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"112233\",\"phoneNumberReceiver\":\"445566\",\"message\":\"Don't worry, be happy\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
```{{execute T2}}

another data examples below :

```
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"332211\",\"phoneNumberReceiver\":\"665544\",\"message\":\"The last but not least\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"445566\",\"phoneNumberReceiver\":\"778899\",\"message\":\"You shall not pass\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
echo {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"778899\",\"phoneNumberReceiver\":\"665544\",\"message\":\"It's dangerous to go alone\"} | kafka-json-schema-console-producer --broker-list localhost:9092 --topic demo.json.sms --property schema.registry.url=http://localhost:8081 --property value.schema='{"type":"object","properties":{"timestamp":{"type": "integer"},"phoneNumberEmitter":{"type":"string"},"phoneNumberReceiver":{"type":"string"},"message":{"type":"string"}},"additionalProperties":false}'
```{{execute T2}}
