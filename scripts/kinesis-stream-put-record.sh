#!/bin/bash

set -euo pipefail

source ../config.sh

aws kinesis put-record \
  --stream-name ${KINESIS_STREAM_NAME} \
  --partition-key 1 \
  --data $1
