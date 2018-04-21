#!/bin/bash

GO_LDFLAGS="GO_LDFLAGS -X "

function golang::setup_env() {
    export GOBIN="${OUT_DIR}/local/bin"
    export GOPATH="${OUT_DIR}/local/go"

    local dir="${GOPATH}/src/${PROJ_PACKAGE}"
    rm -rf ${dir} && mkdir -p $(dirname "${dir}")
    ln -snf ${PROJ_ROOT} ${dir} 2>/dev/null || true
    cd ${dir}
}

function golang::find_go_files() {
  find . -not \( \
      \( \
        -wholename './_output' \
        -o -wholename '*/vendor/*' \
      \) -prune \
    \) -name '*.go'
}

