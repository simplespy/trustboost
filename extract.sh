#!/bin/bash
flag=$2
target=$1

if [ $flag -eq 0 ]; then
    for (( c=1; c<=5; c++ ))
    do
        grep -o "9[[:digit:]]\{10\}" results/$target/relayerBalance_before_$c.txt
        echo
    done
fi

if [ $flag -eq 1 ]; then
    for (( c=1; c<=5; c++ ))
    do
        grep -o "9[[:digit:]]\{10\}" results/$target/relayerBalance_after_$c.txt
        echo
    done
fi

if [ $flag -eq 2 ]; then
    for (( c=1; c<=5; c++ ))
    do
        grep -o "9[[:digit:]]\{10\}" results/$target/userBalance_before_$c.txt
        echo
    done
fi

if [ $flag -eq 3 ]; then
    for (( c=1; c<=5; c++ ))
    do
        grep -o "9[[:digit:]]\{10\}" results/$target/userBalance_after_$c.txt
        echo
    done
fi


if [ $flag -eq 4 ]; then
    for (( c=1; c<=5; c++ ))
    do
        grep "seconds_duration: " results/$target/state_$c.txt | sed 's/^.*: //'
        echo
    done
fi

