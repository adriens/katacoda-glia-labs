> Optional, only for live transfer viewing

## Produce messages

```
./produceMessage.sh 123546 321654 "Testing is easier..."
./produceMessage.sh 789456 321654 "A clever person"
./produceMessage.sh 112233 445566 "Real programmers..."
./produceMessage.sh 665544 998877 "Talk is cheap"
./produceMessage.sh 789987 456654 "The computer was born"
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
