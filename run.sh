#!/bin/bash

local_md5=''
group_GID='X'
user_ID='X'
bot_token=X
msg='網站已變動'
target_url='http://www.google.com.tw'
frequency=30m

while [ 1 ];
do
    online_md5=`curl -s $target_url | md5sum`
    if [ "$online_md5" != "$local_md5" ]
    then
        echo "website update at `date`"
        curl -X POST "https://api.telegram.org/bot$bot_token/sendMessage" \
        -d "chat_id=$user_ID&text=$msg"
        echo ""
        echo "Message was send."
        echo "--------------------------------------------------"
        local_md5=$online_md5
    else
        echo "web page no update at `date`"
    fi
    sleep $frequency
done
