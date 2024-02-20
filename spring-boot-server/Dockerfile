FROM maven:3.8.1-jdk-11 AS build
COPY spring-boot-server/. /app
WORKDIR /app
RUN mvn clean package


FROM openjdk:11-jre-slim
COPY --from=build /app/target/*.jar /app/app.jar
COPY spring-boot-server/launcher.sh /app/launcher.sh


WORKDIR /app

RUN apt-get update && apt-get install -y mariadb-client

RUN chmod +x launcher.sh

CMD ["./launcher.sh"]
