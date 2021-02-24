
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

```
echo "Open in Producer terminal"
```{{execute T2}}

## Produce messages

```
sh produceMessage.sh 112233 445566 "Don't worry, be happy"
sh produceMessage.sh 332211 665544 "The last but not least"
sh produceMessage.sh 445566 665544 "You shall not pass"
sh produceMessage.sh 778899 168799 "It's dangerous to go alone"
```{{execute T2}}
