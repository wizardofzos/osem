FROM ruby:2.3-slim
RUN apt-get update -qq && apt-get install -y build-essential nodejs nodejs-legacy npm libmysqlclient-dev libfontconfig1 libsqlite3-dev imagemagick
RUN npm install -g phantomjs-prebuilt
RUN gem install bundler --no-ri --no-rdoc

RUN mkdir /app
WORKDIR /app
ADD . /app
