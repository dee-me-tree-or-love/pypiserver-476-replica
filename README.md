# What

This repo is a simplified reproduction of the <https://github.com/pypiserver/pypiserver/issues/476> issue for `pypiserver`.

## Setup

### Docker solution

To test the Docker setup, run `make run-docker`.

Once the command reaches the end, you should be able to access the pypiserver at `localhost:8080`.

> For more information see [`./docker-setup`](./docker-setup/)

### Vagrant solution

To test the Vagrant setup, run `make start-vagrant`.

Once the command reaches the end, you should be able to access pypiserver at `localhost:8081` via NGINX reverse-proxy, or `localhost:8082` directly.

> For more information see [`./vagrant-setup`](./docker-setup/)
