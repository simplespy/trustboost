#!/bin/bash
# two-chainz creates two wasmd chains and configures the relayer to 

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WASMD_DATA="$(pwd)/data"
RELAYER_DIR="$(dirname $SCRIPTDIR)"
RELAYER_CONF="$HOME/.relayer"

set -e

rm -rf data/ibc-$1
rm data/ibc-$1.log

chainid0=ibc-0
chainid1=ibc-1
chainid2=ibc-2
chainid3=ibc-3
chainid4=ibc-4
chainid5=ibc-5
chainid6=ibc-6

#./one-chain wasmd $chainid0 ./data 26550 26660 6060 9090
./one-chain wasmd ibc-$1 ./data 2655$1 2666$1 606$1 909$1
#./one-chain wasmd $chainid3 ./data 26553 26663 6063 9093
#./one-chain wasmd $chainid2 ./data 26552 26662 6062 9092
#./one-chain wasmd $chainid4 ./data 26554 26664 6064 9094
#./one-chain wasmd $chainid5 ./data 26555 26665 6065 9095
#./one-chain wasmd $chainid6 ./data 26556 26666 6066 9096


#[ -f $WASMD_DATA/$chainid0.log ] && echo "$chainid0 initialized. Watch file $WASMD_DATA/$chainid0.log to see its execution."
[ -f $WASMD_DATA/ibc-$1.log ] && echo "ibc-$1 initialized. Watch file $WASMD_DATA/ibc-$1.log to see its execution."
#[ -f $WASMD_DATA/$chainid2.log ] && echo "$chainid2 initialized. Watch file $WASMD_DATA/$chainid2.log to see its execution."
#[ -f $WASMD_DATA/$chainid3.log ] && echo "$chainid3 initialized. Watch file $WASMD_DATA/$chainid3.log to see its execution."
#[ -f $WASMD_DATA/$chainid4.log ] && echo "$chainid4 initialized. Watch file $WASMD_DATA/$chainid4.log to see its execution."
#[ -f $WASMD_DATA/$chainid5.log ] && echo "$chainid5 initialized. Watch file $WASMD_DATA/$chainid5.log to see its execution."
#[ -f $WASMD_DATA/$chainid6.log ] && echo "$chainid6 initialized. Watch file $WASMD_DATA/$chainid6.log to see its execution."

