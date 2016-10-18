# docker_rails

This Docker/compose set allows a easy creation of a __Ruby on Rails environment__ (latest Rails + Postgres 9.5)


=> If you need a __mail catcher__, just uncomment the corresponding lines in the compose file

Environment based on:

- Ruby 2.3.1
- Rails (latest if not specified)
- PostgreSQL 9.5
- Foreman
- Bower (for front end dependencies)


#### REMEMBER to add the .env.* files to your .gitignore file !!

The Postrgres volume is used to allow saving DB data even when containers are stopped


First step is to build the environment and run it with bash to install rails (or anything else...)

```sh
    docker-compose build
    docker-compose run web bash
```

_Project is not already created so you can choose your options (and benefit from later Rails improvements)_


=> You can then create a Rails project as you wish:

```sh
    gem install rails
    rails new .
```

Create a `Procfile` in your project directory for foreman commands:

```sh
    echo "web: bundle exec rails server -p \$PORT -b 0.0.0.0" > Procfile
```

- When project is created, replace 'project_name' with real one in `Dockerfile`and `docker-compose.yml`
- Uncomment the 4 project bundling lines in Dockerfile:

```ruby
    WORKDIR /tmp
    COPY Gemfile Gemfile
    COPY Gemfile.lock Gemfile.lock
    RUN bundle install
```



From host, to 'get ownership back' for the generated files (with a `rails generate` for instance), this command finds all files owned by root in the current directory and chown them back to `given_user`:
(Postgres directory will stay own by root, this is normal !)

```sh
    find . -user root | xargs sudo chown given_user:given_user
```
