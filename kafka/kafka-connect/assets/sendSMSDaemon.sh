#!/bin/sh

#
# name : sendSMSDaemon
# /!\ Attention `jq` command required (https://stedolan.github.io/jq/) /!\
#

# urls api
urlRandomNamesApi="https://randomuser.me/api/?nat=gb&inc=name"
urlKafkaApi="http://localhost:8082/topics/demo.json.sms"

# tests phone numbers
# corresponding to users filled in topic `demo.user` :
# {"timestamp":1614033157,"phoneNumberEmitter":"123546","phoneNumberReceiver":"321654","message":"Testing is easier than debugging"}
# {"timestamp":1614033160,"phoneNumberEmitter":"654987","phoneNumberReceiver":"789456","message":"A clever person solves a problem."}
phoneNumbers=("112233" "446655" "998877")

# main
while true; do

    # random emitter
    randomIndex=$[$RANDOM % ${#phoneNumbers[@]}]
    emitter=${phoneNumbers[randomIndex]}

    # random name to include in message
    response=$(curl -H "Accept: application/json" -H "Content-Type: application/json;charset=utf-8" -XGET -s "$urlRandomNamesApi")
    randomName=$(echo $response | jq -r '.results[0].name.first')
    message="Bonjour $randomName, tout va bien?"
    
    # random receiver
    receiver=$((100000 + RANDOM % 999999))

    # print
    echo -e "Emitter : \t [$emitter]"
    echo -e "Message : \t [$message]"    
    echo -e "Receiver : \t [$receiver]"

    # post
    data='{"value_schema": "{\"type\":\"object\",\"properties\":{\"timestamp\":{\"type\": \"integer\"},\"phoneNumberEmitter\":{\"type\":\"string\"},\"phoneNumberReceiver\":{\"type\":\"string\"},\"message\":{\"type\":\"string\"}},\"additionalProperties\":false}}", "records": [{"value": {\"timestamp\": $(date +%s),\"phoneNumberEmitter\":\"$emitter\", \"message\":\"$message\", \"phoneNumberReceiver\":\"$receiver\"}}]}'
    curl -s -H "Content-Type: application/vnd.kafka.jsonschema.v2+json" -H "Accept: application/vnd.kafka.v2+json" -X POST "$urlKafkaApi" -d "$data"

    echo -e "\r\n======================="

    sleep 2;

done

