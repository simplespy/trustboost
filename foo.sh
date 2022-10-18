#!/bin/bash

for (( port=$1; port<$(($1+4)); port++ ))
do
	echo $port
done