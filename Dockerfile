FROM ubuntu:latest
MAINTAINER Felix Mercer Moss <felix.mercermoss@bbc.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python python-pip python-virtualenv gunicorn

# Setup flask application
RUN mkdir -p /deploy/app
COPY gunicorn_config.py /deploy/gunicorn_config.py
COPY app /deploy/app
RUN pip install -r /deploy/app/requirements.txt
WORKDIR /deploy/app

EXPOSE 5005

# Start gunicorn
CMD ["/usr/bin/gunicorn", "--config", "/deploy/gunicorn_config.py", "tayberry:app"]
