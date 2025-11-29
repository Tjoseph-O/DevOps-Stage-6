#!/bin/bash

TO_EMAIL=$1
DRIFT_DETAILS=$2

# Using AWS SES or SendGrid
curl -X POST https://api.sendgrid.com/v3/mail/send \
  -H "Authorization: Bearer ${SENDGRID_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{
    \"personalizations\": [{
      \"to\": [{\"email\": \"${TO_EMAIL}\"}],
      \"subject\": \"⚠️ Terraform Drift Detected\"
    }],
    \"from\": {\"email\": \"devops@yourdomain.com\"},
    \"content\": [{
      \"type\": \"text/plain\",
      \"value\": \"Infrastructure drift detected:\n\n${DRIFT_DETAILS}\"
    }]
  }"