#! /bin/bash

for application in "${APPLICATIONS[@]}"
do
  SHORTCODE=$(echo -n "$application" | cut -d, -f1)
  NAME=$(echo -n "$application" | cut -d, -f2)

  echo "SHORTCODE $SHORTCODE NAME $NAME"
  #git clone "https://$GITHUB_CREDENTIAL@github.com/uk-gov-dft/$NAME.git"
  BRANCH_NAME="${SHORTCODE}_BRANCH" 
  echo "BRANCH_NAME = ${!BRANCH_NAME}"
done
