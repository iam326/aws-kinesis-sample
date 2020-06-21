#!/bin/bash

set -euo pipefail

readonly PROJECT_NAME="aws-kinesis-sample"
readonly FIREHOSE_DEST_BUCKET_NAME="${PROJECT_NAME}-firehose-dest-bucket"
readonly KINESIS_STREAM_NAME="${PROJECT_NAME}-kinesis-stream"
readonly KINESIS_FIREHOSE_NAME="${PROJECT_NAME}-kinesis-firehose"
