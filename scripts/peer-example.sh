# copy this file to peer.sh and add your peer ips

declare peers

peers["2"]="42.42.42.42"

if [ "$1" == "all" ]; then

for key in "${!peers[@]}"; do
    if [ ! -z "${peers[$key]}" ]; then
        echo "$key=${peers[$key]}"
    fi
done

fi

if [ "$1" != "all" ]; then

peer="${peers["$1"]}"
if [ -z "$peer" ]; then
    echo "...no peer..."
    exit 1
fi

echo "$peer"

fi