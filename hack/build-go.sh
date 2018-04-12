#! /bin/bash

set -o errexit
set -o nounset
set -o pipefail

ORG_PATH="github.com/ikaven1024"
REPO_PATH="$ORG_PATH/awesome-go"

PROJ_ROOT=$(dirname "${BASH_SOURCE}")
echo $PROJ_ROOT