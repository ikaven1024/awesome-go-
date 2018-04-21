#!/bin/bash

function log::info() {
    for item; do
        echo "$item"
    done
}

function log::fatal() {
    local message="${1:-}"
    local code="${2:-1}"

    [[ -z ${message} ]] || {
        echo ${message} >&2
    }
    echo "Exiting with status ${code}" >&2
    exit ${code}
}

function log::status() {
    echo "+++ $(date +"[%m%d %H:%M:%S]") $1"
    shift
    for message; do
        echo "    $message"
    done
}
