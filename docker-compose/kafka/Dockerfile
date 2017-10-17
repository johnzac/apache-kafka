From ubuntu:14.04
ENV workingDir "/root/kafka"
ENV homeDir "/root"
ENV kafkaPath "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y wget
RUN wget ${kafkaPath} -O ${homeDir}/kafka.tgz
RUN mkdir -p ${workingDir}
RUN tar -xvzf ${homeDir}/kafka.tgz --strip 1 -C ${workingDir}
RUN echo "offsets.topic.replication.factor=1" >> ${workingDir}/config/server.properties
RUN sed -i 's/\(zookeeper.connect=*\)/#\1/' ${workingDir}/config/server.properties
RUN echo "zookeeper.connect=zookeeper:2181" >> ${workingDir}/config/server.properties
RUN sed -i 's/\(advertised.host.name=*\)/#\1/' ${workingDir}/config/server.properties
RUN echo "advertised.host.name=kafka" >> ${workingDir}/config/server.properties
WORKDIR "/root/kafka"
EXPOSE 9092
CMD ["./bin/kafka-server-start.sh","config/server.properties"]
