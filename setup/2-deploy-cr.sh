#!/bin/bash

SERVICE_ACCOUNT=dbt-sa
SERVICE_NAME=dbt-service
REGION=europe-west2 # e.g. europe-west2

gcloud builds submit \
  --tag gcr.io/$(gcloud config get-value project)/${SERVICE_NAME}

gcloud run deploy ${SERVICE_NAME} --region $REGION \
    --image gcr.io/$(gcloud config get-value project)/${SERVICE_NAME} \
    --service-account ${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
    --platform managed \
    --no-allow-unauthenticated