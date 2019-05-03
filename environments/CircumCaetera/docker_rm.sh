#!/bin/bash

checkArgs() {
  if (( $# != 1 )); then
    print_help
  fi
}

print_help() {
  NAME="$(basename "$0")"
cat << EOF
---
Use: $NAME [imagename]
If specified, it will delete the image and all its containers.

Without params it will print the list of images and containers.
---

EOF

  ec "List of images:"
  docker images
  ec
  ec "List of containers:"
  docker ps -a
  ec
  exit
}

ec () {
  if [ "$(echo -ne 'a')" != "a" ]; then
    echo "$1" "$2"
  else
    echo -e "$1" "$2"
  fi
}

getContainers() {
  docker ps -a |sed -re '/'"${imagename}"'/!d;s/^([^ ]*) .*$/\1/'
}

stopContainers() {
  for container in $CONTAINERS; do
    echo "Stop container: $container"
    docker stop $container
  done
}

deleteContainers() {
  for container in $CONTAINERS; do
    echo "Removing container: $container"
    docker rm $container
  done
}

deleteImage() {
  echo "Removing image: $imagename"
  docker rmi "${imagename}"
}

checkArgs $@
imagename="$1"

CONTAINERS="$(getContainers)"
stopContainers $CONTAINERS
deleteContainers $CONTAINERS
deleteImage


