#!/bin/bash

pypi-server run \
    -p 8080 \
    -a update,download,list \
    -P /.htpasswd
    # --log-file /var/log/pypiserver.log \