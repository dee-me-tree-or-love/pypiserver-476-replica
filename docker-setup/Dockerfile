FROM python:3.9-buster

# Make sure pypiserver==1.5.1 is installed and `passlib` is available
RUN pip install pypiserver==1.5.1 passlib

# Copy configs
COPY    .htpasswd               /.htpasswd
COPY    .entrypoint.sh          /.entrypoint.sh

# Expose the port
EXPOSE 8080

ENTRYPOINT [ "/.entrypoint.sh" ]

