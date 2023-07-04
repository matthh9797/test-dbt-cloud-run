#!/bin/bash

SERVICE_NAME=dbt-service
SERVICE_URL="$(gcloud run services describe dbt-service --format 'value(status.url)')"
REGION=europe-west2 # e.g. europe-west2
SERVICE_ACCOUNT=dbt-scheduler-sa

gcloud scheduler jobs create http ${SERVICE_NAME}-job --schedule "*/5 * * * *" \
   --http-method=GET \
   --location=${REGION} \
   --uri=${SERVICE_URL} \
   --oidc-service-account-email=${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
   --oidc-token-audience=${SERVICE_URL}

# Test the scheduler
gcloud scheduler jobs run ${SERVICE_NAME}-job --location ${REGION}