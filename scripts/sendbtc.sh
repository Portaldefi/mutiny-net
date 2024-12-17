
peer=$(./peer.sh 1)
sssh="ssh -n -i ../notes/portal-net.pem -o LogLevel=QUIET ubuntu"
btc="docker exec bitcoind bitcoin-cli sendtoaddress $1 100"

$sssh@$peer -t "$btc"
