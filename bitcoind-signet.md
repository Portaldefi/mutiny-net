# Bitcoin Signet Docker Image

## ENV Variables

* **`BLOCKPRODUCTIONDELAY`** — Delay between mining blocks (**mining mode only**).  
  If `~/.bitcoin/BLOCKPRODUCTIONDELAY.txt` is present, it will use the value from this file, allowing the delay to be dynamically adjusted.

* **`MINERENABLED`** — Flag to enable the mining chain.

* **`NBITS`** — Sets the minimum difficulty for mining (**mining mode only**).

* **`PRIVKEY`** — Private key for the signet signer (**mining mode only**).  
  If `MINERENABLED=1` and not provided, a new key will be generated.

* **`MINETO`** — Address to mine to. If not provided, a new address will be generated for each block (**mining mode only**).

* **`SIGNETCHALLENGE`** — Sets the valid block producer for this signet.  
  If `MINERENABLED=1` and not provided, it will generate one. If provided, `PRIVKEY` must also be populated.  
  **Required for client mode.**

* **`RPCUSER`** — RPC username for connecting to bitcoind.

* **`RPCPASSWORD`** — RPC password for connecting to bitcoind.

* **`ONIONPROXY`** — Tor SOCKS5 proxy endpoint.

* **`TORPASSWORD`** — Tor control port password.

* **`TORCONTROL`** — Tor control port endpoint.

* **`I2PSAM`** — I2P control endpoint.

* **`UACOMMENT`** — User Agent comment that will show in the `bitcoin-cli -netinfo` printout.

* **`ZMQPUBRAWBLOCK`** — bitcoind setting for publishing raw block data.

* **`ZMQPUBRAWTX`** — bitcoind setting for publishing raw transaction data.

* **`ZMQPUBHASHBLOCK`** — bitcoind setting for publishing block hash data.

* **`RPCBIND`** — bitcoind setting for binding RPC.

* **`RPCALLOWIP`** — bitcoind setting for allowed IP addresses.

* **`WHITELIST`** — bitcoind setting for whitelisted IP addresses.

* **`ADDNODE`** — Add seeding node location (comma-separated for multiple nodes).  
  **Required for client mode.**

* **`EXTERNAL_IP`** — Add public IP or Onion endpoint information (comma-separated for multiple IPs).


