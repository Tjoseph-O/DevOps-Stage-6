#!/bin/bash

set -e

cd infra/terraform

# Run terraform plan and capture output
terraform plan -detailed-exitcode -out=tfplan > plan_output.txt 2>&1 || EXIT_CODE=$?

# Exit code 0 = no changes, 1 = error, 2 = changes detected
if [ "${EXIT_CODE}" == "2" ]; then
    echo "DRIFT_DETECTED=true" >> $GITHUB_OUTPUT
    echo "::warning::Infrastructure drift detected!"
    
    # Extract plan details
    terraform show -no-color tfplan > drift_details.txt
    
    exit 0
elif [ "${EXIT_CODE}" == "1" ]; then
    echo "DRIFT_DETECTED=error" >> $GITHUB_OUTPUT
    echo "::error::Terraform plan failed"
    exit 1
else
    echo "DRIFT_DETECTED=false" >> $GITHUB_OUTPUT
    echo "No infrastructure drift detected"
    exit 0
fi