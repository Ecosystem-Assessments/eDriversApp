#!/bin/sh

# Make sure the directory for individual app logs exists
mkdir -p /var/log/shiny-server
chown shiny:shiny /var/log/shiny-server

Rscript -e "shiny::runApp(port = 5000, host = '0.0.0.0')" >> /var/log/shiny-server.log 2>&1