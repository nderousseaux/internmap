# Étape de construction de l'application
FROM node:14 as build-stage
ARG VUE_APP_GOOGLE_MAPS_API_KEY
ARG VUE_APP_GOOGLE_MAPS_ID
ARG VUE_APP_JSON_URL_COMPANIES


# On prend la variable d'environnement de la machine hôte
ENV VUE_APP_GOOGLE_MAPS_API_KEY=$VUE_APP_GOOGLE_MAPS_API_KEY
ENV VUE_APP_GOOGLE_MAPS_ID=$VUE_APP_GOOGLE_MAPS_ID
ENV VUE_APP_JSON_URL_COMPANIES=$VUE_APP_JSON_URL_COMPANIES

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Étape de production, utilisez Nginx pour servir l'application
FROM nginx:1.21
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]