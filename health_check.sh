#!/bin/bash

group_GID='X'
user_ID='X'
bot_token=X
msg='website failed.'
target_url='http://www.google.com.tw'
frequency=30m

while [ 1 ];
do
    code=`curl -o /dev/null -s -w "%{http_code}\n" $target_url`
    if [ "$code" != "200" ]
    then
        echo "service down at `date`"
        curl -X POST "https://api.telegram.org/bot$bot_token/sendMessage" \
        -d "chat_id=$user_ID&text=$msg"
        echo ""
        echo "Message was send."
        echo "--------------------------------------------------"
    else
        echo "website is well at `date`"
    fi
    sleep 30m
done
