# Utiliser une image de base Maven pour construire le projet
FROM maven:3.8.1-jdk-11 AS build
COPY spring-boot-server/. /app
WORKDIR /app
RUN mvn clean package

# Utiliser une image de base OpenJDK pour exécuter l'application
FROM openjdk:11-jre-slim
COPY --from=build /app/target/*.jar /app/app.jar
COPY spring-boot-server/launcher.sh /app/launcher.sh

# Définir le répertoire de travail
WORKDIR /app

RUN apt-get update && apt-get install -y mariadb-client
# Rendre le script exécutable
RUN chmod +x launcher.sh

# Exécuter le script
CMD ["./launcher.sh"]
