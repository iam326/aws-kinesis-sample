#!/bin/bash

set -euo pipefail

source ../config.sh

STACK_NAME="${PROJECT_NAME}-backend"
ARTIFACT_BUCKET_NAME="iam326.${PROJECT_NAME}-artifact"

# aws s3 mb "s3://${ARTIFACT_BUCKET_NAME}"

sam package \
  --output-template-file packaged.yaml \
  --s3-bucket ${ARTIFACT_BUCKET_NAME}

sam deploy \
  --template-file packaged.yaml \
  --stack-name ${STACK_NAME} \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
    FirehoseDestBucketName=${FIREHOSE_DEST_BUCKET_NAME} \
    KinesisStreamName=${KINESIS_STREAM_NAME} \
    KinesisFirehoseName=${KINESIS_FIREHOSE_NAME}

rm packaged.yaml
