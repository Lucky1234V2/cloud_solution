# Utiliser une image de base Node pour construire le projet
FROM node:14 AS build
WORKDIR /app
COPY angular-15-client/package.json angular-15-client/package-lock.json ./
RUN npm install
COPY angular-15-client/. .
RUN npm run build

# Utiliser une image de base Nginx pour servir l'application
FROM nginx:alpine
COPY --from=build /app/dist/angular-15-crud /usr/share/nginx/html
