FROM  java:8 

# Install maven
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y maven

# Adding prometheusa-app to container
ADD . /usr/prometheus  
WORKDIR /usr/prometheus
ARG MAVEN_OPTS
RUN ["mvn", "package"]

EXPOSE 8080 
CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/prometheus-app-0.0.1-SNAPSHOT.jar"]
