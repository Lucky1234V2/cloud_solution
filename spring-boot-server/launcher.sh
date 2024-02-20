#!/bin/sh
DATABASE_URI=$(echo $SPRING_DATASOURCE_URL | cut -c 14-)
DATABASE_HOST=$(echo $DATABASE_URI | cut -d ':' -f 1)
until mysqladmin ping -h "$DATABASE_HOST" --silent; do
    sleep 1
    echo "Waiting for MySQL to be up..."
done
echo "MySQL is up..."
java -jar ./app.jar
