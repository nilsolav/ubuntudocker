FROM pytorch/pytorch:latest

RUN mkdir /install
WORKDIR /install

RUN apt-get update -y && \
    apt-get install -y git \
    apt-get install zsh

CMD zsh
