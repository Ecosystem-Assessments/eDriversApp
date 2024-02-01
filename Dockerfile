# Base R Shiny image
FROM rocker/shiny:4.3.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libproj-dev \
    libudunits2-dev \
    libgdal-dev \ 
    libgeos-dev \ 
    libsqlite0-dev

# Install R dependencies
RUN install2.r remotes
RUN Rscript -e 'remotes::install_version("raster", upgrade = "never", version = "3.6-14")'
RUN Rscript -e 'remotes::install_version("leaflet", upgrade = "never", version = "2.1.1")'
RUN Rscript -e 'remotes::install_version("shiny", upgrade = "never", version = "1.7.0")'
RUN Rscript -e 'remotes::install_version("shinyjs", upgrade = "never", version = "2.0.0")'
RUN Rscript -e 'remotes::install_version("magrittr", upgrade = "never", version = "2.0.3")'
RUN Rscript -e 'remotes::install_version("sf", upgrade = "never", version = "1.0-9")'
RUN Rscript -e 'remotes::install_version("dplyr", upgrade = "never", version = "1.0.4")'
RUN Rscript -e 'remotes::install_version("tidyr", upgrade = "never", version = "1.2.1")'

# Copy shiny app into the Docker image
COPY app /srv/shiny-server/

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf

# Copy shiny app execution file into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

# Expose the application port
EXPOSE 5000

USER shiny

CMD ["/usr/bin/shiny-server"]