#!/bin/bash

PROJ_ROOT=$(cd `dirname $0`/..; pwd -P)
source ${PROJ_ROOT}/hack/lib/init.sh

golang::setup_env

eval "goflags=(${GOFLAGS:-})"

_find_go_test_packages() {
  find -L . -not \( \
        \( \
          -path './_output/*' \
          -o -path './vendor/*' \
        \) -prune \
      \) -name '*_test.go' -print0 | xargs -0n1 dirname | sed "s|^\./|${PROJ_PACKAGE}/|" | LC_ALL=C sort -u
}

go test "${goflags[@]:+${goflags[@]}}" $(_find_go_test_packages)
