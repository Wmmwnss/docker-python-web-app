### Dockerfile
#
#   See https://github.com/russmckendrick/docker-python-web-app

FROM alpine:latest

LABEL maintainer="Russ McKendrick <russ@mckendrick.io>"
LABEL org.opencontainers.image.source https://github.com/russmckendrick/docker-python-web-app/
LABEL org.opencontainers.image.description "Docker Image with a sample flask app for testing deployments"

COPY app.py /app

RUN apk update && apk upgrade && \
        apk add bash py3-pip openssh-client && \
        pip install -r https://raw.githubusercontent.com/russmckendrick/docker-python-web-app/master/requirements.txt && \
        apk del --purge build &&

WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]