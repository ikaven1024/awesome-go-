#!/bin/bash

PROJ_ROOT=$(cd `dirname $0`/..; pwd -P)
source ${PROJ_ROOT}/hack/lib/init.sh

set -o errexit
set -o nounset
set -o pipefail

golang::setup_env

goldflags="${GOLDFLAGS:-} $(version::ldflags)"

go_mains=`go list ./cmd/...`
log::status "Building:" ${go_mains[@]}
CGO_ENABLED=0 go install -ldflags "${goldflags}" -installsuffix cgo ${go_mains[@]}
log::status "Binaries are put into ${GOBIN}"

