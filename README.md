# hadoop-docker
A repository to build docker images for Hadoop. 

## Provenance
Heavily copied from [Sequence-iq/hadoop-docker](https://github.com/sequenceiq/hadoop-docker) to start off. It will probably evolve significantly over time, hence not doing a direct "fork". 

# Configure Hadoop Version (Optional)
The Hadoop version is configurable. The maintainer has tried it with 2.7.7 and 2.8.5 currently.
The current default is 2.8.5
```
export DOCKER_HADOOP_VERSION=2.7.7
```

# Build the image
```
./build_docker.sh
```

# Make sure you have enough RAM for the container
```
Docker Desktop -> Settings -> Resources -> Memory = 16GB
```

# Run the image
This will start up a detached container, which will bootup up HDFS and Yarn.
The script will wait for Yarn to come up by curl-ing localhost:8088
```
# defaults to container-name = hadoop, hostname = hadoop
./run_docker.sh
```

# Run the grep sanity check from a shell
```

# drop into a shell on the container
# docker exec -it hadoop bash or alternately ...
./shell_docker.sh

# On the shell, run the mapreduce grep example
hadoop jar ${HADOOP_PREFIX}/share/hadoop/mapreduce/hadoop-mapreduce-examples-${HADOOP_VERSION}.jar grep input output 'dfs[a-z.]+'

# check the output
hdfs dfs -cat output/*
```

# Other Useful Docker Commands
Check out the [Docker Cheatsheet](docker_cheatsheet.md)
