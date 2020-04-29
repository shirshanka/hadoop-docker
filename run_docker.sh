#!/bin/bash
DEFAULT_HADOOP_VERSION=2.8.5
if [ -z "$DOCKER_HADOOP_VERSION" ]; then
  echo "Could not find DOCKER_HADOOP_VERSION set in env, using $DEFAULT_HADOOP_VERSION"
  DOCKER_HADOOP_VERSION="$DEFAULT_HADOOP_VERSION"
fi
echo docker run -d -p 8088:8088 -p 8042:8042 --name hadoop --hostname hadoop -it shirshanka/hadoop-docker:"$DOCKER_HADOOP_VERSION"
docker run -d -p 8088:8088 -p 8042:8042 --name hadoop --hostname hadoop -it shirshanka/hadoop-docker:"$DOCKER_HADOOP_VERSION"
if [ "$?" -eq "0" ]; then
  # wait until RM comes up
  curl -s localhost:8088
  while [ "$?" -ne "0" ]; do
    echo "waiting for RM to come up .. ^C to abort if this continues for too long"
    sleep 5
    curl -s localhost:8088
  done
fi

