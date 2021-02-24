
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
sh produceMessage.sh 112233 445566 "Don't worry, be happy"
sh produceMessage.sh 332211 665544 "The last but not least"
sh produceMessage.sh 445566 665544 "You shall not pass"
sh produceMessage.sh 778899 168799 "It's dangerous to go alone"
```{{execute T2}}
