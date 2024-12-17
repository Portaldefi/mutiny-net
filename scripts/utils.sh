
LP1="02a3ca626430b7fff769156fbe6d64fb083ae9d5191190c7c119b9023bcde6903f"
LP2="0296001d1e2e6ad17c95ee1109454f4148f3512f58894e924c7431a5b83bdc73a0"
REPO="https://github.com/Portaldefi/mutiny-net.git"
BRANCH="portal-net"
ADDNODE="3.137.8.82:38333"

# -n makes ssh not read from stdin and allow loops 
sssh1="ssh -i ../notes/portal-net.pem ubuntu"
sssh="ssh -n -i ../notes/portal-net.pem -o LogLevel=QUIET ubuntu"
ln="docker exec lnd lncli --network=signet"
lnchans="$ln listchannels | jq -r '.channels | length'"
formatchan=".channels | .[] | {active,remote_pubkey,remote_balance,local_balance}"


utils () {

    peer=$1

    if [ "$2" == "chans" ]; then
        $sssh@$peer -t "$lnchans"
    fi

    if [ "$2" == "id" ]; then
        $sssh@$peer -t "$ln getinfo" | jq -c -r {identity_pubkey}
    fi
    
    if [ "$2" == "lpchans" ]; then
        $sssh@$peer -t "$ln listchannels --peer=$LP1" | jq -c -r "$formatchan"
        $sssh@$peer -t "$ln listchannels --peer=$LP1" | jq -c -r "$formatchan"
    fi
}
