#!/bin/bash

set -e

echo "Environment: $RAILS_ENV"

# install missing gems
bundle check || bundle install --jobs 5 --retry 5

# Remove pre-existing puma/passenger server.pid
rm -f /app/tmp/pids/server.pid

# setup config
configFiles="config/application config/database config/secrets config/secret config/apina_graphql config/webmock_enable config/authkey.pem config/mongoid"
for configFile in $configFiles
do
  # Copy files without override and preserve owners, permissions.
  if [[ -f "${configFile}.yml.sample" ]]
  then
    cp -np "${configFile}.yml.sample" "$configFile.yml"
  fi

  if [[ -f "${configFile}.sample" ]]
  then
    cp -np "${configFile}.sample" "$configFile"
  fi
done

# run passed commands
bundle exec ${@}
