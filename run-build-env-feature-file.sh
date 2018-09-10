#! /bin/bash

. common.sh
. applications.sh

for application in "${APPLICATIONS[@]}"
do
  SHORTCODE=$(echo -n "$application" | cut -d, -f1)
  NAME=$(echo -n "$application" | cut -d, -f2)

  pushd "$NAME"
  echo "export ${SHORTCODE}_VERSION=$(cat VERSION-computed)" >> "${WORKSPACE:-./}/dev-env/env-feature.sh"
  popd
done
