#!/usr/bin/env bash

# TODO: Refactor this and all the run-regression.sh files so that they use
#       common functions from a common set of util scripts.

tearDown() {

    # kill anything that is running
    dockerContainers=$(docker ps -q)
    if [[ "$dockerContainers" == "" ]]; then
       echo "No previously running containers.. nothing to kill"
    else
       echo "Killing docker containers.. $dockerContainers"
       docker kill ${dockerContainers}
    fi

    # This really cleans everything up so there's nothing previous that could contaminate
    echo "Pruning docker containers/images"
    docker system prune -a -f

    if [[ -d dev-env-develop ]]; then
      echo "Tearing down existing dev-env-develop directory"
      rm -rf dev-env-develop
    fi
}

echo "$GITHUB_TOKEN" > ~/.ssh/github_token

pushd dev-env


# Cleanup existing containers
tearDown

. dev-env-develop/env.sh
if ! [[ "$BRANCH_NAME" =~ ^develop.*|^release.* ]]; then
   . env-feature.sh
fi

bash load-modules.sh
docker-compose build
docker-compose up -d --no-color
./wait_for_it.sh localhost:5432 localhost:8681:/manage/actuator/health localhost:8381:/manage/actuator/health localhost:8281:/manage/actuator/health localhost:8081:/manage/actuator/health localhost:8481:/manage/actuator/health localhost:8181:/manage/actuator/health localhost:8581:/manage/actuator/health
psql -h localhost -U developer -d bb_dev -f ./scripts/db/setup-user.sql 

# Tear down
tearDown

popd
