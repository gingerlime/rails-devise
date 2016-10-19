FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential cmake libpq-dev imagemagick qt5-default libqt5webkit5-dev libmysqlclient-dev libodbc1

ENV RAILS_ENV development

ENV app /app
RUN mkdir $app
WORKDIR $app


ADD Gemfile $app/Gemfile
ADD Gemfile.lock $app/Gemfile.lock
RUN bundle install
ADD . $app

CMD rails s -b 0.0.0.0

