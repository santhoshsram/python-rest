FROM python:2.7-alpine

MAINTAINER Santhosh Sundararaman

RUN apk add --no-cache gcc g++ supervisor curl

COPY ./apiserver /apiserver

COPY ./setup /tmp/setup

WORKDIR /tmp/setup

RUN pip install -r requirements.txt

RUN rm -fr /tmp/setup

WORKDIR /apiserver

# Setup supervisord
COPY supervisor.conf /etc/supervisor.d/

# Open port 90
EXPOSE 90

# Start processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.conf"]
