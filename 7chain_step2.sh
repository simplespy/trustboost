#!/bin/bash

WASMD_DATA="$(pwd)/data"


echo "Generating rly configurations..."
rly config init
rly config add-chains configs/wasmd/7chains/chains

SEED0=$(jq -r '.mnemonic' $WASMD_DATA/ibc-0/testkey_seed.json)
SEED1=$(jq -r '.mnemonic' $WASMD_DATA/ibc-1/testkey_seed.json)
SEED2=$(jq -r '.mnemonic' $WASMD_DATA/ibc-2/testkey_seed.json)
SEED3=$(jq -r '.mnemonic' $WASMD_DATA/ibc-3/testkey_seed.json)
SEED4=$(jq -r '.mnemonic' $WASMD_DATA/ibc-4/testkey_seed.json)
SEED5=$(jq -r '.mnemonic' $WASMD_DATA/ibc-5/testkey_seed.json)
SEED6=$(jq -r '.mnemonic' $WASMD_DATA/ibc-6/testkey_seed.json)

echo "Key $(rly keys restore ibc-0 testkey "$SEED0") imported from ibc-0 to relayer..."
echo "Key $(rly keys restore ibc-1 testkey "$SEED1") imported from ibc-1 to relayer..."
echo "Key $(rly keys restore ibc-2 testkey "$SEED2") imported from ibc-2 to relayer..."
echo "Key $(rly keys restore ibc-3 testkey "$SEED3") imported from ibc-3 to relayer..."
echo "Key $(rly keys restore ibc-4 testkey "$SEED4") imported from ibc-4 to relayer..."
echo "Key $(rly keys restore ibc-5 testkey "$SEED5") imported from ibc-5 to relayer..."
echo "Key $(rly keys restore ibc-6 testkey "$SEED6") imported from ibc-6 to relayer..."

rly config add-paths configs/wasmd/7chains/paths

set +x
