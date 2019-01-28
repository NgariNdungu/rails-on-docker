#!/bin/bash
# clear pid before starting server
rm -f tmp/pids/server.pid
# check if Gemfile has changed and bundle
bundle check || bundle install
# execute commands
exec "$@"
