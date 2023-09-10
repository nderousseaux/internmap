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

## Project setup in production

### Build docker image
```bash
docker build -t internamp $(for i in `cat .env`; do out+="--build-arg $i " ; done; echo $out;out="") .
```

### Run docker container
```bash
docker run -d -p 80:80 internamp
```