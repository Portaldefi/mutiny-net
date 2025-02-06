# Mutinynet

This repository contains most of the deployment for [Mutinynet](https://mutinynet.com). It originally started as a fork of [Plebnet](https://github.com/nbd-wtf/bitcoin_signet), but has since evolved to include much more.

The main deployment is managed with Docker Compose and includes various services:

* [bitcoind](https://github.com/bitcoin/bitcoin)
* [lnd](https://github.com/lightningnetwork/lnd)
* [rgs server](https://github.com/lightningdevkit/rapid-gossip-sync-server)
* Faucet ([frontend](https://github.com/MutinyWallet/mutinynet-faucet) and [backend](https://github.com/MutinyWallet/mutinynet-faucet-rs))
* [mempool.space instance](https://github.com/mempool/mempool/)
* [electrs](https://github.com/romanz/electrs)
* [cashu mint](https://github.com/cashubtc/nutshell)

Most of these services use the official Docker images pulled from Docker Hub, but there are also a few custom services:

* **`bitcoind`** - A [custom build of bitcoind](https://github.com/benthecarman/bitcoin/releases) with soft forks and a 30-second block time. It also includes scripts for mining signet blocks.
* **`electrs`** - A small fork of electrs with a Dockerfile and some fixes for signet, though these fixes were ultimately not necessary.
* **`rapid-gossip-sync-server`** - A fork of the rapid-gossip-sync-server to allow for a 10-minute snapshot interval. At the time, there was no way to change the interval in the project, but it has worked fine so far, and the original issue was never updated.

## Running

To run the deployment, you need to have Docker and Docker Compose installed. Then you can execute the following command:

```bash
docker-compose up -d
```

This will start all the services. You can view the logs with:

```bash
docker-compose logs -f
```

To run specific services individually:

```bash
docker-compose up -d bitcoind lnd rgs_server
```

You can create some aliases to simplify interactions with `bitcoind` and `lnd`:

```bash
alias lncli="docker exec -it lnd /bin/lncli -n signet"
alias bitcoin-cli="docker exec -it bitcoind /usr/local/bin/bitcoin-cli"
```

## Updating

To update the deployment, run:

```bash
git pull
docker-compose pull
```

Then restart the services:

```bash
docker-compose up -d
```
