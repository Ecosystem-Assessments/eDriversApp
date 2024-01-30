# Base R Shiny image
FROM rocker/shiny:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libproj-dev \
    libudunits2-dev \
    libgdal-dev \ 
    libgeos-dev \ 
    libsqlite0-dev

# Copy shiny app into the Docker image
COPY app /srv/shiny-server/

# Install R dependencies
RUN install2.r remotes
RUN Rscript -e "remotes::install_deps('/srv/shiny-server/')"

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf

# Expose the application port
EXPOSE 5000

# Copy shiny app execution file into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

USER shiny

CMD ["/usr/bin/shiny-server"]