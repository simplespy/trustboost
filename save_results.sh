#!/bin/bash

target=$1
number=$2
before=$3

if [ $before -eq 0 ]; then
    echo "Save balances before"
    ./helper queryRelayerBalanceMany $target > results/$target/relayerBalance_before_$number.txt
    ./helper queryUserBalanceMany $target > results/$target/userBalance_before_$number.txt
fi

if [ $before -eq 1 ]; then
    echo "Save state and balances after"
    ./helper queryStateMany $target > results/$target/state_$number.txt
    ./helper queryRelayerBalanceMany $target > results/$target/relayerBalance_after_$number.txt
    ./helper queryUserBalanceMany $target > results/$target/userBalance_after_$number.txt
fi

if [ $before -eq 2 ]; then
    echo "Check state only"
    ./helper queryStateMany $target
fi