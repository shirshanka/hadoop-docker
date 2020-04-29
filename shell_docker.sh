#!/bin/bash
DEFAULT_HADOOP_VERSION=2.8.5
if [ -z "$DOCKER_HADOOP_VERSION" ]; then
  echo "Could not find DOCKER_HADOOP_VERSION set in env, using $DEFAULT_HADOOP_VERSION"
  DOCKER_HADOOP_VERSION="$DEFAULT_HADOOP_VERSION"
fi
echo docker exec -it hadoop bash
docker exec -it hadoop bash
