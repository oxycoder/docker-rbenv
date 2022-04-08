FROM ubuntu:20.04

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive
ENV RAILS_PORT=3000

RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

RUN apt update && apt install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    git \
    libreadline-dev \
    zlib1g-dev \
    libffi-dev \
    libpq-dev \
    libssl1.0-dev \
    nodejs \
    shared-mime-info \
&& rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# setup ruby 2.3.1
RUN rbenv install 2.3.1 \
&& rbenv global 2.3.1 \
&& gem update --system \
&& gem install bundler:1.17.3 \
&& rbenv rehash

# setup ruby 2.7.2
RUN rbenv install 2.7.2 \
&& rbenv global 2.7.2 \
&& gem install bundler:1.17.3 \
&& rbenv rehash

# setup ruby 3.0.0
RUN rbenv install 3.0.0 \
&& rbenv global 3.0.0 \
&& gem install bundler:1.17.3 \
&& rbenv rehash

# setup ruby 3.0.1
RUN rbenv install 3.0.1 \
&& rbenv global 3.0.1 \
&& gem install bundler:1.17.3 \
&& rbenv rehash

# setup ruby 3.0.3
RUN rbenv install 3.0.3 \
&& rbenv global 3.0.3 \
&& gem install bundler:1.17.3 \
&& rbenv rehash

EXPOSE $RAILS_PORT

WORKDIR /app

ENTRYPOINT [ "bundle", "exec" ]
