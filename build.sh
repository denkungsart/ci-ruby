#!/bin/bash

# set -e: don't tolerate non-zero exit status for any command
# set -u: only allow referencing of variables if they were previously defined
# set -o pipefail: prevent errors in a pipeline from being masked
set -euo pipefail

TAG=2.1.8
NAME=aventurini/ci-ruby:"$TAG"

docker build -t "$NAME" .
docker push "$NAME"
