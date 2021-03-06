############################################################
# Dockerfile to build seneca-levelstore test container
# Based on Node image
############################################################

FROM node

MAINTAINER Mircea Alexandru <mircea.alexandru@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#############################################
##  Clone store
#############################################

WORKDIR /opt/app
COPY package.json package.json
COPY mysql-store.js mysql-store.js
COPY default_config.json default_config.json
COPY .eslintrc .eslintrc
COPY test test

#############################################
# Install dependencies
#############################################
RUN npm install


ENTRYPOINT npm run test
