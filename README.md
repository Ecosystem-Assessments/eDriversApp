# eDrivers application

Shiny application to visualize eDrivers platform data.

## `dev` - Local deployment

**Local R environment**

```bash
cd app
Rscript -e "shiny::runApp(port = 5000, host = '0.0.0.0')"
```

**Build and deploy the application within a container**

```bash
docker build -t edrivers:latest . && docker run -p 5000:5000 -it --rm edrivers:latest
```

Deployment tested on `Docker version 25.0.0`

## `prod` - Docker deployment

**Requirements**

- Install docker on your computer: https://docs.docker.com/engine/install/
- Install gcloud SDK client: https://cloud.google.com/sdk/docs/install

## Create google artifacts repository

```bash
# Authentication with Google Cloud
gcloud auth login

# setting the project - Lets say PROJECT_ID = someproject-123
gcloud config set project pof-stac-insileco

# Creatng AR
gcloud artifacts repositories create docker-repo --repository-format=docker \
--location=northamerica-northeast1 --description="shiny-docker-prod"

#listing AR
gcloud artifacts repositories list
```

## Publish docker image on Google cloud artifact registry

Send gcloud credentials to docker 

```bash
gcloud auth configure-docker northamerica-northeast1-docker.pkg.dev
```
Build and tag docker image for release

```bash
docker build --tag=northamerica-northeast1-docker.pkg.dev/pof-stac-insileco/shiny-docker-prod/edrivers:v1.0.0 .
```

Publish docker image to google cloud artifacts repository

```bash
docker push northamerica-northeast1-docker.pkg.dev/pof-stac-insileco/shiny-docker-prod/edrivers:v1.0.0
```