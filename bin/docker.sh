#!/bin/bash

appname="bongban"

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
  echo "Stop docker services"
  docker stop ${appname}_postgres 
}

if [ ! "$(docker ps -q -f name=${appname}_postgres)" ]; then
  if [ "$(docker ps -aq -f status=exited -f name=${appname}_postgres)" ]; then
    echo "Restart docker services"
    docker restart ${appname}_postgres 
  else
    echo "Run docker services at the first time"
    docker run -p 127.0.0.1:5432:5432 --name ${appname}_postgres postgres &
  fi
fi

bundle exec foreman start -f Procfile.dev

#while true; do
#  sleep 5*60
#done

