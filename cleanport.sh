#!/bin/bash
for (( port=26550; port<=26559; port++ ))
do
	pid=$(sudo lsof -i :$port -t)
	echo $pid
	kill -9 $pid
done

#!/bin/bash
for (( port=26660; port<=26669; port++ ))
do
	pid=$(sudo lsof -i :$port -t)
	echo $pid
	kill -9 $pid
done