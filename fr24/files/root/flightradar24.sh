#!/bin/bash
KEY=EDIT
DIR=/root/
### pro script
cd $DIR
# Start dump1090
cd dump1090
# I run on port 8888 because 8080 is taken on my rasp
screen -dmS dump ./dump1090 --interactive --net --net-beast --net-ro-port 31001 --net-http-port 8888
cd ..
# Start Flightradar24
screen -dmS flightradar24 ./flightradar24 --fr24key=$KEY
