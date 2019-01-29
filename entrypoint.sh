#!/bin/bash
# clear pid before starting server
rm -f tmp/pids/server.pid
# check if Gemfile has changed and bundle
if [[ -e "Gemfile" ]]; then
  bundle check || bundle install
fi
# execute commands
exec "$@"
