

od -An -v -tx1 /lnd/data/chain/bitcoin/signet/readonly.macaroon | tr -d ' \n'

od -An -v -tx1 /lnd/tls.cert | tr -d ' \n'
