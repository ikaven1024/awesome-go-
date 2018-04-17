#!/bin/bash

PROJ_ROOT=$(cd `dirname $0`/..; pwd -P)
source ${PROJ_ROOT}/hack/lib/init.sh

golang::setup_env

diff=$(golang::find_go_files | xargs gofmt -d -s 2>&1) || true
if [[ -n "${diff}" ]]; then
  echo "${diff}" >&2
  echo >&2
  echo "Run ./hack/update-gofmt.sh" >&2
  exit 1
fi
