#!/bin/bash

script_dir="$( dirname "${0}" )"

IMAGE_TAG="latest"

# shellcheck disable=SC2199
if [[ "${@}" != "" ]];then
    # shellcheck disable=SC2124
    IMAGE_TAG="${@}"
fi

sudo docker build -t getpinry/pinry:${IMAGE_TAG} "${script_dir}/../" \
  -f "${script_dir}/../Dockerfile.autobuild"
