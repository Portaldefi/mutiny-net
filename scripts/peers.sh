#!/bin/bash

# ./peers.sh 7 deps
# ./peers.sh 7 chans
# ./peers.sh all chans
# ./peers.sh 7 lpchans

# Because "" will expands $ and \ while '' disables all expansions

source utils.sh

if [ "$1" != "all" ]; then # ===== start if not "all"

peer=$(./peer.sh $1)

if [ -z "$peer" ]; then
    echo "...no peer..."
    exit 1
fi
echo "=> peer: $peer (portal-net-$1)"

if [ "$2" == "ssh" ]; then
    $sssh@$peer
fi

if [ "$2" == "deps" ]; then
    echo "Installing deps..."
    $sssh@$peer "bash -s" < ./deps.sh
fi

if [ "$2" == "clone" ]; then
    $sssh@$peer -t git clone --recurse-submodules -b $BRANCH $REPO
    $sssh@$peer -t "cd mutiny-net && rm electrs/Cargo.lock"
fi

if [ "$2" == "setup" ]; then
    $sssh@$peer "cd mutiny-net && ./scripts/gen-env.sh $1 $ADDNODE"
    $sssh@$peer "cd mutiny-net && ./scripts/setup.sh"
fi

if [ "$2" == "newaddr" ]; then
    $sssh@$peer -t "$ln newaddress p2tr"
fi

if [ "$2" == "open1" ]; then
    $sssh@$peer -t "$ln connect $LP1@${peers["1"]}:9735"
    $sssh@$peer -t "$ln openchannel --local_amt 1000000000 --push_amt 490000000 $LP1"
fi

if [ "$2" == "open2" ]; then
    $sssh@$peer -t "$ln connect $LP2@${peers["1"]}:9736"
    $sssh@$peer -t "$ln openchannel --local_amt 1000000000 --push_amt 490000000 $LP2"
fi

if [ "$2" == "pay" ]; then
    $sssh@$peer -t "$ln sendpayment --dest $LP1 --keysend --amt 1000"
    $sssh@$peer -t "$ln sendpayment --dest $LP2 --keysend --amt 1000"
fi

utils $peer $2

fi # ===== end if not "all"

if [ "$1" == "all" ]; then

    while read -r line; do
        key="${line%=*}"
        peer="${line#*=}"
        echo "=> peer: $peer (portal-net-$key)"
        utils $peer $2
    done < <(./peer.sh $1)

fi

