# Parsoid-Docker

Parsoid inside a docker container.

## Configuration

There are two main ways to configure this image: through the config file before
building it or through /etc/hosts after building it.

### Pre-build

1. Modify the `config.yaml` file and set your mediawiki's uri and domain
2. Build the image

### Post-build

1. Build the image
2. Run the parsoid container
3. Modify /etc/hosts so `wiki` points to your mediawiki's server address

This configuration replicates what docker does when linking containers.

## Build

`docker build -t jrlangford/parsoid .`

## Run

`docker run -d parsoid`
