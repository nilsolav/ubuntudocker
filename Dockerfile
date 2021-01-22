FROM python:3 as builder

RUN mkdir /install
WORKDIR /install

RUN apt-get update -y && \
    apt-get install -y git \
    apt-get install zsh

FROM python:3-slim

WORKDIR /app

CMD zsh
