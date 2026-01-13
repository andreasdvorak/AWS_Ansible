#!/bin/bash
#
# Create AWS Data Lifecycle Manager Snapshot Policy
# There is not yet a dedicated Ansible module for this task
# Ref: https://docs.aws.amazon.com/cli/latest/reference/dlm/create-lifecycle-policy.html
# When you get this error:
# An error occurred (AccessDeniedException) when calling the CreateLifecyclePolicy operation: Cross-account pass role is not allowed.
# create the policy in the AWS Console instead

### variables
aws_region="eu-central-1"
aws_snapshot_policy_name="DailySnapshotPolicy"
aws_snapshot_policy_description="Daily snapshot policy created by Ansible"
aws_snapshot_policy_create_interval=24
aws_snapshot_policy_retain_interval=7

### main
aws dlm create-lifecycle-policy \
    --region "${aws_region}" \
    --execution-role-arn "arn:aws:iam::123456789012:role/AWSDataLifecycleManagerDefaultRole" \
    --description "${aws_snapshot_policy_description}" \
    --state ENABLED \
    --policy-details "{
        \"ResourceTypes\": [\"VOLUME\"],
        \"TargetTags\": [{\"Key\": \"Snapshot\", \"Value\": \"true\"}],
        \"Schedules\": [{
            \"Name\": \"${aws_snapshot_policy_name}\",
            \"CreateRule\": {\"Interval\": ${aws_snapshot_policy_create_interval}, \"IntervalUnit\": \"HOURS\"},
            \"RetainRule\": {\"Count\": ${aws_snapshot_policy_retain_interval}},
            \"CopyTags\": true
        }]
    }"
