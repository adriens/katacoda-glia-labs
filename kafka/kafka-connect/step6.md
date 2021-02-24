> Optional, only for live transfer viewing

## Produce messages

```
sh produceMessage.sh 123546 321654 "Testing is easier..."
sh produceMessage.sh 789456 321654 "A clever person"
sh produceMessage.sh 112233 445566 "Real programmers..."
sh produceMessage.sh 665544 998877 "Talk is cheap"
sh produceMessage.sh 789987 456654 "The computer was born"
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
