FROM ghcr.io/renoveru/awseb-deployer-docker
FROM node:18.19.0
FROM ruby:3.3.0

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev default-mysql-client \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler