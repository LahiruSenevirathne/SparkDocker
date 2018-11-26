FROM ubuntu

RUN apt-get update && apt-get -y install curl && \
	apt-get install -y wget	

# JAVA         
# Install OpenJDK-8
RUN 	apt-get update && \
	apt install openjdk-8-jdk -y  && \
	apt-get install -y ant && \
	apt-get clean;

# Fix certificate issues
RUN 	apt-get update && \
        apt-get install ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f;
# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# SPARK
ARG SPARK_ARCHIVE=https://archive.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz 
RUN wget $SPARK_ARCHIVE 
RUN  tar -xvzf  spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/

ENV SPARK_HOME /usr/local/spark-2.2.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin

#COPY spark-env.sh $SPARK_HOME/conf

EXPOSE 4040 6066 7077 8080 8088 

WORKDIR $SPARK_HOME

