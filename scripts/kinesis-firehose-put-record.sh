#!/bin/bash

set -euo pipefail

source ../config.sh

aws firehose put-record \
  --delivery-stream-name ${KINESIS_FIREHOSE_NAME} \
  --record "Data=$1"
