#!/bin/sh
if pgrep -x "ffserver" > /dev/null
then
    :
else
    nohup ffserver > /tmp/ffserver.log
fi