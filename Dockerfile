FROM ruby:3.3.0
COPY --from=ghcr.io/renoveru/awseb-deployer-docker:latest /usr/local /usr/local
COPY --from=node:18.19.0 /usr/local /usr/local

LABEL org.opencontainers.image.source https://github.com/Renoveru/ra_api-deployer-docker

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev default-mysql-client \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler