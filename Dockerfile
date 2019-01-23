FROM ruby:2.5.0

ENV APP_ROOT ~/sns
WORKDIR $APP_ROOT

RUN pwd

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock

RUN bundle install
	
COPY . ~/sns
