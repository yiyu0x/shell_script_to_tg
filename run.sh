#!/bin/bash
local_md5='8e47a10390273fa6f8c5cb59aae98685  -'
usp_GID='X'
yiyu_ID='X'
bot_token=X
msg='http://erdos.csie.ncnu.edu.tw/~klim/unix-p/usp-1072.html'
while [ 1 ];
do
    online_md5=`curl -s 'http://erdos.csie.ncnu.edu.tw/~klim/unix-p/usp-1072.html' | md5sum`
    if [ "$online_md5" != "$local_md5" ]
    then
    	echo "online_md5: $online_md5"
    	echo "local_md5 : $local_md5"
      	echo "`date`"
      	curl -X POST "https://api.telegram.org/bot$bot_token/sendMessage" \
		-d "chat_id=$usp_GID&text=$msg"
      	echo ""
      	echo "Message was send."
      	echo "--------------------------------------------------"
      	local_md5=$online_md5
	else
		echo "web page no update at `date`"
    fi
    sleep 30m
done

# curl -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$yiyu_ID&text=$msg"
