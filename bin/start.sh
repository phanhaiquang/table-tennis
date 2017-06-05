#!/bin/bash

# https://medium.com/@fbzga/how-to-cache-bundle-install-with-docker-7bed453a5800#.h7fccyx1o
bundle check || bundle install

bundle exec foreman start -f Procfile

