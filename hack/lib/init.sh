#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

export PROJ_PACKAGE=github.com/ikaven1024/awesome-go

export OUT_DIR=${PROJ_ROOT}/_output

source ${PROJ_ROOT}/hack/lib/logger.sh
source ${PROJ_ROOT}/hack/lib/version.sh
source ${PROJ_ROOT}/hack/lib/golang.sh

declare -r color_start="\033["
declare -r color_red="${color_start}0;31m"
declare -r color_yellow="${color_start}0;33m"
declare -r color_green="${color_start}0;32m"
declare -r color_norm="${color_start}0m"
