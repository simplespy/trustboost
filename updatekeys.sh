#!/bin/bash
password="12345678"
for (( c=0; c<$1; c++ ))
do
	mnemonic=$(cat data/ibc-$c/key_seed.json | jq .mnemonic -r)
    echo $c
    { echo $password; } | wasmd keys delete ibc-$c -y
    { echo "$mnemonic"; echo $password; } | wasmd keys add ibc-$c --recover
done