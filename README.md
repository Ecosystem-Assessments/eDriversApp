# eDrivers application

Shiny application to visualize eDrivers platform data.

## Local deployment

```bash
Rscript -e "shiny::runApp(port = 8083, host = '0.0.0.0')"
```

## Docker deployment

**Requirements**

- Install docker on your computer: https://docs.docker.com/engine/install/

**Build and deploy the application within a container**

```bash
docker build -t edrivers . && docker run -p 5000:5000 -it --rm edriver
```
Deployment tested on `Docker version 25.0.0`

## Publish docker image on Google cloud artifact registry

Send gcloud credentials to docker 

```bash
gcloud auth configure-docker northamerica-northeast1-docker.pkg.dev
```

Build locally and publish manually docker to google cloud artifacts

```bash
docker build --tag=northamerica-northeast1-docker.pkg.dev/pof-stac-insileco/shiny-docker-prod/edrivers:v1.0.0 .
docker push northamerica-northeast1-docker.pkg.dev/pof-stac-insileco/shiny-docker-prod/edrivers:v1.0.0
```