FROM ruby:2.3.0
MAINTAINER Guillaume FAURE-DUMONT
RUN apt-get update -qq && apt-get install -y build-essential postgresql-contrib nodejs npm nodejs-legacy
RUN gem install foreman
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN echo 'gem: --no-document' > /root/.gemrc

RUN mkdir /project_name

# WORKDIR /tmp
# COPY Gemfile Gemfile
# COPY Gemfile.lock Gemfile.lock
# RUN bundle install

ADD . /project_name
WORKDIR /project_name
