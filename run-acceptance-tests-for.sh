#! /bin/bash

APP=$1

set -e

. common.sh
. applications.sh

(cd $APP && ./gradlew acceptanceTest -DbaseUrl=http://localhost:8080 -Dheadless=true)
