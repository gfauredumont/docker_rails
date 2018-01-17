# Use this file with Docker
# https://docs.docker.com/engine/installation/
FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Force Bundler to work in parallel
RUN bundle config --global jobs 4
RUN echo 'gem: --no-document' > /root/.gemrc

RUN mkdir /project_name
WORKDIR /project_name
COPY Gemfile /project_name/Gemfile
COPY Gemfile.lock /project_name/Gemfile.lock
RUN bundle install
COPY . /project_name
