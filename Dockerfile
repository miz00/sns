FROM ruby:2.6.0

ENV APP_ROOT ~/sns
WORKDIR $APP_ROOT

RUN pwd

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock

# RUN gem install bundler
RUN bundle install 
	
COPY . ~/sns
CMD ['rails s']
