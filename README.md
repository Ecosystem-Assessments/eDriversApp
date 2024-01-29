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
docker build -t edrivers . && docker run -p 8083:8083 -it --rm edriver
```
Deployment tested on `Docker version 25.0.0`


