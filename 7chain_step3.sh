#!/bin/bash

target=$1


set –e


. ./updatekey.sh $target


echo "deploying NS start.....--------------------------------"
./helper deployNSMany $target
echo "deploying NS done.....--------------------------------"
sleep 2


echo "deploying TB Start....."
./helper deployMany $target
echo "deploying TB done....."
sleep 2

echo "Kiling relayers..."
killall rly
echo "Deleting all relayer logs...."
rm -rf ./relayer_logs/*
mkdir ./relayer_logs
echo "Starting all relayers in the background...."


end_index=$(expr $target - 1)
for i in $(seq 0 $end_index)
do
    start_index=$(expr $i + 1)
    # zsh will overshoot indexes
    if [ $start_index -gt $end_index ]; then
        break
    fi

    for j in $(seq $start_index $end_index)
    do 
        set -e
        #set -x
        echo "start mypath$i-$j"
        #rly start mypath$i-$j --debug-addr localhost:75$i$j 2>&1 >./relayer_logs/mypath$i-$j.log &
        rly start mypath$i-$j --debug-addr localhost:75$i$j 2>./relayer_logs/mypath$i-$j.log &
    done
done 


echo "All relayers have been started... Check ./relayer_logs for logs.. Please wait for a few second before starting to send messages"
echo $(date)
