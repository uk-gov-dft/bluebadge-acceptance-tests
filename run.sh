#! /bin/bash

. common.sh
. applications.sh

echo "APPLICATIONS ${APPLICATIONS[*]}"

. run-clone-sources.sh
. run-compute-versions.sh
. run-build-env-feature-file.sh
. run-start-services.sh
