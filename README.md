# docker_rails

Allows easy creation of a rails environment with Docker-compose (Rails 4.2 + Postgres 9.4) 

This Docker/compose set allows a easy creation of a Ruby on Rails environment.

If you need a mail catcher, just uncomment the corresponding lines in the compose file

Environment based on:
Ruby 2.3.0
Rails 4.2
PostgreSQL 9.4.4
Foreman
Bower (for front end dependencies)


## REMEMBER TO add the .env.* files to your .gitignore file !!

The Postrgres volume is used to allow saving DB data even when containers are stopped

First start need to override default command (because project doesn't exist yet).

```sh
    docker-compose build
    docker-compose run web bash
```

Project is not already created so you can choose your options (and benefit from later Rails improvements)

You can then create a Rails project as you whish:

```sh
    gem install rails
    rails new .
```

When project is created, replace 'project_name' with real one in Dockerfile and docker-compose.yml
Uncomment the 4 project bundling lines in Dockerfile:

```ruby
    WORKDIR /tmp
    COPY Gemfile Gemfile
    COPY Gemfile.lock Gemfile.lock
    RUN bundle install
```
