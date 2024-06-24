FROM ghcr.io/renoveru/awseb-deployer-docker:latest
FROM node:18.19.0
FROM ruby:3.3.0

LABEL org.opencontainers.image.source https://github.com/Renoveru/ra_api-deployer-docker

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev default-mysql-client \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY --from=node:18.19.0 /usr/local /usr/local

RUN gem install bundler