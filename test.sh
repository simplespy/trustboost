echo "Deleting old wasmd keys..."
wasmd keys delete ibc-0 -y &> /dev/null
wasmd keys delete ibc-1 -y &> /dev/null
wasmd keys delete ibc-2 -y &> /dev/null
echo "Adding new wasmd keys..."


export mnemonic0=$(cat data/ibc-0/key_seed.json | jq .mnemonic -r)
export mnemonic1=$(cat data/ibc-1/key_seed.json | jq .mnemonic -r)
export mnemonic2=$(cat data/ibc-2/key_seed.json | jq .mnemonic -r)
export password="12345678"

{ echo "$mnemonic0"; echo $password; } | wasmd keys add ibc-0 --recover
{ echo "$mnemonic1"; echo $password; } | wasmd keys add ibc-1 --recover
{ echo "$mnemonic2"; echo $password; } | wasmd keys add ibc-2 --recover

wasmd tx wasm store nameservice/target/wasm32-unknown-unknown/release/cw_nameservice.wasm --node http://127.0.0.1:26550 --from user --chain-id ibc-0 --gas-prices 0.025stake --gas auto --gas-adjustment 1.5 --broadcast-mode block -y --keyring-backend test --home data/ibc-0