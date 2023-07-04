#!/bin/bash

SERVICE_ACCOUNT=dbt-sa
SERVICE_NAME=dbt-service

gcloud builds submit \
  --tag gcr.io/$(gcloud config get-value project)/${SERVICE_NAME}

gcloud run deploy ${SERVICE_NAME} \
    --image gcr.io/$(gcloud config get-value project)/${SERVICE_NAME} \
    --service-account ${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
    --platform managed \
    --no-allow-unauthenticated