#!/usr/bin/env bash

echo "$GITHUB_TOKEN" > ~/.ssh/github_token

pushd dev-env

# Cleanup existing containers
tearDown

. env.sh
if ! [[ "$BRANCH_NAME" =~ ^develop.*|^release.* ]]; then
   . env-feature.sh
fi

bash load-modules.sh
docker-compose build
docker-compose up -d --no-color
./wait_for_it.sh localhost:5432 localhost:8681:/manage/actuator/health localhost:8381:/manage/actuator/health localhost:8281:/manage/actuator/health localhost:8081:/manage/actuator/health localhost:8481:/manage/actuator/health localhost:8181:/manage/actuator/health localhost:8581:/manage/actuator/health
psql -h localhost -U developer -d bb_dev -f ./scripts/db/setup-user.sql 

popd
