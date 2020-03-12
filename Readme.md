# Docker CloudWatch Monitor

Docker container that will periodically send EC2 instance metrics to Amazon CloudWatch

Usage:

Run with an AWS IAM Role:

      docker run -d \
        -e AWS_IAM_ROLE=<AWS IAM Role> \
        --name=cloudwatch-monitor \
        athieriot/cloudwatch-monitor

To run with an AWS Credentials replace AWS_IAM_ROLE with AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:

      docker run -d \
        -e AWS_ACCESS_KEY_ID=<Amazon Key> \
        -e AWS_SECRET_ACCESS_KEY=<Amazon secret> \
        --name=cloudwatch-monitor \
        athieriot/cloudwatch-monitor

All metrics are recorded:

      --mem-util          Reports memory utilization in percentages.
      --mem-used          Reports memory used in megabytes.
      --mem-avail         Reports available memory in megabytes.

      --swap-util         Reports swap utilization in percentages.
      --swap-used         Reports allocated swap space in megabytes.

      --disk-path=PATH    Selects the disk by the path on which to report.
      --disk-space-util   Reports disk space utilization in percentages.
      --disk-space-used   Reports allocated disk space in gigabytes.
      --disk-space-avail  Reports available disk space in gigabytes

      --auto-scaling      Reports Auto Scaling metrics in addition to instance metrics.

By default, metrics will be send once per 60 seconds. This can be change using FREQUENCY variable:

      docker run -d \
        -e FREQUENCY=120 \
        -e AWS_IAM_ROLE=<AWS IAM Role> \
        --name=cloudwatch-monitor \
        athieriot/cloudwatch-monitor

The disk space and usage will be the one of the host machine. This can be configured:

      docker run -d \
        -e DISK_PATH=/media/disk \
        -e AWS_IAM_ROLE=<AWS IAM Role> \
        --name=cloudwatch-monitor \
        athieriot/cloudwatch-monitor

Inspired from [Octobly](https://hub.docker.com/r/octoblu/cloudwatch-monitor/)
