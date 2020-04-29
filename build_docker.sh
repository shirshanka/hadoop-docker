#!/bin/bash
DEFAULT_HADOOP_VERSION=2.8.5
if [ -z "$DOCKER_HADOOP_VERSION" ]; then
  echo "Could not find DOCKER_HADOOP_VERSION set in env, using $DEFAULT_HADOOP_VERSION"
  export DOCKER_HADOOP_VERSION="$DEFAULT_HADOOP_VERSION"
fi
echo docker build --build-arg HADOOP_VERSION="$DOCKER_HADOOP_VERSION" -t shirshanka/hadoop-docker:"$DOCKER_HADOOP_VERSION" .
docker build --build-arg HADOOP_VERSION="$DOCKER_HADOOP_VERSION" -t shirshanka/hadoop-docker:"$DOCKER_HADOOP_VERSION" .
