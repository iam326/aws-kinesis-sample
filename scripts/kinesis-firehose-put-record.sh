#!/bin/bash

set -euo pipefail

source ../config.sh

STREAM_NAME=${KINESIS_FIREHOSE_NAME}
if [ $# = 2 ]; then
  STREAM_NAME="${KINESIS_FIREHOSE_NAME}-2"
fi

echo ${STREAM_NAME}

aws firehose put-record \
  --delivery-stream-name ${STREAM_NAME} \
  --record "Data=$1"
