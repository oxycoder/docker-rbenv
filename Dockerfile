FROM alpine:3.8

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH

RUN mkdir -p /app
WORKDIR /app

RUN apk add --update \
    bash \
    git \
    curl \
    build-base \
    readline-dev \
    zlib-dev \
    linux-headers \
    imagemagick-dev \    
    libffi-dev \    
    libffi-dev \
    postgresql-dev \
&& rm -rf /var/cache/apk/*

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN rbenv install 2.3.1 \
&& rbenv install 2.7.2 \
&& rbenv install 3.0.0 \
&& rbenv global 3.0.0 \
&& gem install bundler:1.17.3 \
&& gem install rails \
&& gem install sidekiq \
&& gem install foreman
