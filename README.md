# Internmap

## Environment variables
Set this environment variables in `.env` file in root directory of project.

```bash
VUE_APP_GOOGLE_MAPS_API_KEY # Google Maps API key
VUE_APP_GOOGLE_MAPS_ID # Google Maps ID
VUE_APP_JSON_URL_COMPANIES # URL to companies JSON
```

## Project setup in development
```bash
npm install # install dependencies
npm run serve # run development server
```

### Lints and fixes files
```
npm run lint
```

## Build localy in production

### Build docker image
```bash
docker build -t internamp $(for i in `cat .env`; do out+="--build-arg $i " ; done; echo $out;out="") .
```

### Run docker container
```bash
docker run -d -p 80:80 internamp
```

## Build with github actions
`.github/workflows/create-publish-docker.yml` file contains workflow for building and publishing docker image to docker hub.
It needs to be configured with secrets and variables in github repository settings.

Secrets:
- VUE_APP_GOOGLE_MAPS_API_KEY : Google Maps API key

Variables:
- VUE_APP_GOOGLE_MAPS_ID : Google Maps ID
- VUE_APP_JSON_URL_COMPANIES : URL to companies JSON
