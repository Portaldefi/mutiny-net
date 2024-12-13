
docker-compose up -d bitcoind

docker-compose up -d lnd

docker-compose up -d electrs

sudo apt-get remove -y apache2

# docker-compose up -d caddy