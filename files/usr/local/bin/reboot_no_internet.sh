#!/bin/bash
#
# host to ping. We cannot use google.com or 8.8.8.8 because of VUB restrictions. 
HOST="8.8.8.8"
# after how many hours of no internet should it reboot?
TIME=4
TEMPFILE=/tmp/.count.tmp

if [ ! -f $TEMPFILE ]; then
    touch $TEMPFILE;
    echo 0 > $TEMPFILE;
fi

COUNTER=$[$(cat $TEMPFILE)]

count=$(ping -c 5 $HOST | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')

# If not a number, assume failure
re='^[0-9]+$'
if ! [[ $count =~ $re ]] ; then
   count=0;
fi

if [ $count -eq 0 ]; then
	COUNTER=$[$(cat $TEMPFILE) + 1]
	echo $COUNTER > $TEMPFILE
	/usr/local/bin/sendAlert.sh "No internet ($COUNTER/$TIME)" "Couldn't ping $HOST for the $COUNTER time. When $TIME is reached I'll reboot."
fi

# checked once per hour via cron.
if [ $COUNTER -gt $TIME ]; then
	/usr/local/bin/sendAlert.sh "No internet: rebooting" "Couldn't ping $HOST for $TIME hours, so I decided to reboot."
	/sbin/reboot
fi
