docker stop caddy
docker rm caddy
docker-compose up -d caddy
docker logs caddy -f