#! /bin/bash

. common.sh
. applications.sh


for application in "${APPLICATIONS[@]}"
do
  SHORTCODE=$(echo -n "$application" | cut -d, -f1)
  NAME=$(echo -n "$application" | cut -d, -f2)

  echo "SHORTCODE $SHORTCODE NAME $NAME"
  BRANCH_NAME="${SHORTCODE}_BRANCH" 
  echo "BRANCH_NAME = ${!BRANCH_NAME}"
  git clone "https://$GITHUB_TOKEN:x-oauth-basic@github.com/uk-gov-dft/$NAME.git"
  pushd "$NAME"
  git checkout "${!BRANCH_NAME}"
  popd
done
