#! /bin/bash

. common.sh
. applications.sh

echo "APPLICATIONS ${APPLICATIONS[*]}"

. run-clone-sources.sh
. run-setup-dev-env.sh
. run-compute-versions.sh
. run-build-env-feature-file.sh
. run-start-services.sh
. run-acceptance-tests.sh
. run-stop-services.sh

