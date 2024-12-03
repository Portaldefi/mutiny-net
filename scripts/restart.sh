if [ $# -eq 0 ]; then
  echo "Error: No arguments provided."
  exit 1
fi

echo "restart $1"
docker stop $1
docker rm $1
docker-compose up -d $1
docker logs $1 -f