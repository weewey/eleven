FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /elevem
WORKDIR /eleven

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

