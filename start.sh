#/bin/sh
docker build -t ttt-models:local ../ttt-models && 
docker build -t ttt-engine:local ../ttt-engine && 
docker build -t ttt-session:local ../ttt-session && 
docker build -t ttt-gateway:local ../ttt-gateway && 
docker build -t ttt-eureka:local ../ttt-eureka &&
docker build -t ttt-ui:local ../ttt-ui &&
docker compose up
