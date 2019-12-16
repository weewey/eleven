FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /eleven
WORKDIR /eleven

COPY Gemfile Gemfile.lock ./

RUN gem update --system
RUN gem install bundler

RUN bundle install

COPY . .