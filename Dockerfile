FROM ruby:2.3.3
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /railsAuth
WORKDIR /railsAuth
ADD Gemfile /railsAuth/Gemfile
ADD Gemfile.lock /railsAuth/Gemfile.lock
RUN bundle install
ADD . /railsAuth

