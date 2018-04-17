#!/bin/bash

function version::ldflags() {
    _get_version_vars

    local -a ldflags=(
        $(_ldflag "buildDate" $(date -u +'%Y-%m-%dT%H:%M:%SZ'))
        $(_ldflag "gitCommit" ${GIT_COMMIT})
        $(_ldflag "gitTreeState" ${GIT_TREE_STATE})
        $(_ldflag "gitVersion" ${GIT_VERSION})
    )
    echo "${ldflags[*]-}"
}

# Get version vars based git tag:
#   - GIT_COMMIT
#   - GIT_VERSION
#   - GIT_TREE_STATE
_get_version_vars() {
    GIT_COMMIT=$(git rev-parse "HEAD^{commit}")

    GIT_VERSION=$(git describe --tags ${GIT_COMMIT}) ret=0 || ret=$?
    if [[ $ret -eq 1 ]]; then
        log::fatal 'Cannot get version without git tag. Run `git tag <tagname>` to create a git tag'
    fi

    if local git_status=$("${git[@]}" status --porcelain 2>/dev/null) && [[ -z ${git_status} ]]; then
        GIT_TREE_STATE="clean"
    else
        GIT_TREE_STATE="dirty"
    fi
}

_ldflag() {
    echo "-X '${PROJ_PACKAGE}/pkg/version.${1}=${2}'"
}
