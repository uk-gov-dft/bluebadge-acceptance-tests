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
