export mnemonic0=$(cat data/ibc-0/key_seed.json | jq .mnemonic -r)
export mnemonic1=$(cat data/ibc-1/key_seed.json | jq .mnemonic -r)
export mnemonic2=$(cat data/ibc-2/key_seed.json | jq .mnemonic -r)
export mnemonic3=$(cat data/ibc-3/key_seed.json | jq .mnemonic -r)
export password="12345678"

echo "Deleting old wasmd keys..."
{ echo $password; } | wasmd keys delete ibc-0 -y
{ echo $password; } | wasmd keys delete ibc-1 -y
{ echo $password; } | wasmd keys delete ibc-2 -y
{ echo $password; } | wasmd keys delete ibc-3 -y



{ echo "$mnemonic0"; echo $password; } | wasmd keys add ibc-0 --recover
{ echo "$mnemonic1"; echo $password; } | wasmd keys add ibc-1 --recover
{ echo "$mnemonic2"; echo $password; } | wasmd keys add ibc-2 --recover
{ echo "$mnemonic3"; echo $password; } | wasmd keys add ibc-3 --recover

