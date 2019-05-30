FROM ruby:2.3.3-alpine

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apk update && \
    apk --no-cache --update add nodejs npm postgresql-client postgresql-dev make g++ yarn

RUN mkdir /railsAuth

WORKDIR /railsAuth

COPY Gemfile /railsAuth/Gemfile
COPY Gemfile.lock /railsAuth/Gemfile.lock

RUN bundle install

COPY . /railsAuth