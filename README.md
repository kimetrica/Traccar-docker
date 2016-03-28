# Traccar-docker
This repo contains a Dockerfile for a Docker image, that creates containers that run [Traccar](https://www.traccar.org/). It contains a modified `traccar.xml` configuration file that uses a Postgres database.
To avoid having to hardcode the values in the configuration, the Docker image also contains a simple Python script that replaces some placeholders in `traccar.xml` with the corresponding environment variables. Defaults are set, but it is suggested to set these variables explicitly when running the container.
The variable names are:

* POSTGRES_HOSTNAME
* POSTGRES_USERNAME
* POSTGRES_PASSWORD

The repo contains a traccar package that has been modified to extract additional tags from the data submitted by Galileo devices, but should work like a current github checkout of Traccar otherwise.