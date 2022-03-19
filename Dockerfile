FROM newtmitch/sonar-scanner as sonarqube

# Step 1 -> sonarqube

ENV SONARQUBESTEP=1

WORKDIR /usr/src
COPY ./sonar-runner.properties /usr/lib/sonar-scanner/conf/sonar-scanner.properties
COPY ./ ./app
#COPY /usr/src/app/api ./api
# RUN sonar-scanner -X  -Dsonar.projectBaseDir=/usr/src

# Step 2 -> mvn build

WORKDIR /usr/src/app/
COPY ./ /usr/src/app/
RUN ./mvnw package

#Step 3 -> java
#FROM  openjdk:8-jdk

#WORKDIR /usr/src/app/
#COPY ./amuyal/petClinic.git /usr/src/app/
#RUN apt-get update
#RUN apt-get install -y openjdk-8-jdk
#RUN apt-get install -y openjdk-8-jre
#RUN update-alternatives --config java
#RUN update-alternatives --config javac
#CMD ["./mvnw package"]
