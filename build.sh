#!/bin/bash

# set -e: don't tolerate non-zero exit status for any command
# set -u: only allow referencing of variables if they were previously defined
# set -o pipefail: prevent errors in a pipeline from being masked
set -euo pipefail

NAME=aventurini/ci-ruby:2.1-dev
docker build -t $NAME .
