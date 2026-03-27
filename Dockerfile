FROM --platform=x86_64 ghcr.io/renoveru/awseb-deployer-docker:latest

LABEL org.opencontainers.image.source https://github.com/Renoveru/ra_api-deployer-docker

RUN apt-get update -qq \
    && apt-get install -y \
      build-essential \
      pkg-config \
      default-libmysqlclient-dev \
      libpq-dev \
      libyaml-dev \
      imagemagick \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update && apt-get install -y nodejs

RUN gem install bundler -v 2.5.10 --no-document
