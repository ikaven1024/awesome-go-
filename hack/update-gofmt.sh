#!/bin/bash

PROJ_ROOT=$(cd `dirname $0`/..; pwd -P)
source ${PROJ_ROOT}/hack/lib/init.sh

GOFMT="gofmt -s -w"
golang::find_go_files | xargs $GOFMT
