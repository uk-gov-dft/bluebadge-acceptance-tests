#! /bin/bash

. common.sh
. applications.sh

for application in "${APPLICATIONS[@]}"
do
  NAME=$(echo -n "$application" | cut -d, -f2)

  pushd "$NAME"
  ./gradlew outputComputedVersion
  popd
done

