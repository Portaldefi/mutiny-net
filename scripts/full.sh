
PEER=$1

./peers.sh $PEER deps

./peers.sh $PEER clone

./peers.sh $PEER setup

ADDR="$(./peers.sh $PEER newaddr | jq '.address' | tr -d '"')"
if [[ $ADDR != "tb1"* ]]; then
    echo "=> invalid address $ADDR"
    exit 0
fi

echo "=> address: $ADDR"

echo "=> pay 100 btc to $ADDR"
./sendbtc.sh $ADDR

echo "=> waiting 60 for BTC..."
sleep 60

echo "=> waiting 60 for LND to startup..."
sleep 60

echo "=> open 1"
./peers.sh $PEER open1

echo "=> waiting 60 for change..."
sleep 60

echo "=> open 2"
./peers.sh $PEER open2

echo "=> waiting 330 for channels to confirm..."
sleep 330

echo "=> pay to check"
./peers.sh $PEER pay

echo "=> LN pubkey"
./peers.sh $PEER id