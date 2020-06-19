#!/bin/bash

set -euo pipefail

PROJECT_NAME="aws-kinesis-sample"
STACK_NAME="${PROJECT_NAME}-backend"
ARTIFACT_BUCKET_NAME="iam326.${PROJECT_NAME}-artifact"

aws s3 mb "s3://${ARTIFACT_BUCKET_NAME}"

sam package \
  --output-template-file packaged.yaml \
  --s3-bucket ${ARTIFACT_BUCKET_NAME}

sam deploy \
  --template-file packaged.yaml \
  --stack-name ${STACK_NAME} \
  --capabilities CAPABILITY_IAM

rm packaged.yaml
