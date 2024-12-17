
docker-compose up -d bitcoind

docker-compose up -d lnd

docker-compose up -d electrs

docker-compose up -d mempool_db

docker-compose up -d mempool_api

docker-compose up -d mempool_web

sudo apt-get remove -y apache2

# docker-compose up -d caddy
