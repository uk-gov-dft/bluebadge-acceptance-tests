#! /bin/bash

for application in "${APPLICATIONS[@]}"
do
  NAME=$(echo -n "$application" | cut -d, -f2)

  pushd "$NAME"
  ./gradlew outputComputedVersion
  popd
done

