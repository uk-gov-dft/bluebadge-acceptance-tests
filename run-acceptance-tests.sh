#! /bin/bash

set -e

. common.sh
. applications.sh

for application in "${APPLICATIONS[@]}"
do
  NAME=$(echo -n "$application" | cut -d, -f2)
  
  pushd "$NAME"
  (./gradlew acceptanceTest -DbaseUrl=http://localhost:8080 -Dheadless=true)
  popd
done
