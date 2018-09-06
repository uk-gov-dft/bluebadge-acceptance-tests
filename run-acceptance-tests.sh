#! /bin/bash

set -e

for application in "${APPLICATIONS[@]}"
do
  NAME=$(echo -n "$application" | cut -d, -f2)
  
  pushd "$NAME"
  ./gradlew acceptanceTests -PbuildProfile=local -Dos=linux -Dheadless=true
  popd
done
