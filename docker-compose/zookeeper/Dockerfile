From ubuntu:16.04
ENV homeDir "/root"
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y zookeeper
WORKDIR "/usr/share/zookeeper/bin"
EXPOSE 2181
CMD ["./zkServer.sh","start-foreground"]

