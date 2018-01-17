# docker_rails

This Docker/compose set allows a easy creation of a __Ruby on Rails environment__ (latest Rails + Postgres 9.6.6)


=> If you need a __mail catcher__, just uncomment the corresponding lines in the compose file (and modify the rails configuration accordingly)

Environment based on:

- Ruby 2.5
- Rails (latest if not specified)
- PostgreSQL 9.6.6


#### REMEMBER to add the __.env.web__ files to your .gitignore file !!

The Postrgres volume is used to allow saving DB data even when containers are stopped


First step is to build the environment and run it with bash to install rails (or anything else...)

```sh
    # Build the image with just the smallest Ruby image and postgres
    docker-compose build
    # Now create the Rails project with desired options
    docker-compose run web rails new . --force --database=postgresql
    # Now that the Gemfile has been populated, we can build the final image (bundling is done in the Docker image building)
    docker-compose build
    # From now on, building it is only needed when the Gemfile changes
    # Start the container like this
    docker-compose up
```

_Project is not already created so you can benefit from later Rails improvements_

From host, to 'get ownership back' for the generated files (with a `rails generate` for instance), this command finds all files owned by root in the current directory and chown them back to `given_user`:
(Postgres directory will stay own by root, this is normal !)

```sh
    find . -user root | xargs sudo chown given_user:given_user
```
