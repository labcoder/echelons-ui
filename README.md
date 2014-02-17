# Echelons UI

This is a web interface for my elo ranking api, [echelons](https://github.com/labcoder/echelons)
Go check that out to see what it does and how it works.

### Running Locally

1. This runs on ruby/sinatra, make sure you have them.
1. Run `bundle install` to get the dependencies in the Gemfile
1. Make sure you have the following environment variables set up:
    + `ECHELONS_BASIC_AUTH_USER` - the usernamem for basic auth to echelons api
    + `ECHELONS_BASIC_AUTH_PASS` - the password for basic auth to echelons api
    + `ECHELONS_API_URI` - the uri where the echelons api is stored
1. Run `foreman start` to run locally
