#!/bin/bash

PROJ_ROOT=$(cd `dirname $0`/..; pwd -P)
source ${PROJ_ROOT}/hack/lib/init.sh

cd ${PROJ_ROOT}
declare -i fails=0
for b in $(ls hack/verify-*.sh); do
    echo -e "${color_yellow}Running ${b}${color_norm}"
    if ! bash ${b}; then
        echo -e "${color_red}Running ${b} FAILED${color_norm}"
        fails+=1
    fi
done

if [[ -n ${fails} ]]; then
    exit ${fails}
fi
