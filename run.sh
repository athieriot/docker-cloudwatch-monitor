#!/bin/bash


CMD="./mon-put-instance-data.pl --mem-util --mem-used --mem-avail --swap-util --swap-used --disk-path=$DISK_PATH --disk-space-util --disk-space-avail --disk-space-used"

if [[ -v AWS_IAM_ROLE ]]; then
  CMD="$CMD --aws-iam-role=$AWS_IAM_ROLE"
fi

if [[ -v AWS_ACCESS_KEY_ID ]]; then
  CMD="$CMD --aws-access-key-id=$AWS_ACCESS_KEY_ID"
fi

if [[ -v AWS_SECRET_ACCESS_KEY ]]; then
  CMD="$CMD --aws-secret-key=$AWS_SECRET_ACCESS_KEY"
fi

if [[ -v AUTO_SCALING ]] && [ $AUTO_SCALING = true ]; then
  CMD="$CMD --auto-scaling"
fi

$CMD
