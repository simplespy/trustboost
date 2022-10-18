export RPC="http://localhost:26550"
export CHAIN_ID="ibc-0"

export NODE=(--node $RPC)
export TXFLAG=($NODE --chain-id $CHAIN_ID --gas-prices 0.025stake --gas auto --gas-adjustment 1.5)

export NODE="--node $RPC"
export TXFLAG="${NODE} --chain-id ${CHAIN_ID} --gas-prices 0.025stake --gas auto --gas-adjustment 1.5"
echo $NODE
echo $TXFLAG

# see how many codes we have now
wasmd query wasm list-code $NODE

# now we store the bytecode on chain
# gas is huge due to wasm size... but auto-zipping reduced this from 1.8M to around 600k
# you can see the code in the result
RES=$(wasmd --home data/ibc-0 tx wasm store nameservice/target/wasm32-unknown-unknown/release/cw_nameservice.wasm --from ibc-0 --keyring-backend test $TXFLAG -y --output json -b block)