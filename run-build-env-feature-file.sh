#! /bin/bash

TMP_FILE=/tmp/env-feature.sh
rm "$TMP_FILE" || true

for application in "${APPLICATIONS[@]}"
do
  SHORTCODE=$(echo -n "$application" | cut -d, -f1)
  NAME=$(echo -n "$application" | cut -d, -f2)

  pushd "$NAME"
  echo "export ${SHORTCODE}_VERSION=$(cat VERSION-computed)" >> "$TMP_FILE"
  popd
done

mv  "$TMP_FILE" dev-env
