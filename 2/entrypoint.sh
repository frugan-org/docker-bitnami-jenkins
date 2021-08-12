#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose


if [ ! -z "${JENKINS_HOME:-}" ]; then
  echo "Fixing ${NSS_WRAPPER_PASSWD} in ${NSS_WRAPPER_PASSWD} ...";
  #https://stackoverflow.com/a/27788661/3929620
  sed -i \
    -e 's/\/opt\/bitnami\/jenkins\/jenkins_home/'"${JENKINS_HOME//\//\\/}"'/' \
    ${NSS_WRAPPER_PASSWD};
fi


####

#https://stackoverflow.com/a/46433245/3929620
. /opt/bitnami/scripts/jenkins/entrypoint.sh
